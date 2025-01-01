import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../home.dart';

class BookingServiceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: BookingServicelistScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Bookings",
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
          body: controller.serviceData.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.serviceData.length,
                  itemBuilder: (context, index) {
                    final item = controller.serviceData[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.sp),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesStrings.serviceBookingRoute);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                          ),
                          elevation: 2.0,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6.sp), topRight: Radius.circular(6.sp)),
                                    child: Image.asset(
                                      item["img"],
                                      width: double.infinity,
                                      height: 220.sp,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // Positioned(
                                  //   top: 15.sp,
                                  //   child: Image.asset(
                                  //     "assets/icons/ic_discount_left.png",
                                  //     height: 30.sp,
                                  //   ),
                                  // ),
                                  Positioned(
                                    top: 15.sp,
                                    left: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
                                      height: 30.sp,
                                      width: 90.sp,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/icons/ic_discount_left.png",
                                            ),
                                            alignment: Alignment.topLeft),
                                      ),
                                      child: Text(
                                        "25% off",
                                        style: Theme.of(context).grayCliff600.copyWith(color: MyColors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///Rating
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item["name"],
                                                style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'AED 120/hr',
                                          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14, color: MyColors.secondaryColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.sp),
                                    Row(
                                      children: [
                                        ...List.generate(
                                            5,
                                            (starIndex) => Icon(
                                                  Icons.star,
                                                  size: 18.sp,
                                                  color: starIndex < item["rating"] ? MyColors.appTxtColor : MyColors.grey,
                                                )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "No bookings found",
                    style: Theme.of(context).grayCliff600.copyWith(
                          fontSize: 16.sp,
                      color: Colors.grey
                        ),
                  ),
                ),
        );
      },
    );
  }
}
