import 'package:multiple_image_and_videos_as_social_media/core/core.dart';

class SettingScreenController extends GetxController {
  RxString termsUrl = RxString("https://www.appwander.com/wander/user/terms"); // TermsAndConditionScreen
  RxString aboutUsUrl = RxString("https://www.appwander.com/wander/user/about-us"); // AboutUsScreen
  RxString privacyPolicyUrl = RxString("https://www.appwander.com/wander/user/privacy-policy"); // PrivacyPolicyScreen

  RxList<Map<String, dynamic>> settingDataList = RxList<Map<String, dynamic>>([
    {
      'Name': 'Security',
      'icon': ImageConstants.iconSecurity,
      'ScreenName': RoutesStrings.changePasswordRoute,
    },
    {
      'Name': 'Terms & Conditions',
      'icon': ImageConstants.iconTermsCondition,
      'ScreenName': RoutesStrings.webConditionScreenRoute,
    },
    {
      'Name': 'About Us',
      'icon': ImageConstants.iconAbout,
      'ScreenName': RoutesStrings.webConditionScreenRoute,
    },
    {
      'Name': 'Privacy Policy',
      'icon': ImageConstants.iconPrivacy,
      'ScreenName': RoutesStrings.webConditionScreenRoute,
    },
    {
      'Name': 'Refer & Earn',
      'icon': ImageConstants.iconReferEarn,
      'ScreenName': RoutesStrings.referAndEarnRoute,
    },
  ]);

  RxString image = RxString("");
  RxString fullName = RxString("");
  RxString bio = RxString("");

  @override
  void onInit() {
    if (Get.arguments != null) {
      image.value = Get.arguments['image'] ?? "";
      fullName.value = Get.arguments['full_name'] ?? "Unknown";
      bio.value = Get.arguments['bio']?.toString() ?? "";
    }
    super.onInit();
  }
}