import 'package:flutter/foundation.dart';
import 'package:multiple_image_and_videos_as_social_media/core/core.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/controller/notification_post_detail_controller.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/controller/user_account_get_profile_controller.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/add_bookmark_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/add_comment_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/add_comment_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/add_like_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/delete_post_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/get_post_comment_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/get_post_response_model.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/post_payload_model.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/posts_comment_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/report_post_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/user_activity_list_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/user_activity_list_response.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/model/api_response_model.dart';

class FeedScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  RxList<bool> isHeartVisibleList = RxList<bool>();
  late AnimationController heartAnimationController;
  late Animation<double> heartAnimation;
  RxString mediaBaseUrl = RxString('https://www.staging.appwander.com/test/social_media/public/media/');
  RxString userBaseUrl = RxString('http://www.staging.appwander.com/upload/user/');
  RxString supplierBaseUrl = RxString('http://www.staging.appwander.com/upload/supplier/');
  RxString str = RxString("");
  RxString timeAgo = RxString("");
  Rx<TextEditingController> serviceController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> reportController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> sendMessageController = Rx(TextEditingController());
  var currentIndexMap = RxMap<int, int>({});
  RxBool isLoading = RxBool(false);
  RxList<GetPostResponse> postDataList = RxList([]);
  RxList<GetPostCommentResponse> postsCommentList = RxList([]);
  final appController = Get.find<AppController>();
  Rx<AddCommentResponse> addCommentData = Rx(AddCommentResponse());
  Rx<ApiResponseModel> addLikeData = Rx(ApiResponseModel(statusCode: 0));
  RxList<UserActivityListResponse> userActivityDataList = RxList([]);
  Rx<ScrollController> scrollController = Rx(ScrollController());
  RxInt index = RxInt(0);
  RxString postId = RxString("");
  RxBool isFeedLoading = RxBool(false);

  @override
  void onInit() {
    MountedCallbackExecutor.ensureIsThatMounted(
      () => getPostDataAPI(),
    );
    MountedCallbackExecutor.ensureIsThatMounted(
      () => userActivityListAPI(),
    );
    heartAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    heartAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(heartAnimationController);

    ever(postDataList, (_) => initializeHeartVisibility());
    super.onInit();
  }

  void initializeHeartVisibility() {
    isHeartVisibleList.value = List<bool>.filled(postDataList.length, false);
  }

  /// Get POST DATA
  RxString unreadCount = RxString("");

  getPostDataAPI({bool isLoading = true}) async {
    isFeedLoading.value = true;
    PostPayLoad payLoad = PostPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
    );

    var postDataResponse = await ApiRepository.postDataApi(bodyData: payLoad, isLoading: isLoading);
    if (postDataResponse != null) {
      postDataList.value = postDataResponse;
      // postDataList.value = postDataResponse.postData ?? [];
    } else {
      if (kDebugMode) {
        print("fail to fetch POST DATA");
      }
    }
    isFeedLoading.value = false;
  }

  /// GET POSTS COMMENT LIST API
  postsCommentsListAPI({required String id}) async {
    isLoading.value = true;
    GetPostCommentPayLoad payLoad = GetPostCommentPayLoad(
      postId: id,
    );

    var postCommentResponse = await ApiRepository.postsCommentApi(bodyData: payLoad);
    if (postCommentResponse != null) {
      postsCommentList.value = postCommentResponse;
      sendMessageController.value.clear();
      getPostDataAPI();

      if (kDebugMode) {
        print("object:::::::::::::::::::::::::::${postsCommentList.length}");
      }
    } else {
      if (kDebugMode) {
        print("fail to fetch POST DATA");
      }
    }
    isLoading.value = false;
  }

  /// ADD COMMENT API
  addCommentsAPI({required String postId, int? index, required bool isNotificationScreen}) async {
    if (isNotificationScreen) {
      final notificationCnt = Get.find<NotificationPostDetailController>();
      AddCommentPayLoad payLoad = AddCommentPayLoad(
        postId: postId,
        userId: appController.loginResponse.value.userId.toString(),
        comment: sendMessageController.value.text.trim(),
        postUserId: notificationCnt.notificationPostDetailList.first.publisherId.toString(),
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
        }
        addCommentData.value = addCommentResponse;
        final notificationCnt = Get.find<NotificationPostDetailController>();
        await notificationCnt.notificationPostDetailAPI(id: postId);
        await postsCommentsListAPI(id: postId);
        if (kDebugMode) {
          print("Comment added successfully. Current comment list length: ${postsCommentList.length}");
        }
      } else {
        if (kDebugMode) {
          print("Failed to fetch POST DATA");
        }
      }
    } else {
      if (index == null || index < 0 || index >= postDataList.length) {
        if (kDebugMode) {
          print("Invalid index");
        }
        return;
      }

      AddCommentPayLoad payLoad = AddCommentPayLoad(
        postId: postId,
        userId: appController.loginResponse.value.userId.toString(),
        comment: sendMessageController.value.text.trim(),
        postUserId: postDataList[index].user?.id?.toString() ?? postDataList[index].supplier?.id?.toString() ?? "",
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
        }
        addCommentData.value = addCommentResponse;
        await postsCommentsListAPI(id: postId);
        await getPostDataAPI();
        print("~~~~~~~~~~~~~~~~~~~~~ update profile detail post data ~~~~~~~~~~~~~~~~~~~~~~~~~");
        Get.put<ProfileScreenController>(ProfileScreenController());
        final profileScreenCnt = Get.find<ProfileScreenController>();
        await profileScreenCnt.userProfileAPI();

        print("~~~~~~~~~~~~~~~~~~~~~ update consumer detail post detail page ~~~~~~~~~~~~~~~~~~~~~~~~~");
        Get.put<UserAccountGetProfileController>(UserAccountGetProfileController());
        final consumerCnt = Get.find<UserAccountGetProfileController>();
        await consumerCnt.userAccountGetProfileAPI(userId: consumerCnt.userId.value);

        print("~~~~~~~~~~~~~~~~~~~~~ update service detail post detail page ~~~~~~~~~~~~~~~~~~~~~~~~~");
        Get.put<ServiceDetailScreenController>(ServiceDetailScreenController());
        final serviceCnt = Get.find<ServiceDetailScreenController>();
        await serviceCnt.bookmarkServiceDetailApi(serviceCnt.id.value);
      } else {
        if (kDebugMode) {
          print("Failed to fetch POST DATA");
        }
      }
    }
  }

  /// ADD LIKE API
  Future<void> addLikeAPI({required int index, bool isAnimate = true}) async {
    if (index < 0 || index >= postDataList.length) {
      if (kDebugMode) {
        print("Invalid index: $index");
      }
      return;
    }

    bool initialLikeStatus = postDataList[index].liked == 1;
    bool newLikeStatus = !initialLikeStatus;

    int likeCount = postDataList[index].likes ?? 0;
    likeCount = newLikeStatus ? likeCount + 1 : likeCount - 1;

    postDataList[index].liked = newLikeStatus ? 1 : 0;
    postDataList[index].likes = likeCount;
    postDataList.refresh();

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
      postId: postDataList[index].id.toString(),
      userId: appController.loginResponse.value.userId.toString(),
      postUserId: postDataList[index].user?.id?.toString() ?? postDataList[index].supplier?.id?.toString() ?? "",
      type: "u",
      like: newLikeStatus ? "1" : "0",
    );

    final addLikeResponse = await ApiRepository.addLikeApi(payLoad);
    if (addLikeResponse != null) {
      final responseBody = addLikeResponse;
      if (addLikeResponse.responseData == 'Liked' || addLikeResponse.responseData == 'dislike') {
        print("Success:::::: ${addLikeResponse.responseData}");
      } else {
        print("Unexpected response data: $responseBody");
      }
    } else {
      print("Failed to update like status.");
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
      await getPostDataAPI(isLoading: false);
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
      await getPostDataAPI(isLoading: false);
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

  /// USER ACTIVITY LIST API
  userActivityListAPI() async {
    UserActivityListPayLoad payLoad = UserActivityListPayLoad(
      type: "u",
      userId: appController.loginResponse.value.userId.toString(),
    );

    var userActivityResponse = await ApiRepository.userActivityListApi(bodyData: payLoad);
    if (userActivityResponse != null) {
      userActivityDataList.value = userActivityResponse;
    } else {
      if (kDebugMode) {
        print("fail to get user activity data list");
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

  @override
  void onClose() {
    heartAnimationController.dispose();
    super.onClose();
  }
}
