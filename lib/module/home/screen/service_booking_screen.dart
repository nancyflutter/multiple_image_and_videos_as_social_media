import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../home.dart';

class ServiceBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: ServiceBookingScreenController(),
      builder: (controller) {
        controller.abc.value;

        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 270.sp,
                  pinned: true,
                  backgroundColor: MyColors.white,
                  elevation: 0.5,
                  leading: Image.asset(
                    scale: 3,
                    ImageConstants.iconBack,
                  ).addGesture(
                        () {
                      Get.back();
                    },
                  ),
                  flexibleSpace: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      var top = constraints.biggest.height;
                      double opacity = (top - kToolbarHeight) / (250.0 - kToolbarHeight);
                      opacity = opacity.clamp(0.0, 1.0); // Ensure opacity is between 0.0 and 1.0
                      return FlexibleSpaceBar(
                        centerTitle: true,
                        title: Opacity(
                          opacity: 1 - opacity,
                          child: Text(
                            "Title Page",
                            style: Theme
                                .of(context)
                                .grayCliff600
                                .copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        background: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.asset(
                              ImageConstants.placeholderImg,
                              fit: BoxFit.cover,
                            ),
                            /*    Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Opacity(
                            opacity: opacity,
                            child: Container(
                              height: 65.0,
                              color: Colors.black.withOpacity(0.2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [CommonWidgets.customTextView(text: "6", color: MyColors.white, fontSize: MyFonts.fonts14, fontWeight: FontWeight.w400), CommonWidgets.customTextView(text: "Followers", color: MyColors.white, fontSize: MyFonts.fonts14, fontWeight: FontWeight.w400)],
                                  ),
                                  Container(
                                    height: 23.sp,
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [CommonWidgets.customTextView(text: "31", color: MyColors.white, fontSize: MyFonts.fonts14, fontWeight: FontWeight.w400), CommonWidgets.customTextView(text: "Total Posts", color: MyColors.white, fontSize: MyFonts.fonts14, fontWeight: FontWeight.w400)],
                                  ),
                                  Container(
                                    height: 23.sp,
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  Container(color: Colors.green, padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 11.sp), child: CommonWidgets.customTextView(text: "Follow", color: MyColors.white, fontSize: MyFonts.fonts12, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                        ),*/
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  ///Service name
                  Container(
                    color: MyColors.white,
                    padding: EdgeInsets.all(12.sp),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ferrari Cars',
                              style: Theme
                                  .of(context)
                                  .grayCliff500
                                  .copyWith(
                                fontSize: MyFonts.fonts16,
                              ),
                            ),
                            Text(
                              'AED 1200/hr',
                              style: Theme
                                  .of(context)
                                  .grayCliff500
                                  .copyWith(fontSize: MyFonts.fonts16, color: MyColors.secondaryColor),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            Icon(Icons.location_on, color: MyColors.secondaryColor),
                            5.horizontalSpace,
                            Expanded(
                                child: Text(
                                  'Durgram Cheruvu Cable Bridge, Inorbit Mall Road, Silpa Gram Craft Village, Modhapur, Telangana, India',
                                  style: Theme
                                      .of(context)
                                      .grayCliff500
                                      .copyWith(fontSize: MyFonts.fonts14),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      children: [

                        ///Description
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          // margin: EdgeInsets.all(8.0),
                          elevation: 2.0,
                          child: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Description',
                                  style: Theme
                                      .of(context)
                                      .grayCliff600
                                      .copyWith(fontSize: MyFonts.fonts16),
                                ),
                                10.verticalSpace,
                                Text(
                                  'Ferrari car prices start \n\n(GST Included at Rs.3.5 Cr for the most inexpensive model in its lineup, the portfolio. \n\nThe mot expensive car in ferraris lineup is the 812 Superfast prices at Rs. 5.2 Cr for its top variant.In tottal, Ferraris has 4 models on sale in India. The Ferrari Portfolio , Ferrari 812 Superfast. Ferrari 488 are amonst the most popular cars in their respetive.',
                                  style: Theme
                                      .of(context)
                                      .grayCliff400
                                      .copyWith(fontSize: MyFonts.fonts14),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///Select Date TIME
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          elevation: 2.0,
                          child: Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(ImageConstants.icCalendar, height: 12.sp),
                                    5.horizontalSpace,
                                    Text(
                                      'Select Date',
                                      style: Theme
                                          .of(context)
                                          .grayCliff600
                                          .copyWith(fontSize: MyFonts.fonts16),
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                GestureDetector(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pickedDate != null) {
                                      controller.selectedDate.value = "${pickedDate.toLocal()}".split(' ')[0];
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(color: MyColors.materialScaffoldBackground, borderRadius: BorderRadius.circular(4.sp)),
                                          padding: EdgeInsets.all(12.sp),
                                          child: Text(
                                            controller.selectedDate.value.isEmpty ? 'Date' : controller.selectedDate.value,
                                            textAlign: TextAlign.center,
                                            style: Theme
                                                .of(context)
                                                .grayCliff600
                                                .copyWith(fontSize: MyFonts.fonts16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///Number of persons
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          elevation: 2.0,
                          child: Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Number of Persons",
                                    style: Theme
                                        .of(context)
                                        .grayCliff600
                                        .copyWith(fontSize: MyFonts.fonts16),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: controller.decrementPersons,
                                  child: Container(
                                    height: 30.sp,
                                    width: 30.sp,
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: MyColors.secondaryColor),
                                    child: Icon(
                                      Icons.remove,
                                      color: MyColors.white,
                                    ),
                                  ),
                                ),
                                15.horizontalSpace,
                                Text(
                                  controller.numberOfPersons.value.toString().padLeft(2, '0'),
                                  style: Theme
                                      .of(context)
                                      .grayCliff600
                                      .copyWith(fontSize: MyFonts.fonts16),
                                ),
                                15.horizontalSpace,
                                GestureDetector(
                                  onTap: controller.incrementPersons,
                                  child: Container(
                                    height: 30.sp,
                                    width: 30.sp,
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: MyColors.secondaryColor),
                                    child: Icon(
                                      Icons.add,
                                      color: MyColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///Select Time
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          elevation: 2.0,
                          child: Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(ImageConstants.icCalendar, height: 12.sp),
                                    5.horizontalSpace,
                                    Text(
                                      "Select Time",
                                      style: Theme
                                          .of(context)
                                          .grayCliff600
                                          .copyWith(fontSize: MyFonts.fonts16),
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                GridView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, // Number of columns
                                    childAspectRatio: 3, // Aspect ratio of each item
                                    mainAxisSpacing: 10, // Spacing between rows
                                    crossAxisSpacing: 10, // Spacing between columns
                                  ),
                                  itemCount: 9,
                                  itemBuilder: (context, index) {
                                    final times = [
                                      "10:00 AM",
                                      "12:00 PM",
                                      "02:00 PM",
                                      "04:00 PM",
                                      "06:56 PM",
                                      "08:23 PM",
                                      "10:00 PM",
                                      "12:00 AM",
                                      "04:00 PM",
                                    ];
                                    final time = times[index];
                                    return GetX<ServiceBookingScreenController>(
                                      init: ServiceBookingScreenController(),
                                      initState: (_) {},
                                      builder: (controller) {
                                        controller.abc.value;
                                        return GestureDetector(
                                          onTap: () => controller.selectTime(time),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: controller.selectedTime.value == time ? MyColors.secondaryColor : MyColors.appTxtColor,
                                              ),
                                              borderRadius: BorderRadius.circular(6.0),
                                              color: controller.selectedTime.value == time ? MyColors.secondaryColor : MyColors.transparent,
                                            ),
                                            child: Center(
                                              child: Text(
                                                time,
                                                style: Theme
                                                    .of(context)
                                                    .grayCliff500
                                                    .copyWith(
                                                  fontSize: MyFonts.fonts16,
                                                  color: controller.selectedTime.value == time ? MyColors.white : MyColors.appTxtColor,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        65.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              Get.toNamed(RoutesStrings.bookingDetailsRoute);
            },
            child: Container(
              height: 50.sp,
              color: MyColors.secondaryColor,
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
              width: double.infinity,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AED 1200",
                    style: Theme
                        .of(context)
                        .grayCliff600
                        .copyWith(
                      fontSize: MyFonts.fonts18,
                      color: MyColors.white,
                    ),
                  ),
                  Text(
                    "Continue",
                    style: Theme
                        .of(context)
                        .grayCliff600
                        .copyWith(
                      fontSize: MyFonts.fonts18,
                      color: MyColors.white,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
