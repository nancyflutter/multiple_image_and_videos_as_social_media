/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../home.dart';

class AvailabilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: AvailabilityScreenController(),
      builder: (controller) {
        controller.abc.value;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Payment",
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
          body: Column(
            children: [
              ///Name
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: Container(
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(ImageConstants.carousalImage4),
                      ),
                      10.sp.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Miss Tess",
                              style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts14, color: MyColors.appTxtColor),
                            ),
                            6.sp.verticalSpace,
                            Text(
                              "Business Bay, Taj Hotel, 3rd Floor",
                              style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts13, color: MyColors.appTxtColor),
                            ),
                          ],
                        ),
                      )
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
                          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
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
                        style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
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
                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
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
                                  style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
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
                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
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
                          childAspectRatio: 2.5, // Aspect ratio of each item
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
                                  style: Theme.of(context).grayCliff500.copyWith(
                                        fontSize: MyFonts.fonts16,
                                        color: controller.selectedTime.value == time ? MyColors.white : MyColors.appTxtColor,
                                        letterSpacing: 1,
                                      ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: Container(height: 50.sp, color: MyColors.secondaryColor, padding: EdgeInsets.symmetric(vertical: 15.sp), width: double.infinity, alignment: Alignment.center, child: Text("Buy", style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.white))),
        );
      },
    );
  }
}
*/
import 'dart:ffi';

import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/core.dart';

