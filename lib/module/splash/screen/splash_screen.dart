
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) {
        controller.splash.value;
        return Scaffold(
          body: Center(
            child: Image.asset(
              ImageConstants.splashLogo,
              width: 280.sp,
            ),
          ),
        );
      },
    );
  }
}
