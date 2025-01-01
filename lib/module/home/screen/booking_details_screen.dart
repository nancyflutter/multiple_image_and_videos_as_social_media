import '../../../core/core.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: BookingDetailsScreenController(),
      builder: (controller) {

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
                          Text("Ticket Details", style: Theme.of(context).grayCliff400),
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
                                      ),
                                      5.horizontalSpace,
                                      Text('Person', style: Theme.of(context).grayCliff300),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    "1",
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
                                        ImageConstants.icCalendar,
                                        height: 17.sp,
                                        width: 17.sp,
                                      ),
                                      5.horizontalSpace,
                                      Text('Date', style: Theme.of(context).grayCliff300),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    "Jun 19, 2024",
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
                                      ),
                                      5.horizontalSpace,
                                      Text('Time', style: Theme.of(context).grayCliff300),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    "01:30 PM",
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
                  Card(
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
                          SizedBox(height: 10.0),
                          Container(
                            height: 200.0,
                            child: GoogleMap(
                              onMapCreated: controller.onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: controller.serviceLocationLatLng.value,
                                zoom: 11.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.verticalSpace,

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
                            "Lamborghini Rides 20 minitues",
                            style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
                          ),
                          10.verticalSpace,
                          Text(
                            "Lamborghini Enghine, GearBox, Suspension, Air conditioning system, Brakes repair. We are your Lamborghini Dealer Alternative with a affoardable pricing. Call our service adviser @-971549981269 to schedule a free pickup.",
                            style: Theme.of(context).grayCliff400.copyWith(fontSize: 15.sp, height: 1.3.sp),
                          ),
                          10.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Selected Time 13:30",
                                style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
                              ),
                              Text(
                                "AED 120",
                                style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.verticalSpace,

                  ///Points
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reward Coins",
                                style: Theme.of(context).grayCliff600,
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    Text(
                                      "You have ",
                                      style: Theme.of(context).grayCliff300,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                    Image.asset(ImageConstants.iconCoin, height: 10.sp, width: 10.sp),
                                    Text(
                                      " 1050 ",
                                      style: Theme.of(context).grayCliff600,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "coins to be redeemed",
                                        style: Theme.of(context).grayCliff300,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          15.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 12.sp),
                                  // width: double.infinity,
                                  decoration: BoxDecoration(color: MyColors.materialScaffoldBackground, borderRadius: BorderRadius.circular(4.sp)),
                                  child: Text(
                                    "1050",
                                    style: Theme.of(context).grayCliff400,
                                  ),
                                ),
                              ),
                              8.horizontalSpace,
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 15.sp),
                                // width: double.infinity,
                                decoration: BoxDecoration(color: MyColors.secondaryColor, borderRadius: BorderRadius.circular(4.sp)),
                                child: Text("Apply", style: Theme.of(context).grayCliff700.copyWith(color: MyColors.white)),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 5.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.sp),
                              color: MyColors.secondarLightyColor,
                            ),
                            child: Text("100.0 Wander coins = 1 AED", style: Theme.of(context).grayCliff600.copyWith(color: MyColors.secondaryColor, fontSize: 14.sp)),
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
                                          "Booking Charge",
                                          style: Theme.of(context).grayCliff600.copyWith(fontSize: 15.sp),
                                        ),
                                        Text(
                                          "1 Ticket @ 120 AED per ticket",
                                          style: Theme.of(context).grayCliff400.copyWith(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "AED 120.0",
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
                                    ),
                                  ],
                                ),
                                15.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tax (10.0%)",
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: 15.sp),
                                    ),
                                    Text(
                                      "AED 120.0",
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
                                    ),
                                  ],
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
                                      "AED 120.0",
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
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
                                  style: Theme.of(context).grayCliff600.copyWith(fontSize: 15.sp),
                                ),
                                Text(
                                  "AED 162.0",
                                  style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
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
              Get.toNamed(RoutesStrings.paymentRoute);
            },
            child: Container(height: 50.sp, color: MyColors.secondaryColor, padding: EdgeInsets.symmetric(vertical: 15.sp), width: double.infinity, alignment: Alignment.center, child: Text("Proceed to Payment", style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.white))),
          ),
        );
      },
    );
  }
}
