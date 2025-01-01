/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final ValueNotifier<bool> currentPasswordVisibility = ValueNotifier(true);
  final ValueNotifier<bool> newPasswordVisibility = ValueNotifier(true);
  final ValueNotifier<bool> confirmPasswordVisibility = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.grey.shade200, systemNavigationBarColor: Colors.grey.shade200, systemNavigationBarIconBrightness: Brightness.dark));
    return GetX<ChangePasswordScreenController>(
      init: ChangePasswordScreenController(),
      builder: (controller) {
        controller.abc.value;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            centerTitle: true,
            title: Text(
              "Change Password",
              style: Theme.of(context).grayCliff600.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            leading: Image.asset(
              scale: 3,
              ImageConstants.iconBack,
            ).addGesture(
              () {
                Get.back();
              },
            ),
            elevation: 0.5,
          ),
          body: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                40.verticalSpace,
                Text(
                  "Your new password must be different from previous password",
                  style: Theme.of(context).grayCliff600.copyWith(
                        fontSize: MyFonts.fonts17,
                      ),
                  textAlign: TextAlign.center,
                ),
                30.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: currentPasswordVisibility,
                  builder: (context, val, _) {
                    return CommonTextField(
                      labelText: "Current Password",
                      controller: controller.currentPasswordController.value,
                      obscureText: val,
                      suffix: GestureDetector(
                        onTap: () {
                          currentPasswordVisibility.value = !val;
                        },
                        child: Icon(
                          val ? Icons.visibility_off : Icons.visibility,
                          color: MyColors.hintColor,
                        ),
                      ),
                    );
                  },
                ),
                20.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: newPasswordVisibility,
                  builder: (context, val, _) {
                    return CommonTextField(
                      labelText: "New Password",
                      controller: controller.newPasswordController.value,
                      obscureText: val,
                      suffix: GestureDetector(
                        onTap: () {
                          newPasswordVisibility.value = !val;
                        },
                        child: Icon(
                          val ? Icons.visibility_off : Icons.visibility,
                          color: MyColors.hintColor,
                        ),
                      ),
                    );
                  },
                ),
                20.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: confirmPasswordVisibility,
                  builder: (context, val, _) {
                    return CommonTextField(
                      labelText: "Confirm Password",
                      controller: controller.confirmPasswordController.value,
                      obscureText: val,
                      suffix: GestureDetector(
                        onTap: () {
                          confirmPasswordVisibility.value = !val;
                        },
                        child: Icon(
                          val ? Icons.visibility_off : Icons.visibility,
                          color: MyColors.hintColor,
                        ),
                      ),
                    );
                  },
                ),
                40.verticalSpace,
              ],
            ).paddingSymmetric(horizontal: 16.sp),
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              // Get.toNamed(RoutesStrings.bookingDetailsRoute);
            },
            child: Container(
              height: 50.sp,
              color: MyColors.secondaryColor,
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "SAVE",
                style: Theme.of(context).grayCliff600.copyWith(
                      fontSize: MyFonts.fonts16,
                      color: MyColors.white,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

void showChangePasswordBottomSheet(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black.withOpacity(0.1),
    statusBarIconBrightness: Brightness.light,
  ));

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.97,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
        ),
        child: ChangePasswordContent(),
      );
    },
  ).then((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
  });
}

class ChangePasswordContent extends StatelessWidget {
  final ValueNotifier<bool> currentPasswordVisibility = ValueNotifier(true);
  final ValueNotifier<bool> newPasswordVisibility = ValueNotifier(true);
  final ValueNotifier<bool> confirmPasswordVisibility = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black.withOpacity(0.3),
      statusBarIconBrightness: Brightness.light,
    ));
    return GetX<ChangePasswordScreenController>(
      init: ChangePasswordScreenController(),
      builder: (controller) {
        controller.abc.value;
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Change Password",
              style: Theme.of(context).grayCliff600.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            leading: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Get.back();
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                  statusBarColor: MyColors.white,
                  statusBarIconBrightness: Brightness.dark,
                ));
              },
            ),
            elevation: 0.5,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                40.verticalSpace,
                Text(
                  "Your new password must be different from previous password",
                  style: Theme.of(context).grayCliff600.copyWith(
                        fontSize: MyFonts.fonts17,
                      ),
                  textAlign: TextAlign.center,
                ),
                30.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: currentPasswordVisibility,
                  builder: (context, val, _) {
                    return CommonTextField(
                      labelText: "Current Password",
                      controller: controller.currentPasswordController.value,
                      obscureText: val,
                      suffix: GestureDetector(
                        onTap: () {
                          currentPasswordVisibility.value = !val;
                        },
                        child: Icon(
                          val ? Icons.visibility_off : Icons.visibility,
                          color: MyColors.hintColor,
                        ),
                      ),
                    );
                  },
                ),
                20.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: newPasswordVisibility,
                  builder: (context, val, _) {
                    return CommonTextField(
                      labelText: "New Password",
                      controller: controller.newPasswordController.value,
                      obscureText: val,
                      suffix: GestureDetector(
                        onTap: () {
                          newPasswordVisibility.value = !val;
                        },
                        child: Icon(
                          val ? Icons.visibility_off : Icons.visibility,
                          color: MyColors.hintColor,
                        ),
                      ),
                    );
                  },
                ),
                20.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: confirmPasswordVisibility,
                  builder: (context, val, _) {
                    return CommonTextField(
                      labelText: "Confirm Password",
                      controller: controller.confirmPasswordController.value,
                      obscureText: val,
                      suffix: GestureDetector(
                        onTap: () {
                          confirmPasswordVisibility.value = !val;
                        },
                        child: Icon(
                          val ? Icons.visibility_off : Icons.visibility,
                          color: MyColors.hintColor,
                        ),
                      ),
                    );
                  },
                ),
                40.verticalSpace,
              ],
            ).paddingSymmetric(horizontal: 16.sp),
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              // Add your save logic here
            },
            child: Container(
              height: 50.sp,
              color: MyColors.secondaryColor,
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "SAVE",
                style: Theme.of(context).grayCliff600.copyWith(
                      fontSize: MyFonts.fonts16,
                      color: MyColors.white,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
