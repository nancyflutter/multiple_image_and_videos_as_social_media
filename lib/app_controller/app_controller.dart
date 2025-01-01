import "package:firebase_messaging/firebase_messaging.dart";
import "package:multiple_image_and_videos_as_social_media/module/login/model/login_response.dart";
import "package:multiple_image_and_videos_as_social_media/module/login/model/sign_up_response.dart";

import "../core/core.dart";

class AppController extends GetxController {
  Rx<LoginResponse> loginResponse = Rx<LoginResponse>(LoginResponse());
  Rx<SignUpResponse> signUpResponse = Rx<SignUpResponse>(SignUpResponse());
  Rx<String> deviceToken = Rx<String>("");

  @override
  void onInit() {

    navigateToPredictedRoute();

    print("app controller itnit");
    super.onInit();
  }

  void navigateToPredictedRoute() async {
    try {
      deviceToken.value = await FirebaseMessaging.instance.getToken() ?? "";
      print("device token :::::::::: ${deviceToken.value}");
    } catch (e) {
      Console.debugLog(e);
    }
    await getLoginResponse();
    await getSignUpResponse();
    if (loginResponse.value.authToken != null) {
      Get.offAllNamed(RoutesStrings.bottomNavigationRoute);
      return;
    }
    if (signUpResponse.value.authToken != null) {
      Get.offAllNamed(RoutesStrings.bottomNavigationRoute);
      return;
    }
    Get.offAllNamed(RoutesStrings.loginRoute);
  }

  void storeUserInfo(Map<String, dynamic> map) {
    StorageService.setMap(key: StorageConstants.userDetails, value: map);
    loginResponse.value = LoginResponse.fromJson(map);
    loginResponse.refresh();
  }

  void storeRegisterUserInfo(Map<String, dynamic> map) {
    StorageService.setMap(key: StorageConstants.userDetails, value: map);
    signUpResponse.value = SignUpResponse.fromJson(map);
    signUpResponse.refresh();
  }

  Future<void> getLoginResponse() async {
    StorageService.getKeyAny(key: StorageConstants.userDetails).then((value) {
      if (value != null) {
        loginResponse.value = LoginResponse.fromJson(value as Map<String, dynamic>);
        loginResponse.refresh();
      }
    });
  }

  Future<void> getSignUpResponse() async {
    StorageService.getKeyAny(key: StorageConstants.userDetails).then((value) {
      if (value != null) {
        signUpResponse.value = SignUpResponse.fromJson(value as Map<String, dynamic>);
        signUpResponse.refresh();
      }
    });
  }

  Future<void> removeAllKeysAndLogout() async {
    await StorageService.removeAllKeysAtOnce();
    loginResponse.value = LoginResponse();
    signUpResponse.value = SignUpResponse();
    loginResponse.refresh();
    signUpResponse.refresh();
    //SocketHelper.socketRemoveUser(userId: loginResponse.value.userId ?? '');
    Get.offAllNamed(RoutesStrings.loginRoute);
  }

  Map<String, String> getHeader() {
    return {
      "Content-Type": "application/json",
      "App": "u",
      if (loginResponse.value.authToken != null) "Authorization": "${loginResponse.value.authToken}",
    };
  }


}
