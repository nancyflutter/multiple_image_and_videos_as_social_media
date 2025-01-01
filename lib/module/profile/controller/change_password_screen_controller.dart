import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreenController extends GetxController {
  RxString abc = RxString('abc');

  Rx<TextEditingController> currentPasswordController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> newPasswordController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> confirmPasswordController = Rx<TextEditingController>(TextEditingController());
}
