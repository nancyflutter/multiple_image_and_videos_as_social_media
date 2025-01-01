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

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/core.dart';

class BookingEatInfoScreen extends StatelessWidget {
  const BookingEatInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: BookingEatInfoController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Booking",
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  /// Name
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // CircleAvatar(
                          //   radius: 30,
                          //   backgroundColor: MyColors.lightAppTxtColor.withOpacity(0.2),
                          //   child: ClipOval(
                          //     child: Image.network(
                          //       controller.passRestaurantAvailabilityDetail.value.restaurantImage ?? '',
                          //       fit: BoxFit.cover,
                          //       width: 100,
                          //       height: 100,
                          //       errorBuilder: (context, error, stackTrace) {
                          //         return Image.asset(
                          //           ImageConstants.iconUser,
                          //           fit: BoxFit.cover,
                          //           width: 30.sp,
                          //           height: 30.sp,
                          //           color: MyColors.lightAppTxtColor.withOpacity(0.6),
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),
                          Container(
                            height: 70.sp,
                            decoration: const BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(
                              ImageConstants.icUserPlaceholder,
                              fit: BoxFit.cover,
                            ),
                          ),
                          10.sp.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.passRestaurantAvailabilityDetail.value.restaurantName ?? '',
                                  style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16, color: MyColors.appTxtColor),
                                ),
                                6.sp.verticalSpace,
                                Text(
                                  controller.passRestaurantAvailabilityDetail.value.restaurantAddress ?? '',
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

                  /// Info
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    elevation: 2.0,
                    child: Container(
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(4.sp),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.appController.loginResponse.value.fullName?.split(' ').first ?? '', style: Theme.of(context).grayCliff600),
                          8.verticalSpace,
                          Text(controller.appController.loginResponse.value.email ?? '', style: Theme.of(context).grayCliff600.copyWith(color: MyColors.secondaryColor)),
                          20.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageConstants.icUsers,
                                        height: 17.sp,
                                        width: 17.sp,
                                        color: MyColors.appTxtColor,
                                      ),
                                      5.horizontalSpace,
                                      Text('Person', style: Theme.of(context).grayCliff300),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    controller.passRestaurantAvailabilityDetail.value.totalPerson ?? '',
                                    style: Theme.of(context).grayCliff600,
                                  )
                                ],
                              ),
                              Container(
                                height: 30.sp,
                                width: 2.sp,
                                color: MyColors.dividerColor,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      // Image.asset(
                                      //   ImageConstants.icCalendar,
                                      //   height: 17.sp,
                                      //   width: 17.sp,
                                      //   color: MyColors.appTxtColor,
                                      // ),
                                      SvgPicture.asset(
                                        ImageConstants.icSVGCalender,
                                        height: 17.sp,
                                        width: 17.sp,
                                        colorFilter: ColorFilter.mode(MyColors.appTxtColor, BlendMode.srcIn),
                                      ),
                                      5.horizontalSpace,
                                      Text('Date', style: Theme.of(context).grayCliff300),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    controller.passRestaurantAvailabilityDetail.value.date ?? '',
                                    style: Theme.of(context).grayCliff600,
                                  )
                                ],
                              ),
                              Container(
                                height: 30.sp,
                                width: 2.sp,
                                color: MyColors.dividerColor,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageConstants.icClock,
                                        height: 17.sp,
                                        width: 17.sp,
                                        color: MyColors.appTxtColor,
                                      ),
                                      5.horizontalSpace,
                                      Text('Time', style: Theme.of(context).grayCliff300),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    DateFormat('hh:mm a').format(
                                      DateTime.parse(controller.passRestaurantAvailabilityDetail.value.time ?? ''),
                                    ),
                                    style: Theme.of(context).grayCliff600,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  ///Personal Details
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    elevation: 2.0,
                    child: Container(
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(4.sp),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Details",
                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                          ),
                          10.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: controller.countryCodeController.value,
                                  // keyboardType: TextInputType.number,
                                  readOnly: true,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: MyColors.materialScaffoldBackground,
                                    errorStyle: TextStyle(
                                      fontSize: 0.sp,
                                      color: MyColors.transparent,
                                    ),
                                    hintStyle: Theme.of(context).grayCliff400.copyWith(color: MyColors.hintColor),
                                    border: CommonProps.textFieldWhiteBorder,
                                    disabledBorder: CommonProps.textFieldWhiteBorder,
                                    enabledBorder: CommonProps.textFieldWhiteBorder,
                                    errorBorder: CommonProps.textFieldWhiteBorder,
                                    focusedBorder: CommonProps.textFieldWhiteBorder,
                                    contentPadding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 12.sp),
                                    focusedErrorBorder: CommonProps.textFieldWhiteBorder,
                                    prefixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                // barrierDismissible: false,
                                                builder: (context) {
                                                  return AlertDialog(
                                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                                      titlePadding: EdgeInsets.all(15.sp),
                                                      contentPadding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                                      // title: GestureDetector(
                                                      //   onTap: () {
                                                      //     controller.resetCountryData();
                                                      //     Get.back();
                                                      //   },
                                                      //   child: Container(
                                                      //     alignment: Alignment.topRight,
                                                      //     child: Image.asset(ImageConstants.iconFilter, height: 25.sp, width: 25.sp),
                                                      //   ),
                                                      // ),
                                                      title: Text(
                                                        "Select Country",
                                                        style: Theme.of(context).grayCliff500.copyWith(fontSize: 25.sp),
                                                      ),
                                                      content: countryCodeBookingScreen(context));
                                                });
                                          },
                                          child: Row(
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              5.horizontalSpace,
                                              Padding(padding: EdgeInsets.only(left: 10.sp)),
                                              Text(
                                                "+${controller.selectedCountry["phone_code"]}",
                                                style: Theme.of(context).grayCliff600.copyWith(
                                                      fontSize: MyFonts.fonts14,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.arrow_drop_down_outlined,
                                                color: MyColors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 4.sp),
                                      ],
                                    ),
                                  ),
                                  cursorColor: MyColors.secondaryColor,
                                  style: Theme.of(context).grayCliff400.copyWith(color: MyColors.black),
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                flex: 7,
                                child: TextFormField(
                                  controller: controller.mobileNoController.value,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: MyColors.materialScaffoldBackground,
                                      errorStyle: TextStyle(
                                        fontSize: 0.sp,
                                        color: MyColors.transparent,
                                      ),
                                      counterText: "",
                                      hintText: "Mobile Number",
                                      hintStyle: Theme.of(context).grayCliff400.copyWith(color: MyColors.hintColor),
                                      border: CommonProps.textFieldWhiteBorder,
                                      disabledBorder: CommonProps.textFieldWhiteBorder,
                                      enabledBorder: CommonProps.textFieldWhiteBorder,
                                      errorBorder: CommonProps.textFieldWhiteBorder,
                                      focusedBorder: CommonProps.textFieldWhiteBorder,
                                      focusedErrorBorder: CommonProps.textFieldWhiteBorder,
                                      contentPadding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 12.sp)),
                                  maxLength: controller.selectedCountry["max_length"],

                                  validator: (value) {
                                    value = value!.replaceAll(RegExp(r'[^\d]'), '');

                                    if (value.isEmpty) {
                                      return 'Please enter phone number';
                                    }

                                    int minLength = controller.selectedCountry["min_length"];
                                    int maxLength = controller.selectedCountry["max_length"];
                                    if (value.length < minLength || value.length > maxLength) {
                                      return 'Phone number must have ${controller.selectedCountry["max_length"]} digits';
                                    }
                                    return null;
                                  },
                                  // onChanged: (value) {
                                  //   controller.formKeyPhone.currentState!.validate();
                                  // },
                                  cursorColor: MyColors.secondaryColor,
                                  style: Theme.of(context).grayCliff400.copyWith(color: MyColors.black),
                                ),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          TextFormField(
                            controller: controller.specialRequestController.value,
                            maxLines: 4,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: MyColors.materialScaffoldBackground,
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                  color: MyColors.transparent,
                                ),
                                hintText: "Speical Request (Allergies, Seating Preference)",
                                hintStyle: Theme.of(context).grayCliff400.copyWith(color: MyColors.hintColor),
                                border: CommonProps.textFieldWhiteBorder,
                                disabledBorder: CommonProps.textFieldWhiteBorder,
                                enabledBorder: CommonProps.textFieldWhiteBorder,
                                errorBorder: CommonProps.textFieldWhiteBorder,
                                focusedBorder: CommonProps.textFieldWhiteBorder,
                                focusedErrorBorder: CommonProps.textFieldWhiteBorder,
                                contentPadding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 12.sp)),
                            cursorColor: MyColors.secondaryColor,
                            style: Theme.of(context).grayCliff400.copyWith(color: MyColors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  75.verticalSpace,
                ],
              ),
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: () => Get.toNamed(RoutesStrings.bookingEatDetailsRoute, arguments: controller.passRestaurantAvailabilityDetail.value),
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
          ),
        );
      },
    );
  }
}

