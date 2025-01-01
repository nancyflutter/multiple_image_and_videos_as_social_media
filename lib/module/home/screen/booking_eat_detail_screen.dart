import 'package:flutter_svg/flutter_svg.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/expanded_html_to_text_widget.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/screen/full_screen_map_view.dart';
import '../../../core/core.dart';

class BookingEatDetailScreen extends StatelessWidget {
  const BookingEatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: BookingDetailsScreenController(),
      initState: (cnt) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          cnt.controller?.countRestaurantTaxApi();
        });
      },
      builder: (controller) {
        controller.abc.value;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Booking Details",
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
              padding: EdgeInsets.all(12.sp),
              child: Column(
                children: [
                  ///Ticket Details
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
                            "Booking Details",
                            style: Theme.of(context).grayCliff700.copyWith(fontSize: 14.sp),
                          ),
                          20.verticalSpace,
                          Text(
                            controller.appController.loginResponse.value.fullName?.split(' ').first ?? '',
                            style: Theme.of(context).grayCliff500.copyWith(fontSize: 16.sp),
                          ),
                          5.verticalSpace,
                          Text(
                            controller.appController.loginResponse.value.email ?? '',
                            style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.secondaryColor),
                          ),
                          Divider(
                            height: 30.sp,
                          ),
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
                                      SvgPicture.asset(
                                        ImageConstants.icSVGCalender,
                                        height: 17.sp,
                                        width: 17.sp,
                                      ),
                                      // Image.asset(
                                      //   ImageConstants.icCalendar,
                                      //   height: 17.sp,
                                      //   width: 17.sp,
                                      // ),
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
                                    DateFormat('hh:mm a').format(DateTime.parse(controller.passRestaurantAvailabilityDetail.value.time ?? '')),
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
                  10.verticalSpace,

                  ///Location
                  GestureDetector(
                    onTap: () {
                      Get.to(FullScreenMapView(
                        target: controller.serviceLocationLatLng.value,
                        marker: controller.markers,
                        onMapCreated: (GoogleMapController) {
                          controller.onMapCreated;
                        },
                      ));
                    },
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
                              'Location',
                              style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                            ),
                            // Text(controller.passRestaurantAvailabilityDetail.value.restaurantAddress ?? ""),
                            const SizedBox(height: 10.0),
                            SizedBox(
                              height: 200.0,
                              child: GoogleMap(
                                onMapCreated: controller.onMapCreated,
                                initialCameraPosition: CameraPosition(
                                  target: controller.serviceLocationLatLng.value,
                                  zoom: 11.0,
                                ),
                                zoomControlsEnabled: false,
                                zoomGesturesEnabled: false,
                                onTap: (lat) {
                                  Get.to(FullScreenMapView(
                                    target: controller.serviceLocationLatLng.value,
                                    marker: controller.markers,
                                    onMapCreated: (GoogleMapController) {
                                      controller.onMapCreated;
                                    },
                                  ));
                                },
                                markers: Set<Marker>.of(controller.markers),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,

                  // /// Info
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(5.sp),
                  //   ),
                  //   elevation: 2.0,
                  //   child: Container(
                  //     padding: EdgeInsets.all(15.sp),
                  //     decoration: BoxDecoration(
                  //       color: MyColors.white,
                  //       borderRadius: BorderRadius.circular(4.sp),
                  //     ),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text("Raj Jariwala", style: Theme.of(context).grayCliff600),
                  //         8.verticalSpace,
                  //         Text("rajjwos@gmail.com", style: Theme.of(context).grayCliff600.copyWith(color: MyColors.secondaryColor)),
                  //         // 20.verticalSpace,
                  //         Divider(
                  //           color: MyColors.dividerColor,
                  //           thickness: 2,
                  //           height: 25.sp,
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: [
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   "1",
                  //                   style: Theme.of(context).grayCliff600,
                  //                 ),
                  //                 5.verticalSpace,
                  //                 Text('Total Guest', style: Theme.of(context).grayCliff300),
                  //               ],
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.symmetric(horizontal: 15.sp),
                  //               height: 30.sp,
                  //               width: 2.sp,
                  //               color: MyColors.dividerColor,
                  //             ),
                  //             Expanded(
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     "Jun 19, 2024  06:15 PM",
                  //                     style: Theme.of(context).grayCliff600,
                  //                   ),
                  //                   5.verticalSpace,
                  //                   Text('Res Date', style: Theme.of(context).grayCliff300),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  ///Description
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    elevation: 2.0,
                    child: Container(
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.sp),
                        color: MyColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.passRestaurantAvailabilityDetail.value.restaurantName ?? '',
                            style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
                          ),
                          10.verticalSpace,
                          ExpandableHtmlWidget(
                            htmlContent: controller.passRestaurantAvailabilityDetail.value.restaurantDescription ?? "",
                            // collapsedHeight: 100.0,
                            textStyle: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.verticalSpace,

                  ///Payment Summary
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    elevation: 2.0,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.sp), color: MyColors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Summary",
                                  style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
                                ),
                                15.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Other Charge",
                                          style: Theme.of(context).grayCliff600.copyWith(fontSize: 15.sp),
                                        ),
                                        Text(
                                          "Convenience Fee",
                                          style: Theme.of(context).grayCliff400.copyWith(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "AED ${double.parse(controller.countRestaurantTaxData.value.convenienceFee ?? '0')}",
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 2.sp,
                            color: MyColors.dividerColor,
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Amount",
                                  style: Theme.of(context).grayCliff600.copyWith(fontSize: 14.sp),
                                ),
                                Text(
                                  "AED ${double.parse(controller.countRestaurantTaxData.value.convenienceFee ?? '0')}",
                                  style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  60.verticalSpace,
                ],
              ),
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              Get.toNamed(RoutesStrings.paymentRoute, arguments: controller.passRestaurantAvailabilityDetail.value);
            },
            child: Container(
              height: 50.sp,
              color: MyColors.secondaryColor,
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Proceed to Payment",
                style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
