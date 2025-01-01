import 'package:multiple_image_and_videos_as_social_media/core/core.dart';
import 'package:multiple_image_and_videos_as_social_media/module/booking/widget/booking_detail_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/controller/track_order_controller.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: TrackOrderController(),
        builder: (controller) {
          return PopScope(
              canPop: false,
              onPopInvoked: (didPop) {
                Get.find<DashboardScreenController>().goToHome();
              },
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: MyColors.white,
                  elevation: 0.5,
                  centerTitle: true,
                  title: Text(
                    "Track Order",
                    style: Theme.of(context).grayCliff600.copyWith(
                          fontSize: 16.sp,
                        ),
                  ),
                  leading: Image.asset(
                    scale: 3,
                    ImageConstants.iconBack,
                  ).addGesture(
                    () {
                      Get.lazyPut(() => DashboardScreenController());
                      Get.find<DashboardScreenController>().goToHome();
                      Get.back();
                    },
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () async {
                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: '${controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.contactEmail}',
                        );

                        if (await canLaunchUrl(emailUri)) {
                          await launchUrl(emailUri);
                        } else {
                          throw 'Could not launch $emailUri';
                        }
                      },
                      child: Image.asset(
                        ImageConstants.iconMsgWhite,
                        height: 30.sp,
                        width: 30.sp,
                        color: MyColors.appTxtColor,
                      ),
                    ),
                    SizedBox(
                      width: 15.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.sp),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const BookingDetailsScreen2());
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Image.asset(
                          ImageConstants.iconBookingDetail,
                          height: 30.sp,
                          width: 30.sp,
                          color: MyColors.appTxtColor,
                        ),
                      ),
                    ),
                  ],
                ),
                body: controller.restaurantBookingDetails.value.id != null
                    ? Stack(
                        children: [
                          GoogleMap(
                            onMapCreated: controller.onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: controller.serviceLocationLatLng.value,
                              zoom: 3.0,
                            ),
                            markers: Set<Marker>.of(controller.markers.values),
                            polylines: controller.polyLines2,
                          ),
                          Container(
                            height: 100.sp,
                            color: MyColors.white,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            ImageConstants.iconBookingId,
                                            height: 17.sp,
                                            width: 17.sp,
                                            color: MyColors.appTxtColor,
                                          ),
                                          5.horizontalSpace,
                                          Text('Booking ID', style: Theme.of(context).grayCliff300),
                                        ],
                                      ),
                                      10.verticalSpace,
                                      Text(
                                        controller.restaurantBookingDetails.value.bookNumber ?? '',
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
                                        '${DateFormat('MMM dd, yyyy').format(controller.restaurantBookingDetails.value.date ?? DateTime.now())} ${controller.restaurantBookingDetails.value.time}',
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
                                            ImageConstants.icPrice,
                                            height: 17.sp,
                                            width: 17.sp,
                                            color: MyColors.appTxtColor,
                                          ),
                                          5.horizontalSpace,
                                          Text('Price', style: Theme.of(context).grayCliff300),
                                        ],
                                      ),
                                      10.verticalSpace,
                                      Text(
                                        'AED ${controller.restaurantBookingDetails.value.totalAmount}',
                                        style: Theme.of(context).grayCliff600.copyWith(color: MyColors.secondaryColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.sp),
                            child: DraggableScrollableSheet(
                              key: controller.sheet,
                              initialChildSize: 0.2,
                              maxChildSize: controller.restaurantBookingDetails.value.statusString == "Pending" ? 0.4 : 0.3,
                              minChildSize: 0.2,
                              expand: true,
                              snap: true,
                              snapSizes: controller.restaurantBookingDetails.value.statusString == "Pending" ? [0.4] : [0.3],
                              controller: controller.draggableScrollableController.value,
                              builder: (BuildContext context, ScrollController scrollController) {
                                return DecoratedBox(
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.sp)),
                                  child: CustomScrollView(
                                    controller: scrollController,
                                    slivers: [
                                      SliverList.list(
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(top: 18.sp),
                                                child: Container(
                                                  height: 4.sp,
                                                  width: 45.sp,
                                                  decoration: BoxDecoration(
                                                    color: MyColors.appTxtColor.withOpacity(0.5),
                                                    borderRadius: BorderRadius.circular(3.sp),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 25.sp,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                                                child: controller.restaurantBookingDetails.value.statusString == "Pending"
                                                    ? Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Icon(
                                                            Icons.circle,
                                                            color: MyColors.greenBorderColor,
                                                            size: 22.sp,
                                                          ),
                                                          SizedBox(
                                                            width: 15.sp,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                "Booking Pending",
                                                                style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp, color: MyColors.greenBorderColor),
                                                              ),
                                                              SizedBox(
                                                                height: 3.sp,
                                                              ),
                                                              SizedBox(
                                                                width: Get.width - 90.sp,
                                                                child: Text(
                                                                  'Please wait while we connect to your booking host. if it is taking a while to connect it may be because your host is offline or it is out of hours.',
                                                                  style: Theme.of(context).grayCliff300.copyWith(fontSize: 12.sp),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    : Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Image.asset(
                                                            ImageConstants.icCloseFill,
                                                            height: 17,
                                                            width: 17,
                                                          ),
                                                          SizedBox(
                                                            width: 15.sp,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                "Booking Cancelled",
                                                                style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp, color: MyColors.redBorderColor),
                                                              ),
                                                              SizedBox(
                                                                height: 3.sp,
                                                              ),
                                                              SizedBox(
                                                                width: Get.width - 90.sp,
                                                                child: Text(
                                                                  'Sorry your booking has been cancelled',
                                                                  style: Theme.of(context).grayCliff300.copyWith(fontSize: 12.sp),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                              ),
                                              Divider(
                                                thickness: 2.5,
                                                color: MyColors.appTxtColor.withOpacity(0.2),
                                                height: 35.sp,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Restaurant",
                                                    style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.sp,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor: MyColors.lightAppTxtColor.withOpacity(0.2),
                                                      child: ClipOval(
                                                        child: Image.network(
                                                          controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.imageUrl ?? '',
                                                          fit: BoxFit.cover,
                                                          width: 100,
                                                          height: 100,
                                                          errorBuilder: (context, error, stackTrace) {
                                                            return Image.asset(
                                                              ImageConstants.iconUser,
                                                              fit: BoxFit.cover,
                                                              width: 20.sp,
                                                              height: 20.sp,
                                                              color: MyColors.lightAppTxtColor.withOpacity(0.6),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    10.sp.horizontalSpace,
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.name ?? '',
                                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts15, color: MyColors.appTxtColor),
                                                          ),
                                                          4.sp.verticalSpace,
                                                          Text(
                                                            '${controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.addressLine1 ?? ''},${controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.addressLine2 ?? ''}',
                                                            style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts15, color: MyColors.appTxtColor),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        final Uri uri = Uri(
                                                          scheme: 'tel',
                                                          path: '${controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.phone}',
                                                        );
                                                        if (await canLaunchUrl(uri)) {
                                                          await launchUrl(uri);
                                                        } else {
                                                          throw 'Could not launch ${controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.phone}';
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        ImageConstants.iconCall,
                                                        height: 35.sp,
                                                        width: 35.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.sp,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: MyColors.secondaryColor, // Color of the underline
                                                      width: 1.0, // Thickness of the underline
                                                    ),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom: 1.0), // Adjust the padding to increase space
                                                  child: Text(
                                                    'Edit Reservation',
                                                    style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts15, color: MyColors.secondaryColor),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                bottomSheet: controller.restaurantBookingDetails.value.statusString == "Pending"
                    ? GestureDetector(
                        onTap: () {
                          controller.changeOrderStatusImpl();
                        },
                        // onTap: controller.isCancelOrderButtonEnable.value
                        //     ? () {
                        //   controller.changeOrderStatusImpl();
                        //       }
                        //     : null,
                        child: Container(
                          height: 50.sp,
                          color: MyColors.red,
                          padding: EdgeInsets.symmetric(vertical: 15.sp),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            "Cancel Order",
                            style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.white),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ));
        });
  }
}
