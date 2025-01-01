import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

import '../../constant/colors_constants.dart';
import '../../constant/value_constants.dart';

class AppLoader {
  AppLoader._();

  static showLoader() {
    return showDialog(
      barrierColor: MyColors.transparent,
      context: navigatorKey.currentState!.context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.sp),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: SizedBox(child: Lottie.asset('assets/lottie/loader.json', fit: BoxFit.fill, width: 10.sp)).paddingAll(20.sp),
        );
      },
    );
  }

  static showLoader2() {
    return showDialog(
      barrierColor: MyColors.black.withOpacity(0.25),
      context: navigatorKey.currentState!.context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.sp),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: SizedBox(child: Lottie.asset('assets/lottie/loader.json', fit: BoxFit.fill, width: 10.sp)).paddingAll(20.sp),
        );
      },
    );
  }

  static removeLoader() {
    Get.back();
  }
}
