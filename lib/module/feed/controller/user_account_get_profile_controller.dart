import 'package:flutter/foundation.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/comment_detail_get_profile/user_account_get_profile_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/comment_detail_get_profile/user_account_get_profile_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/badge_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/follow-unfollow/follow_add_user_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';
import '../../../core/core.dart';

class UserAccountGetProfileController extends GetxController {
  final appController = Get.find<AppController>();
  Rx<UserAccountGetProfileResponse> userAccountProfileData = Rx(UserAccountGetProfileResponse());
  ScrollController scrollController = ScrollController();
  RxBool showElevation = RxBool(false);
  RxList<Post> postData = RxList<Post>([]);
  RxBool showFab = RxBool(true);
  RxString userId = RxString("");
  RxInt selectedIndex = RxInt(0);

  @override
  void onInit() {
    if (Get.arguments != null) {
      userId.value = Get.arguments["userId"]?.toString() ?? "";
    }
    MountedCallbackExecutor.ensureIsThatMounted(
      () => userAccountGetProfileAPI(userId: userId.value),
    );
    super.onInit();
  }

  /// User Account Get Profile API
  userAccountGetProfileAPI({required String userId}) async {
    UserAccountGetProfilePayLoad payLoad = UserAccountGetProfilePayLoad(
      userId: userId.toString(),
      loginUserId: appController.loginResponse.value.userId.toString(),
    );
    UserAccountGetProfileResponse? userAccountGetProfileResponse = await ApiRepository.userAccountGetProfileApi(payLoad);
    if (userAccountGetProfileResponse != null) {
      userAccountProfileData.value = userAccountGetProfileResponse;
      postData.value = userAccountGetProfileResponse.posts?.toList() ?? [];
    }
  }

  RxList<BadgeResponse>? badgeData = RxList([]);

  getBadgeAPI() async {
    var badgeResponse = await ApiRepository.badgeListApi();
    if (badgeResponse != null) {
      badgeData?.value = badgeResponse;
    } else {
      if (kDebugMode) {
        print("fail to fetch data");
      }
    }
  }

  /// ADD FOLLOW USER CONSUMER API
  addFollowUserAPI() async {
    UserFollowAddUserPayLoad payLoad = UserFollowAddUserPayLoad(
      follow: "${userAccountProfileData.value.follow}" == "0" ? "1" : "0",
      followerId: "${appController.loginResponse.value.userId}",
      followingId: userId.value,
    );

    var addFollowingResponse = await ApiRepository.addFollowUserApi(payLoad);
    if (addFollowingResponse?.responseData != null) {
      await userAccountGetProfileAPI(userId: userId.value);
      if (kDebugMode) {
        print("SUCCESS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      }
    }
  }
}
