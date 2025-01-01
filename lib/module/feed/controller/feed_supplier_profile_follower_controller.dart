import 'package:flutter/foundation.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/supplier_profile_follower_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/supplier_profile_follower_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/follow-unfollow/follow_add_user_payload.dart';
import '../../../services/service.dart';

class FeedSupplierProfileFollowerController extends GetxController {
  RxString str = RxString("");
  RxString otherUserId = RxString("");
  RxString userName = RxString("");
  final appController = Get.find<AppController>();
  Rx<SupplierProfileFollowerResponse> followerList = Rx(SupplierProfileFollowerResponse());
  RxBool isDataLoading = RxBool(false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    MountedCallbackExecutor.ensureIsThatMounted(
      () => getSupplierProfileFollowerListAPI(),
    );

    if (Get.arguments != null) {
      otherUserId.value = Get.arguments['FollowUserId'].toString();
    }
    if (Get.arguments != null) {
      userName.value = Get.arguments['user_name'].toString();
    }
  }

  /// GET FOLLOWER LIST API
  getSupplierProfileFollowerListAPI({bool isBool = true}) async {
    if (isBool) {
      isDataLoading.value = true;
    }
    SupplierProfileFollowerPayLoad payLoad = SupplierProfileFollowerPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
      supplierId: otherUserId.value,
    );

    var followerDataResponse = await ApiRepository.getSupplierProfileFollowerDataApi(bodyData: payLoad);

    if (followerDataResponse != null) {
      if (isBool) {
        isDataLoading.value = false;
      }
      followerList.value = followerDataResponse;
      followerList.value.responseData = followerList.value.responseData?.reversed.toList();
      followerList.refresh();
    } else {
      if (kDebugMode) {
        print('No data received from the API.');
      }
    }
  }

  /// ADD FOLLOW USER CONSUMER API
  addFollowUserAPI({required int index}) async {
    UserFollowAddUserPayLoad payLoad = UserFollowAddUserPayLoad(
      follow: "${followerList.value.responseData?[index].follow}" == "0" ? "1" : "0",
      followerId: "${appController.loginResponse.value.userId}",
      followingId: "${followerList.value.responseData?[index].userId}",
    );

    var addFollowingResponse = await ApiRepository.addFollowUserApi(payLoad);
    if (addFollowingResponse?.responseData != null) {
      getSupplierProfileFollowerListAPI(isBool: false);
    }
  }
}