class AvailabilityScreen extends StatelessWidget {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: AvailabilityScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Availability",
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
          body: (controller.checkAvailabilityData.value.available?.isNotEmpty ?? false)
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.sp, right: 10.sp, bottom: 70.sp, left: 10.sp),
                    child: Column(children: [
                      /// Name
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(4.sp),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 70.sp,
                                decoration: const BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                  ImageConstants.icUserPlaceholder,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              15.sp.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.passRestaurantDetail.value.restaurantName ?? '',
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16, color: MyColors.appTxtColor),
                                    ),
                                    6.sp.verticalSpace,
                                    Text(
                                      controller.passRestaurantDetail.value.restaurantAddress ?? '',
                                      style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts15, color: MyColors.appTxtColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      5.verticalSpace,

                      /// Number of persons
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
                                  style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
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
                                controller.numberOfPersons.value.toString(),
                                style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
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
                      5.verticalSpace,

                      /// Select Date TIME
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
                                  //Image.asset(ImageConstants.icCalendar, height: 12.sp),
                                  SvgPicture.asset(
                                    ImageConstants.icSVGCalender,
                                    height: 20.sp,
                                    width: 20.sp,
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    'Select Date',
                                    style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              GestureDetector(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2101),
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: MyColors.secondaryColor,
                                          dialogBackgroundColor: Colors.white,
                                          colorScheme: ColorScheme.light(
                                            primary: MyColors.secondaryColor,
                                            onPrimary: Colors.white,
                                            onSurface: Colors.black,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor: MyColors.secondaryColor,
                                              backgroundColor: Colors.white,
                                              textStyle: const TextStyle(
                                                fontSize: 16.0,
                                                fontFeatures: [FontFeature.enable('smcp')],
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  if (pickedDate != null) {
                                    controller.rawDate.value = pickedDate;
                                    controller.checkAvailabilityStatus(controller.rawDate.value);
                                    controller.selectedDate.value = DateFormat('MMM dd, yyyy').format(pickedDate);
                                  }
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: MyColors.materialScaffoldBackground,
                                          borderRadius: BorderRadius.circular(4.sp),
                                        ),
                                        padding: EdgeInsets.all(12.sp),
                                        child: Text(
                                          controller.selectedDate.value,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
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
                      5.verticalSpace,
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        elevation: 2.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    ImageConstants.icClock,
                                    height: 25.sp,
                                    width: 25.sp,
                                    color: MyColors.appTxtColor,
                                  ),
                                  SizedBox(
                                    width: 5.sp,
                                  ),
                                  Text(
                                    "Select Time",
                                    style: Theme.of(context).grayCliff700.copyWith(fontSize: MyFonts.fonts18),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              controller.availableBreakFastList.isNotEmpty
                                  ? Text(
                                      "Breakfast",
                                      style: Theme.of(context).grayCliff700.copyWith(fontSize: MyFonts.fonts16),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: controller.availableBreakFastList.isNotEmpty ? 10.sp : 0.sp,
                              ),
                              controller.availableBreakFastList.isNotEmpty
                                  ? Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      runSpacing: 10,
                                      spacing: 10,
                                      alignment: WrapAlignment.start,
                                      children: controller.availableBreakFastList
                                          .map(
                                            (e) => Container(
                                              padding: EdgeInsets.all(0.sp),
                                              width: 110.sp,
                                              decoration: BoxDecoration(color: MyColors.white),
                                              child: timeSlotWidget(
                                                time: e.time ?? '',
                                                context: context,
                                                isSelected: e.isSelect.value,
                                                onTap: () {
                                                  controller.availableBreakFastList.map((e) => e.isSelect.value = false).toList();
                                                  e.isSelect.value = true;
                                                  controller.preferredTime.value = e.time ?? '';
                                                  controller.availableBreakFastList.refresh();
                                                },
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ).paddingSymmetric(horizontal: 14.sp)
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: controller.availableBreakFastList.isNotEmpty ? 10.sp : 0.sp,
                              ),
                              controller.availableLunchList.isNotEmpty
                                  ? Text(
                                      "Lunch",
                                      style: Theme.of(context).grayCliff700.copyWith(fontSize: MyFonts.fonts16),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: controller.availableLunchList.isNotEmpty ? 10.sp : 0.sp,
                              ),
                              controller.availableLunchList.isNotEmpty
                                  ? Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      runSpacing: 10,
                                      spacing: 10,
                                      alignment: WrapAlignment.start,
                                      children: controller.availableLunchList
                                          .map(
                                            (e) => Container(
                                              padding: EdgeInsets.all(0.sp),
                                              width: 110.sp,
                                              decoration: BoxDecoration(color: MyColors.white),
                                              child: timeSlotWidget(
                                                time: e.time ?? '',
                                                context: context,
                                                isSelected: e.isSelect.value,
                                                onTap: () {
                                                  controller.availableLunchList.map((e) => e.isSelect.value = false).toList();
                                                  e.isSelect.value = true;
                                                  controller.preferredTime.value = e.time ?? '';
                                                  controller.availableLunchList.refresh();
                                                },
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ).paddingSymmetric(horizontal: 14.sp)
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: controller.availableLunchList.isNotEmpty ? 10.sp : 0.sp,
                              ),
                              controller.availableDinnerList.isNotEmpty
                                  ? Text(
                                      "Dinner",
                                      style: Theme.of(context).grayCliff700.copyWith(fontSize: MyFonts.fonts16),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: controller.availableDinnerList.isNotEmpty ? 10.sp : 0.sp,
                              ),
                              controller.availableDinnerList.isNotEmpty
                                  ? Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      runSpacing: 10,
                                      spacing: 10,
                                      alignment: WrapAlignment.start,
                                      children: controller.availableDinnerList
                                          .map(
                                            (e) => Container(
                                              width: 110.sp,
                                              decoration: BoxDecoration(color: MyColors.white),
                                              child: timeSlotWidget(
                                                time: e.time ?? '',
                                                context: context,
                                                isSelected: e.isSelect.value,
                                                onTap: () {
                                                  controller.availableDinnerList.map((e) => e.isSelect.value = false).toList();
                                                  e.isSelect.value = true;
                                                  controller.preferredTime.value = e.time ?? '';
                                                  controller.availableDinnerList.refresh();
                                                },
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ).paddingSymmetric(horizontal: 14.sp)
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: controller.availableDinnerList.isNotEmpty ? 10.sp : 0.sp,
                              ),
                              controller.availableLateDinnerList.isNotEmpty
                                  ? Text(
                                      "Late Dinner",
                                      style: Theme.of(context).grayCliff700.copyWith(fontSize: MyFonts.fonts16),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: controller.availableLateDinnerList.isNotEmpty ? 10.sp : 0.sp,
                              ),
                              controller.availableLateDinnerList.isNotEmpty
                                  ? Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      runSpacing: 10,
                                      spacing: 10,
                                      alignment: WrapAlignment.start,
                                      children: controller.availableLateDinnerList
                                          .map(
                                            (e) => Container(
                                              padding: EdgeInsets.all(0.sp),
                                              width: 110.sp,
                                              decoration: BoxDecoration(color: MyColors.white),
                                              child: timeSlotWidget(
                                                time: e.time ?? '',
                                                context: context,
                                                isSelected: e.isSelect.value,
                                                onTap: () {
                                                  controller.availableLateDinnerList.map((e) => e.isSelect.value = false).toList();
                                                  e.isSelect.value = true;
                                                  controller.preferredTime.value = e.time ?? '';
                                                  controller.availableLateDinnerList.refresh();
                                                },
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ).paddingSymmetric(horizontal: 14.sp)
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: controller.availableLateDinnerList.isNotEmpty ? 10.sp : 0.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                      5.verticalSpace,

                      /// From the restaurant
                      controller.passRestaurantDetail.value.termsAndConditions != null
                          ? SizedBox(
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.sp),
                                ),
                                elevation: 2.0,
                                child: Padding(
                                  padding: EdgeInsets.all(12.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "From the restaurant",
                                        style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16, color: MyColors.red),
                                      ),
                                      10.verticalSpace,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.passRestaurantDetail.value.termsAndConditions ?? "",
                                            style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ]),
                  ),
                )
              : const SizedBox.shrink(),
          bottomSheet: controller.availableBreakFastList.any((e) => e.isSelect.value == true) ||
                  controller.availableLunchList.any((e) => e.isSelect.value == true) ||
                  controller.availableDinnerList.any((e) => e.isSelect.value == true) ||
                  controller.availableLateDinnerList.any(
                    (e) => e.isSelect.value == true,
                  )
              ? GestureDetector(
                  onTap: () {
                    controller.onContinueTap();
                    Get.toNamed(
                      RoutesStrings.bookingEatInfoRoute,
                      arguments: controller.passRestaurantAvailabilityDetail.value,
                    );
                  },
                  child: Container(
                    height: 50.sp,
                    color: MyColors.secondaryColor,
                    padding: EdgeInsets.symmetric(vertical: 15.sp),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "Continue",
                      style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.white),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }

  Widget timeSlotWidget({
    required String time,
    required BuildContext context,
    required bool isSelected,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? MyColors.secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6.sp),
          border: Border.all(color: isSelected ? MyColors.secondaryColor : MyColors.appTxtLightColor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 12.sp),
          child: Text(
            DateFormat('hh:mm a').format(DateTime.parse(time)),
            style: Theme.of(context).grayCliff500.copyWith(
                  fontSize: 18.sp,
                  color: isSelected ? MyColors.white : MyColors.appTxtColor,
                ),
          ),
        ),
      ),
    );
  }
}
