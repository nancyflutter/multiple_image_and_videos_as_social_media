import 'package:flutter/foundation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/bookmark_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/bookmarks_place_model.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/bookmarks_response.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/model/api_response_model.dart';
import '../../../core/core.dart';

class FavouritesScreenController extends GetxController with GetTickerProviderStateMixin {
  final ItemScrollController scrollControllerItem = ItemScrollController();
  final appController = Get.find<AppController>();
  RxInt typeIndex = RxInt(0);
  Rx<BookmarkResponse> getAllBookMarkedData = Rx(BookmarkResponse());
  RxString userBaseUrl = RxString('http://www.staging.appwander.com');
  RxList<BookmarksPlaceModel> getBookMarkedPlaces = RxList([]);
  RxList<Post> getBookMarkedPost = RxList<Post>([]);
  RxList<GetPostCommentResponse> postsCommentList = RxList([]);
  Rx<AddCommentResponse> addCommentData = Rx(AddCommentResponse());
  Rx<ApiResponseModel> addLikeData = Rx(ApiResponseModel(statusCode: 0));
  Rx<TextEditingController> serviceController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> reportController = Rx<TextEditingController>(TextEditingController());
  RxString unreadCount = RxString("");
  Rx<TextEditingController> sendMessageController = Rx(TextEditingController());
  RxList<bool> isHeartVisibleList = RxList([]);
  late AnimationController heartAnimationController;
  late Animation<double> heartAnimation;
  RxInt currentIndex = RxInt(0);
  RxInt index = RxInt(0);
  RxString postId = RxString("");
  Rx<ScrollController> scrollController = Rx(ScrollController());
  RxBool isCommentLoading = RxBool(false);
  var currentIndexMap = RxMap<int, int>({1: 1});

