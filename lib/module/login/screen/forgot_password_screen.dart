import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../login.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: MyColors.black, //change your color here
        ),
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.white,
        leading: Image.asset(
          scale: 3,
          ImageConstants.iconBack,
        ).addGesture(
          () {
            Get.back();
          },
        ),
        elevation: .7,
      ),
      backgroundColor: Colors.white,
      body: GetX<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.verticalSpace,
                Center(
                  child: Image.asset(
                    ImageConstants.icForgotPassword,
                    height: 140.sp,
                  ),
                ),
                20.verticalSpace,
                Center(
                  child: Text(
                    "Forgot password?",
                    style: Theme.of(context).grayCliff700.copyWith(fontSize: 18.sp),
                  ),
                ),
                24.verticalSpace,
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.sp),
                    child: Text(
                      "Enter your email or phone number below and we'll send you a link to get back into your account.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp, height: 1.3),
                    ),
                  ),
                ),
                60.verticalSpace,
                CommonTextField(
                  labelText: "Enter Email OR Mobile Number",
                  controller: controller.forgotEmailController.value,
                ),
                18.verticalSpace,
                CommonButton(
                  onTap: () {
                    controller.onForgotPassword();
                  },
                  buttonText: "SEND",
                ),
              ],
            ).paddingSymmetric(horizontal: 16.sp),
          );
        },
      ),
    );
  }
}
