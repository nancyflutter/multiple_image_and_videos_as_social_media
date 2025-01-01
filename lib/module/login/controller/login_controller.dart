import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_image_and_videos_as_social_media/app_controller/app_controller.dart';
import 'package:multiple_image_and_videos_as_social_media/core/routes/routes_strings.dart';
import 'package:multiple_image_and_videos_as_social_media/module/login/model/forgot_password_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/login/model/forgot_password_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/login/model/login_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/login/model/login_response.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> passwordController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> forgotEmailController = Rx<TextEditingController>(TextEditingController());
  final appController = Get.find<AppController>();

  Future<void> onLogin() async {
    String? error = _validateFields();
    if (error == null) {
      LoginPayload loginPayload = LoginPayload(
        email: emailController.value.text.toLowerCase().trim(),
        password: passwordController.value.text.trim(),
        deviceType: (Platform.isIOS ? 1 : 0).toString(),
        deviceToken: appController.deviceToken.value ?? "",
        deviceId: await _getId(),
      );

      LoginResponse? loginResponse = await ApiRepository.loginApi(loginPayload.toMap());
      if (loginResponse != null) {
        appController.storeUserInfo(loginResponse.toJson());
        FocusManager.instance.primaryFocus?.unfocus();
        //SocketHelper.socketJoinUser(userId: appController.loginResponse.value.userId ?? '');
        Get.offAllNamed(RoutesStrings.bottomNavigationRoute);
      }
    } else {
      ApiValidation.showDialogueAccordingResponse(error ?? "");
    }
  }

  Future<void> onForgotPassword() async {
    String? error;
    error = forgotEmailController.value.text.isEmpty ? "Please enter email address" : null;
    error = !forgotEmailController.value.text.isEmail ? "Please enter valid email address" : null;
    if (error == null) {
      ForgotPasswordPayload forgotPasswordPayload = ForgotPasswordPayload(
        emailOrMobile: forgotEmailController.value.text.toLowerCase().trim(),
        type: "1",
      );
      ForgotPasswordResponse? forgotPasswordResponse = await ApiRepository.forgotPasswordApi(forgotPasswordPayload.toJson());
      if (forgotPasswordResponse != null) {
        Get.back();
      }
    } else {
      ApiValidation.showDialogueAccordingResponse(error ?? "");
    }
  }

  String? _validateFields() {
    String? msg;
    if (emailController.value.text.isEmpty && passwordController.value.text.isEmpty) {
      msg = "Please enter required fields";
      return msg;
    } else if (emailController.value.text.isEmpty) {
      msg = "Please enter email address";
      return msg;
    } else if (!emailController.value.text.isEmail) {
      msg = "Please enter valid email address";
      return msg;
    } else if (passwordController.value.text.isEmpty) {
      msg = "Please enter password";
      return msg;
    }
    return msg;
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }
}
