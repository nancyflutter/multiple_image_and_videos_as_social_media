import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_image_and_videos_as_social_media/app_controller/app_controller.dart';
import 'package:multiple_image_and_videos_as_social_media/core/routes/routes_strings.dart';
import 'package:multiple_image_and_videos_as_social_media/module/login/model/sign_up_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/login/model/sign_up_response.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_validation.dart';
import '../../../core/constant/constant.dart';

class SignupScreenController extends GetxController {
  Rx<TextEditingController> nameController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> mobileNumberController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> emailController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> passwordController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> confirmPasswordController = Rx<TextEditingController>(TextEditingController());
  RxList<Map<String, dynamic>> foundItems = RxList<Map<String, dynamic>>([]);
  RxMap<String, dynamic> selectedCountry = RxMap();
  final appController = Get.find<AppController>();

  @override
  void onInit() {
    super.onInit();
    selectedCountry.value = countryList.firstWhere((element) => element["country_en"] == "India");
    foundItems.value = countryList;
  }

  ///--------------- Other Functions --------------------------

  void filterItem(String item) {
    List<Map<String, dynamic>> results = [];
    if (item.isEmpty) {
      results = countryList;
    } else {
      results = countryList.where((element) => element["country_en"].toString().toLowerCase().startsWith(item.toLowerCase())).toList();
    }
    foundItems.value = results;
    foundItems.refresh();
  }

  resetCountryData() {
    foundItems.value = countryList;
  }

  Future<void> onSignup() async {
    String? error = _validateFields();
    if (error == null) {
      SignUpPayload signUpPayload = SignUpPayload(
          email: emailController.value.text.toLowerCase().trim(),
          password: passwordController.value.text.trim(),
          confirmPassword: confirmPasswordController.value.text.trim(),
          mobileCode: selectedCountry['phone_code'].toString(),
          mobile: mobileNumberController.value.text.trim(),
          fullName: nameController.value.text.trim(),
          deviceType: (Platform.isIOS ? 1 : 0).toString(),
          deviceToken: appController.deviceToken.value ?? "",
          deviceId: await _getId(),
          loginType: '1',
          gender: '1');

      SignUpResponse? signUpResponse = await ApiRepository.signUpApi(signUpPayload.toMap());
      if (signUpResponse != null) {
        appController.storeUserInfo(signUpResponse.toJson());
        FocusManager.instance.primaryFocus?.unfocus();
        //SocketHelper.socketJoinUser(userId: appController.signUpResponse.value.userId ?? '');
        Get.offAllNamed(RoutesStrings.bottomNavigationRoute);
      }
    } else {
      ApiValidation.showDialogueAccordingResponse(error ?? "");
    }
  }

  String? _validateFields() {
    String? msg;
    if (emailController.value.text.isEmpty && passwordController.value.text.isEmpty && nameController.value.text.isEmpty && confirmPasswordController.value.text.isEmpty && mobileNumberController.value.text.isEmpty) {
      msg = "Please enter required fields";
      return msg;
    } else if (nameController.value.text.length < 4) {
      msg = "Please enter full name";
      return msg;
    } else if (mobileNumberController.value.text.length < 7 || mobileNumberController.value.text.length > 12) {
      msg = "Invalid mobile number";
      return msg;
    } else if (!emailController.value.text.isEmail) {
      msg = "Please enter valid email address";
      return msg;
    } else if (!RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{6,}$').hasMatch(passwordController.value.text)) {
      msg = "Password should contain a minimum of 6 characters with at least one number,one special character,one lower case latter and one upper case latter";
      return msg;
    } else if (confirmPasswordController.value.text.isEmpty) {
      msg = "Please enter Confirm Password";
      return msg;
    } else if (passwordController.value.text != confirmPasswordController.value.text) {
      msg = "Password does not match";
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
