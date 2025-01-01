import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

class ReferAndEarnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: ReferAndEarnScreenController(),
      builder: (controller) {
        controller.abc.value;
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Refer & Earn",
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
          ),
          body: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Center(
              child: Column(
                children: [
                  60.verticalSpace,
                  Image.asset(ImageConstants.iconCoin,height: 100.sp,width: 100.sp,),
                  20.verticalSpace,
                  Text("Refer More And Earn More",style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts18),),
                  20.verticalSpace,
                  Text("You will get 50 coins per refer who joins WANDER",style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts15),),
                  30.verticalSpace,
                  Text("Your Referal code",style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts15,color: MyColors.grey),),
                  20.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 15.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      color: MyColors.secondaryColor.withOpacity(0.1),
                    ),
                    child: Text("P52HWV81",style: Theme.of(context).grayCliffBold.copyWith(fontSize: MyFonts.fonts18,color: MyColors.secondaryColor,letterSpacing: 16.sp),),
                  ),
                ],
              ),
            ),
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
                "Invite Your Friends",
                style: Theme.of(context).grayCliff500.copyWith(
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