  @override
  void onInit() async {
    MountedCallbackExecutor.ensureIsThatMounted(() => getBookMarksList());
    if (getBookMarkedPost.isNotEmpty) {
      heartAnimationController = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      );

      heartAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(heartAnimationController);

      isHeartVisibleList.value = List<bool>.filled(getBookMarkedPost.length, false);
    }
    scrollToTappedIndex();
    super.onInit();
  }

  /// ADD LIKE API
  Future<void> addLikeAPI({required int index, bool isAnimate = true}) async {
    if (getBookMarkedPost.isEmpty) {
      print("The list is empty, cannot perform the operation.");
      return;
    }

    if (index < 0 || index >= getBookMarkedPost.length) {
      print("Invalid index: $index");
      return;
    }

    bool initialLikeStatus = getBookMarkedPost[index].liked == 1;
    bool newLikeStatus = !initialLikeStatus;

    int likeCount = getBookMarkedPost[index].likes ?? 0;
    likeCount = newLikeStatus ? likeCount + 1 : likeCount - 1;

    getBookMarkedPost[index].liked = newLikeStatus ? 1 : 0;
    getBookMarkedPost[index].likes = likeCount;
    getBookMarkedPost.refresh();

    if (isAnimate) {
      isHeartVisibleList[index] = true;
      isHeartVisibleList.refresh();

      heartAnimationController.forward(from: 0).whenComplete(() {
        Future.delayed(const Duration(milliseconds: 300), () {
          isHeartVisibleList[index] = false;
          isHeartVisibleList.refresh();
        });
      });
    }

    AddLikePayLoad payLoad = AddLikePayLoad(
      postId: getBookMarkedPost[index].id.toString(),
      userId: appController.loginResponse.value.userId.toString(),
      postUserId: (getBookMarkedPost[index].user?.isNotEmpty ?? false) ? (getBookMarkedPost[index].user?[0].id?.toString()) : (getBookMarkedPost[index].supplier?[0].id?.toString()),
      type: "u",
      like: newLikeStatus ? "1" : "0",
    );

    final addLikeResponse = await ApiRepository.addLikeApi(payLoad);
    if (addLikeResponse != null) {
      final responseBody = addLikeResponse;
      if (responseBody.responseData == 'Liked' || responseBody.responseData == 'dislike') {
        print("::::::::: Success ::::::::: ${responseBody.responseData}");
      } else {
        print("Unexpected response data: $responseBody");
      }
    } else {
      print("Failed to update like status.");
    }
  }

  void scrollToTappedIndex() {
    if (Get.arguments != null && Get.arguments["post_index"] != null) {
      int tappedIndex = Get.arguments["post_index"];
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollControllerItem != null && getBookMarkedPost.isNotEmpty) {
          scrollControllerItem.jumpTo(index: tappedIndex);
        }
      });
    }
  }

  /// Get BookMark List
  Future<void> getBookMarksList() async {
    BookmarkPayload bookmarkPayload = BookmarkPayload(
      userId: appController.loginResponse.value.userId,
      bookmarkType: typeIndex.value == 0 ? 'places' : 'posts',
    );

    BookmarkResponse? bookmarkResponse = await ApiRepository.getBookMarks(bookmarkPayload.toMap());
    if (bookmarkResponse != null) {
      getAllBookMarkedData.value = bookmarkResponse;
    }
    if (typeIndex.value == 0) {
      if (getBookMarkedPlaces.isNotEmpty) {
        getBookMarkedPlaces.clear();
      }
      if (bookmarkResponse?.supplier != null) {
        for (int i = 0; i < (bookmarkResponse?.supplier?.length ?? 0); i++) {
          var data = bookmarkResponse?.supplier?[i];
          getBookMarkedPlaces.add(
            BookmarksPlaceModel(
              id: data?.id.toString() ?? '',
              image: '${ApiEndPoints.imageBaseUrl}${data?.image ?? ''}',
              address: data?.supplierAddress ?? '',
              serviceName: data?.serviceName ?? '',
              rating: (data?.rating?.isNotEmpty ?? false) ? (data?.rating?[0].rating.toString() ?? '') : '',
              type: 'supplier',
            ),
          );
        }
      }
      if (bookmarkResponse?.restaurant != null) {
        for (int i = 0; i < (bookmarkResponse?.restaurant?.length ?? 0); i++) {
          var data = bookmarkResponse?.restaurant?[i];
          getBookMarkedPlaces.add(
            BookmarksPlaceModel(
              id: data?.id.toString() ?? '',
              image: data?.attributes?.imageUrl ?? '',
              address: '${data?.attributes?.addressLine1 ?? ''},${data?.attributes?.addressLine2 ?? ''},${data?.attributes?.city ?? ''}',
              serviceName: data?.attributes?.name ?? '',
              rating: data?.attributes?.ratingsAverage ?? '',
              type: 'restaurant',
            ),
          );
          if (kDebugMode) {
            print("restaurent data ::::::::: ${getAllBookMarkedData.value.restaurant?[0].attributes?.cuisine}");
          }
        }
      }
      if (kDebugMode) {
        print("getBookMarkedPlaces data :::::::: ${getBookMarkedPlaces.length}");
      }
    } else {
      if (bookmarkResponse?.post != null) {
        getBookMarkedPost.value = bookmarkResponse?.post ?? [];
      }
    }
  }

  /// Get POSTS COMMENT LIST API
  postsCommentsListAPI({required String id}) async {
    isCommentLoading.value = true;
    GetPostCommentPayLoad payLoad = GetPostCommentPayLoad(
      postId: id,
    );

    var postCommentResponse = await ApiRepository.postsCommentApi(bodyData: payLoad);
    if (postCommentResponse != null) {
      isCommentLoading.value = false;
      postsCommentList.value = postCommentResponse;
      sendMessageController.value.clear();
      getBookMarksList();
      if (kDebugMode) {
        print("object:::::::::::::::::::::::::::${postsCommentList.length}");
      }
    } else {
      if (kDebugMode) {
        print("fail to fetch POST DATA");
      }
    }
  }

  /// ADD COMMENT API
  addCommentsAPI({required String postId, required int index}) async {
    if (index < 0 || index >= getBookMarkedPost.length) {
      if (kDebugMode) {
        print("Invalid index");
      }
      return;
    }

    AddCommentPayLoad payLoad = AddCommentPayLoad(
      postId: getBookMarkedPost[index].id.toString(),
      userId: appController.loginResponse.value.userId.toString(),
      comment: sendMessageController.value.text.trim(),
      postUserId: (getBookMarkedPost[index].user?.isNotEmpty ?? false) ? (getBookMarkedPost[index].user?[0].id?.toString()) : (getBookMarkedPost[index].supplier?[0].id?.toString()),
      type: "u",
    );

    var addCommentResponse = await ApiRepository.addCommentApi(payLoad.toMap());
    if (addCommentResponse != null) {
      if (scrollController.value.hasClients) {
        scrollController.value.animateTo(
          scrollController.value.position.minScrollExtent,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
        );
      } else {
        if (kDebugMode) {
          print("ScrollController is not attached to any scroll views.");
        }
      }

      addCommentData.value = addCommentResponse;
      await postsCommentsListAPI(id: postId);
      if (kDebugMode) {
        print("Comment added successfully. Current comment list length: ${postsCommentList.length}");
      }
    } else {
      if (kDebugMode) {
        print("Failed to fetch POST DATA");
      }
    }
  }

  /// ADD BOOKMARK API
  addBookMarkAPI({required String id}) async {
    AddBookMarkPayLoad payLoad = AddBookMarkPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
      bookmarkId: id,
      bookmarkType: "post",
    );

    var addBookMarkResponse = await ApiRepository.addBookMarkApi(payLoad);
    if (addBookMarkResponse != null) {
      await getBookMarksList();
    } else {
      if (kDebugMode) {
        print("fail implementation");
      }
    }
  }


  /// ADD BOOKMARK API
  restaurantAddBookMarkAPI({required String id}) async {
    AddBookMarkPayLoad payLoad = AddBookMarkPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
      bookmarkId: id,
      bookmarkType: "restaurant",
    );

    var addBookMarkResponse = await ApiRepository.addBookMarkApi(payLoad);
    if (addBookMarkResponse != null) {
      await getBookMarksList();
    } else {
      if (kDebugMode) {
        print("Fail implementation");
      }
    }
  }

  /// ADD BOOKMARK API
  supplierAddBookMarkAPI({required String id}) async {
    AddBookMarkPayLoad payLoad = AddBookMarkPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
      bookmarkId: id,
      bookmarkType: "supplier",
    );

    var addBookMarkResponse = await ApiRepository.addBookMarkApi(payLoad);
    if (addBookMarkResponse != null) {
      await getBookMarksList();
    } else {
      if (kDebugMode) {
        print("fail implementation");
      }
    }
  }

  /// DELETE POST API
  deletePostAPI({required String id}) async {
    PostDeletePayLoad payLoad = PostDeletePayLoad(
      postId: id,
    );

    var deletePostResponse = await ApiRepository.deletePostApi(payLoad);
    if (deletePostResponse != null) {
      await getBookMarksList();
    } else {
      if (kDebugMode) {
        print("fail to delete post.");
      }
    }
  }

  /// Report API
  reportPostAPI({required String id}) async {
    ReportPostPayLoad payLoad = ReportPostPayLoad(
      postId: id,
      userId: appController.loginResponse.value.userId.toString(),
      report: reportController.value.text.trim(),
      type: "u",
    );

    var reportPostResponse = await ApiRepository.reportPostApi(payLoad);
    if (reportPostResponse != null) {
      Get.back();
      Get.back();
      reportController.value.clear();
    } else {
      if (kDebugMode) {
        print("fail to report post.");
      }
    }
  }

  /// in notification screen - get time in ago format
  String getTimeAgo(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    DateTime now = DateTime.now();
    Duration difference = now.difference(parsedDate);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} second ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour ago';
    } else if (difference.inDays >= 7) {
      if (difference.inDays > 360) {
        return '${(difference.inDays / 360).floor()} year ago';
      } else if (difference.inDays > 30) {
        return '${(difference.inDays / 30).floor()} month ago';
      } else {
        return '${(difference.inDays / 7).floor()} week ago';
      }
    } else {
      return '${difference.inDays} day ago';
    }
  }

  String uTCToLocal(String date, String dateFormatInPut, String dateFormatOutPut) {
    DateFormat inputFormat = DateFormat(dateFormatInPut);
    DateTime utcDate = inputFormat.parse(date, true).toUtc();
    DateTime localDate = utcDate.toLocal();
    DateFormat outputFormat = DateFormat(dateFormatOutPut);
    return outputFormat.format(localDate);
  }
}
