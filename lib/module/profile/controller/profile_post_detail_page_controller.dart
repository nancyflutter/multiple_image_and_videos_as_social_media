import 'package:flutter/foundation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:wanderconsumer_android_flutter/module/profile/model/profile_response.dart';
// import 'package:wanderconsumer_android_flutter/module/home/model/user_service_detail/user_service_detail_response.dart';
import '../../../core/core.dart';
import '../../../services/api/api.dart';

class ProfilePostDetailPageController extends GetxController with GetSingleTickerProviderStateMixin {
  Rx<TextEditingController> reportController = Rx<TextEditingController>(TextEditingController());
  final ItemScrollController itemScrollController = ItemScrollController();
  RxList<GetPostCommentResponse> postsCommentList = RxList([]);
  RxList<bool> isHeartVisibleList = RxList([]);
  late AnimationController heartAnimationController;
  late Animation<double> heartAnimation;
  // RxList<Post> postDataList = RxList<Post>([]);
  var postDataList;
  final appController = Get.find<AppController>();
  RxString mediaBaseUrl = RxString('https://www.staging.appwander.com/test/social_media/public/media/');
  RxString userBaseUrl = RxString('http://www.staging.appwander.com/upload/user/');
  RxString supplierBaseUrl = RxString('http://www.staging.appwander.com/upload/supplier/');
  RxString image = RxString('');
  RxString name = RxString('');
  // RxInt currentIndex = RxInt(0);
  RxInt index = RxInt(0);
  var currentIndexMap = RxMap<int, int>({1: 1});

  @override
  void onInit() {
    postDataList = Get.arguments["postData"];
    index.value = Get.arguments['index'];
    image.value = Get.arguments['image'].toString();
    name.value = Get.arguments['name']?.toString() ?? "${appController.loginResponse.value.fullName}";

    heartAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    heartAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(heartAnimationController);

    isHeartVisibleList.value = List<bool>.filled(postDataList.length, false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemScrollController.jumpTo(
        index: index.value,
      );
    });

    super.onInit();
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
      postUserId: postDataList[index].publisherId?.toString(),
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

  /// DELETE POST API
  deletePostAPI({required String id}) async {
    PostDeletePayLoad payLoad = PostDeletePayLoad(
      postId: id,
    );

    var deletePostResponse = await ApiRepository.deletePostApi(payLoad);
    if (deletePostResponse != null) {
      Get.put<ProfileScreenController>(ProfileScreenController());
      final profileScreenCnt = Get.find<ProfileScreenController>();
      await profileScreenCnt.userProfileAPI();
      Get.back();
      postDataList.refresh();
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


  @override
  void onClose() {
    heartAnimationController.dispose();
    super.onClose();
  }
}
