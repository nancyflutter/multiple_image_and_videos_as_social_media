import 'package:flutter/foundation.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/add_comment_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/add_like_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/comment_detail_get_profile/user_account_get_profile_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/delete_post_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/notification_post_detail_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/notification_post_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/posts_comment_response.dart';
import '../../../core/core.dart';
import '../../../services/api/api.dart';

class NotificationPostDetailController extends GetxController with GetSingleTickerProviderStateMixin {
  RxList<bool> isHeartVisibleList = RxList<bool>();
  late AnimationController heartAnimationController;
  late Animation<double> heartAnimation;
  RxString notificationPostId = RxString("");
  Rx<UserAccountGetProfileResponse> userAccountProfileData = Rx(UserAccountGetProfileResponse());
  final appController = Get.find<AppController>();
  Rx<PostDetailResponse> notificationPostDetail = Rx(PostDetailResponse());
  RxList<PostDetail> notificationPostDetailList = RxList([]);
  RxBool isLoading = RxBool(false);
  RxString userBaseUrl = RxString('http://www.staging.appwander.com/upload/user/');
  RxString mediaBaseUrl = RxString('https://www.staging.appwander.com/test/social_media/public/media/');
  RxInt currentIndex = RxInt(0);

  RxList<GetPostCommentResponse> postsCommentList = RxList([]);
  Rx<TextEditingController> sendMessageController = Rx(TextEditingController());
  Rx<ScrollController> scrollController = Rx(ScrollController());
  Rx<AddCommentResponse> addCommentData = Rx(AddCommentResponse());

  @override
  void onInit() {
    heartAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    heartAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(heartAnimationController);
    ever(notificationPostDetailList, (_) => initializeHeartVisibility());
    super.onInit();
  }

  void initializeHeartVisibility() {
    isHeartVisibleList.value = List<bool>.filled(notificationPostDetailList.length, false);
  }

  /// Notification Post Detail Api
  notificationPostDetailAPI({required String id}) async {
    isLoading.value = true;
    PostDetailPayLoad payLoad = PostDetailPayLoad(
      userId: "${appController.loginResponse.value.userId}",
      postId: id,
    );

    var postDetailResponse = await ApiRepository.notificationPostDetailApi(payLoad);
    if (postDetailResponse != null) {
      notificationPostDetail.value = postDetailResponse;
      notificationPostDetailList.value = postDetailResponse.post ?? [];
    }
    isLoading.value = false;
  }

  /// ADD LIKE API
  Future<void> addLikeAPI({bool isAnimate = true}) async {
    bool initialLikeStatus = notificationPostDetailList.first.liked == 1;
    bool newLikeStatus = !initialLikeStatus;

    int likeCount = notificationPostDetailList.first.likes ?? 0;
    likeCount = newLikeStatus ? likeCount + 1 : likeCount - 1;

    notificationPostDetailList.first.liked = newLikeStatus ? 1 : 0;
    notificationPostDetailList.first.likes = likeCount;
    notificationPostDetailList.refresh();

    if (isAnimate) {
      isHeartVisibleList.first = true;

      heartAnimationController.forward(from: 0).whenComplete(() {
        Future.delayed(const Duration(milliseconds: 300), () {
          isHeartVisibleList.first = false;
        });
      });
    }

    AddLikePayLoad payLoad = AddLikePayLoad(
      postId: notificationPostDetailList.first.id.toString(),
      userId: appController.loginResponse.value.userId.toString(),
      postUserId: notificationPostDetailList.first.publisherId.toString(),
      type: "u",
      like: newLikeStatus ? "1" : "0",
    );

    final addLikeResponse = await ApiRepository.addLikeApi(payLoad);
    if (addLikeResponse != null) {
      final responseBody = addLikeResponse.responseData; // Ensure this is treated as a string
      if (responseBody == 'Liked' || responseBody == 'dislike') {
        /// update here feed post list
        final feedController = Get.find<FeedScreenController>();
        await feedController.getPostDataAPI();
      } else {
        if (kDebugMode) {
          print("Unexpected response data: $responseBody");
        }
      }
    } else {
      if (kDebugMode) {
        print("Failed to update like status.");
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
      if (kDebugMode) {
        print("::::::::::::::::::::::::::::::::::::::::::::::::success");
      }
      Get.back();
      final feedController = Get.find<FeedScreenController>();
      await feedController.getPostDataAPI();
    } else {
      if (kDebugMode) {
        print("fail to delete post.");
      }
    }
  }
}
