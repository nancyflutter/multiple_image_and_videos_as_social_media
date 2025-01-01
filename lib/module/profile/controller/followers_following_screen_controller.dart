import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:multiple_image_and_videos_as_social_media/app_controller/app_controller.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/extension/mounted_callback_executer.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/following_data_response.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';

class FollowersFollowingScreenController extends GetxController {
  final appController = Get.find<AppController>();
  Rx<FollowerDataResponse> followerList = Rx<FollowerDataResponse>(FollowerDataResponse());
  Rx<FollowingDataResponse> followingList = Rx<FollowingDataResponse>(FollowingDataResponse());
  RxString followerCount = RxString("");
  RxString otherUserId = RxString("");
  RxString userName = RxString("");
  RxBool isLoadingFollower = RxBool(false);
  RxBool isLoadingFollowing = RxBool(false);

  @override
  void onInit() {
    if (Get.arguments != null) {
      otherUserId.value = Get.arguments['FollowUserId'].toString();
    }
    if (Get.arguments != null) {
      userName.value = Get.arguments['user_name'].toString();
    }
    MountedCallbackExecutor.ensureIsThatMounted(
      () => getFollowerListAPI(),
    );
    MountedCallbackExecutor.ensureIsThatMounted(
      () => getFollowingListAPI(),
    );
    super.onInit();
  }

  /// GET FOLLOWER LIST API
  getFollowerListAPI() async {
    isLoadingFollower.value = true;
    FollowerDataPayLoad payLoad = FollowerDataPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
      otherUserId: otherUserId.value.isNotEmpty ? otherUserId.value : appController.loginResponse.value.userId.toString(),
    );

    var followerDataResponse = await ApiRepository.getFollowerDataApi(bodyData: payLoad);

    if (followerDataResponse != null) {
      isLoadingFollower.value = false;
      followerList.value = followerDataResponse;
      followerList.value.responseData = followerList.value.responseData?.reversed.toList();
      followerList.refresh();
    } else {
      if (kDebugMode) {
        print('No data received from the API.');
      }
    }
  }

  /// GET FOLLOWING USER LIST API
  getFollowingListAPI() async {
    isLoadingFollowing.value = true;
    FollowingDataPayLoad payLoad = FollowingDataPayLoad(
      userId: otherUserId.value.isNotEmpty ? otherUserId.value : appController.loginResponse.value.userId.toString(),
      loginUserId: appController.loginResponse.value.userId.toString(),
    );

    var followingDataResponse = await ApiRepository.getFollowingDataApi(bodyData: payLoad);

    if (followingDataResponse != null) {
      isLoadingFollowing.value = false;
      followingList.value = followingDataResponse;
      followingList.value.responseData = followingList.value.responseData?.reversed.toList();
      followingList.refresh();
      log("+++++++++++++++++++++++++++++${followingDataResponse.toJson()}");
    } else {
      if (kDebugMode) {
        print('No data received from the API.');
      }
    }
  }

  /// ADD FOLLOW SUPPLIER API
  addFollowSupplierAPI(int index) async {
    if (followingList.value.responseData == null || followingList.value.responseData!.length <= index) {
      print("Invalid index or responseData is null");
      return;
    }

    UserFollowAddSupplierPayLoad payLoad = UserFollowAddSupplierPayLoad(
      follow: followingList.value.responseData?[index].follow == 0 ? 1 : 0,
      followingId: "${appController.loginResponse.value.userId}",
      supplierId: "${followingList.value.responseData?[index].userId}",
    );

    var addFollowingResponse = await ApiRepository.addFollowSupplierApi(payLoad);

    if (addFollowingResponse?.responseData != null) {
      print("Success:::::::::::: ${addFollowingResponse?.responseData}");
      await getFollowingListAPI();
    } else {
      print("Failed to follow/unfollow supplier.");
    }
  }

  /// ADD FOLLOW USER CONSUMER API
  addFollowUserAPI({required int index, bool isFollower = true}) async {
    UserFollowAddUserPayLoad payLoad = UserFollowAddUserPayLoad(
      follow: isFollower
          ? "${followerList.value.responseData?[index].follow}" == "0"
              ? "1"
              : "0"
          : "${followingList.value.responseData?[index].follow}" == "0"
              ? "1"
              : "0",
      followerId: "${appController.loginResponse.value.userId}",
      followingId: isFollower ? "${followerList.value.responseData?[index].userId}" : "${followingList.value.responseData?[index].userId}",
    );

    var addFollowingResponse = await ApiRepository.addFollowUserApi(payLoad);
    if (addFollowingResponse?.responseData != null) {
      if (isFollower) {
        await getFollowerListAPI();
      } else {
        await getFollowingListAPI();
      }
    }
  }
}
