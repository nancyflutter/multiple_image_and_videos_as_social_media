import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/badge_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/profile_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/profile_response.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';
import '../../../core/core.dart';

class ProfileScreenController extends GetxController with GetSingleTickerProviderStateMixin{
  // RxString abc = RxString('abc');
  RxBool showElevation = RxBool(false);
  RxBool showFab = RxBool(true);
  ScrollController scrollController = ScrollController();
  Rx<UserProfileResponse> userProfileData = Rx(UserProfileResponse());
  RxList<Post> postData = RxList<Post>([]);
  final appController = Get.find<AppController>();
  RxBool isPostDataLoading = RxBool(false);
  RxInt selectedIndex = RxInt(0);

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= 268.sp) {
        if (!showElevation.value) {
          showElevation.value = true;
          // userProfileAPI();
        }
      } else {
        if (showElevation.value) {
          showElevation.value = false;
        }
      }

      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (showFab.value) {
          showFab.value = false;
        }
      } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!showFab.value) {
          showFab.value = true;
        }
      }
    });
  }

  userProfileAPI() async {
    isPostDataLoading.value = true;
    UserProfilePayLoad payLoad = UserProfilePayLoad(
      userId: appController.loginResponse.value.userId.toString(),
    );

    UserProfileResponse? userProfileResponse = await ApiRepository.userProfileApi(bodyData: payLoad);
    if (userProfileResponse != null) {
      userProfileData.value = userProfileResponse;
      postData.value = userProfileResponse.posts?.toList() ?? [];
    }
    isPostDataLoading.value = false;
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

  Future<void> pickMedia(NewPostScreenController controller) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.media);
      if (result != null) {
        controller.imageList.value = result.files;
        if (kDebugMode) {
          print("controller.imageList.value ${controller.imageList.value}");
        }
        Get.toNamed(RoutesStrings.tagSearchScreenRoute, arguments: {'imageList': result.files});
        print("____________________________________${result.files}"); // print
      }
    } catch (e) {
      Console.debug("Error picking images: $e");
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
