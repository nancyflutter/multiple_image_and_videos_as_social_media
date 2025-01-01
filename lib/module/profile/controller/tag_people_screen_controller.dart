
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagPeopleScreenController extends GetxController {
  RxString abc = RxString('abc');

  Rx<TextEditingController> servicePeopleController = Rx<TextEditingController>(TextEditingController());


  @override
  void onInit() {
    super.onInit();
  }
}