countryCodeBookingScreen(BuildContext context) {
  return SizedBox(
    height: 700.sp,
    width: double.maxFinite,
    child: GetX<BookingEatInfoController>(
      init: BookingEatInfoController(),
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50.sp,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Search country here...",
                  filled: true,
                  fillColor: MyColors.materialScaffoldBackground,
                  labelStyle: TextStyle(color: MyColors.appTxtColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
                  enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(8.sp), borderSide: BorderSide(color: MyColors.secondaryColor)),
                  focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(8.sp), borderSide: BorderSide(color: Colors.red)),
                ),
                onChanged: (value) {
                  controller.filterItem(value ?? "");
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.foundItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Console.debug(controller.foundItems[index], key: "selected country data");
                      controller.selectedCountry.value = controller.foundItems[index];
                      controller.countryCodeController.value.clear();
                      controller.mobileNoController.value.clear();
                      // controller.formKeyPhone.currentState!.validate();
                      Get.back();
                      controller.resetCountryData();
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 10.sp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            controller.foundItems[index]["flag"],
                            style: TextStyle(fontSize: 25.sp),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Text(
                              controller.foundItems[index]["country_en"],
                              style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts16),
                            ),
                          ),
                          SizedBox(width: 5.sp),
                          Text(
                            "(+${controller.foundItems[index]["phone_code"]})",
                            style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts14),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    ),
  );
}
