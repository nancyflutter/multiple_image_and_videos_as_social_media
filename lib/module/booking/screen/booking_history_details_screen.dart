import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:multiple_image_and_videos_as_social_media/module/chat/model/send_message_emit_model.dart';
import '../../chat/screen/chat_screen.dart';
import '../booking.dart';

class BookingHistoryDetailsScreen extends StatelessWidget {
  const BookingHistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: GetX<BookingHistoryDetailsController>(
        init: BookingHistoryDetailsController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: MyColors.materialScaffoldBackground,
            appBar: AppBar(
              backgroundColor: MyColors.white,
              elevation: 0,
              centerTitle: true,
              title: Text("Booking Details", style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp)),
              leading: GestureDetector(onTap: controller.syncOrderListWithStatus, child: Icon(Icons.arrow_back_ios, color: MyColors.appTxtColor)),
            ),
            body: controller.getBookingResponse.value?.id != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                controller.getOrderStatusWidget(orderStatus: controller.getBookingResponse.value?.status ?? 0),
                                30.sp.verticalSpace,
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(ImageConstants.icUsers, width: 16.sp, color: MyColors.appTxtColor),
                                              10.sp.horizontalSpace,
                                              Text("Person", style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp)),
                                            ],
                                          ),
                                          12.sp.verticalSpace,
                                          Text(controller.getBookingResponse.value?.numberOfPerson ?? "----", style: Theme.of(context).grayCliff700),
                                        ],
                                      ),
                                      VerticalDivider(thickness: 2, endIndent: 6.sp, indent: 6.sp, color: MyColors.materialScaffoldBackground),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(ImageConstants.icCalender, width: 16.sp, color: MyColors.appTxtColor),
                                              10.sp.horizontalSpace,
                                              Text("Date", style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp)),
                                            ],
                                          ),
                                          12.sp.verticalSpace,
                                          Text(
                                            DateFormat('MMMM dd, yyyy').format(controller.getBookingResponse.value?.date ?? DateTime.now()),
                                            style: Theme.of(context).grayCliff700.copyWith(letterSpacing: 1, fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                      VerticalDivider(thickness: 2, endIndent: 6.sp, indent: 6.sp, color: MyColors.materialScaffoldBackground),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(ImageConstants.iconHistory, width: 16.sp, color: MyColors.appTxtColor),
                                              10.sp.horizontalSpace,
                                              Text("Time", style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp))
                                            ],
                                          ),
                                          12.sp.verticalSpace,
                                          Text(
                                            controller.getBookingResponse.value?.time ?? "--------",
                                            style: Theme.of(context).grayCliff700.copyWith(letterSpacing: 1, fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                40.sp.verticalSpace,
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(ImageConstants.icBookingId, width: 16.sp, color: MyColors.appTxtColor),
                                              10.sp.horizontalSpace,
                                              Text("Booking ID", style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp)),
                                            ],
                                          ),
                                          12.sp.verticalSpace,
                                          Text(
                                            controller.getBookingResponse.value?.bookNumber ?? "------",
                                            style: Theme.of(context).grayCliff700.copyWith(fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                      VerticalDivider(thickness: 2, endIndent: 6.sp, indent: 6.sp, color: MyColors.materialScaffoldBackground),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(ImageConstants.icPrice, width: 16.sp, color: MyColors.appTxtColor),
                                              10.sp.horizontalSpace,
                                              Text("Price", style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp)),
                                            ],
                                          ),
                                          12.sp.verticalSpace,
                                          Text(
                                            "${controller.getBookingResponse.value?.subTotal ?? "----"} AED",
                                            style: Theme.of(context).grayCliff700.copyWith(letterSpacing: 1, fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ).paddingAll(16.sp),
                        ),
                        10.sp.verticalSpace,
                        Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.sp)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Location", style: Theme.of(context).grayCliff600).paddingSymmetric(horizontal: 8.sp, vertical: 10.sp),
                              const Divider(height: 1),
                              SizedBox(
                                width: Get.width,
                                height: 200,
                                child: GoogleMap(
                                  onMapCreated: controller.onMapCreated,
                                  markers: {controller.getMarker.value},
                                  initialCameraPosition: CameraPosition(target: controller.position.value, zoom: 14.0),
                                  zoomControlsEnabled: false,
                                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())},
                                ).marginSymmetric(horizontal: 8.sp),
                              ).paddingOnly(bottom: 10.sp),
                            ],
                          ),
                        ),
                        10.sp.verticalSpace,
                        Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.getBookingResponse.value?.bookingType == "ride" ? controller.getBookingResponse.value?.service?.first.title ?? "--------" : "Cuisine",
                                  style: Theme.of(context).grayCliff800.copyWith(letterSpacing: .5, fontWeight: FontWeight.bold),
                                ),
                                8.sp.verticalSpace,
                                Text(
                                  controller.getBookingResponse.value?.bookingType == "ride"
                                      ? controller.getBookingResponse.value?.service?.first.description ?? ""
                                      : controller.getBookingResponse.value?.restaurantsdDetail?.attributes?.cuisine ?? "--------",
                                  style: Theme.of(context).grayCliff400.copyWith(height: 1.4, fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ).paddingAll(16.sp),
                        ),
                        10.sp.verticalSpace,
                        Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          controller.getBookingResponse.value?.supplier?.image?.isNotEmpty ?? false
                                              ? ClipRRect(
                                                  borderRadius: BorderRadius.circular(100.sp),
                                                  child: CachedNetworkImage(
                                                    imageUrl: controller.getBookingResponse.value?.supplier?.image ?? "",
                                                    height: 54.sp,
                                                    width: 54.sp,
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder: (context, url, progress) => Image.asset(ImageConstants.icUserPlaceholder),
                                                    errorWidget: (context, url, error) => Image.asset(ImageConstants.icUserPlaceholder),
                                                  ),
                                                )
                                              : const SizedBox(),
                                          10.sp.horizontalSpace,
                                          Expanded(
                                            child: Text(
                                              controller.getBookingResponse.value?.supplier?.serviceName ?? "",
                                              style: Theme.of(context).grayCliff800.copyWith(letterSpacing: .5, fontWeight: FontWeight.bold, fontSize: 16.sp),
                                            ),
                                          ),
                                          10.sp.horizontalSpace,
                                        ],
                                      ),
                                    ),
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Image.asset(ImageConstants.icNewMessage, width: 40.sp).addGesture(
                                          () => controller.getBookingResponse.value?.serviceId.toString() != ""
                                              ? Get.to(
                                                  const ChatScreen(),
                                                  arguments: SendMessageEmitModel(
                                                    bookId: Get.arguments.toString(),
                                                    userId: controller.getBookingResponse.value?.userId.toString(),
                                                    userName: controller.getBookingResponse.value?.supplierDetails?.serviceName.toString(),
                                                    serviceId: controller.getBookingResponse.value?.serviceId.toString(),
                                                  ),
                                                )?.then((value) {
                                                  controller.isChatOpen.value = value;
                                                  controller.isChatOpen.refresh();
                                                  if (value) {
                                                    controller.msgCount.value = 0;
                                                    controller.socketHelperController.toBookingId.value = "";
                                                    controller.msgCount.refresh();
                                                  }
                                                })
                                              : null,
                                        ),
                                        (controller.msgCount.value) > 0
                                            ? Container(
                                                height: 20.sp,
                                                width: 20.sp,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: MyColors.red,
                                                  borderRadius: BorderRadius.circular(100.sp),
                                                ),
                                                child: Text(
                                                  "${controller.msgCount.value}",
                                                  style: Theme.of(context).grayCliff700.copyWith(fontSize: 12.sp, color: MyColors.white),
                                                ),
                                              )
                                            : SizedBox(height: 12.sp),
                                      ],
                                    ),
                                  ],
                                ),
                                18.sp.verticalSpace,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(ImageConstants.icCall, width: 16.sp, color: MyColors.appTxtColor),
                                    8.sp.horizontalSpace,
                                    Text(
                                      controller.getBookingResponse.value?.supplierDetails?.mobileNumber != null
                                          ? ('${controller.getBookingResponse.value?.supplierDetails?.mobileCode ?? ''}${controller.getBookingResponse.value?.supplierDetails?.mobileNumber ?? ''}')
                                          : controller.getBookingResponse.value?.mobileNumber ?? "",
                                      style: Theme.of(context).grayCliff500.copyWith(letterSpacing: .5, fontSize: 14.sp),
                                    ),
                                    16.sp.horizontalSpace,
                                    Image.asset(ImageConstants.icEmail, width: 16.sp, color: MyColors.appTxtColor),
                                    8.sp.horizontalSpace,
                                    Expanded(
                                      child: Text(
                                        controller.getBookingResponse.value?.supplierDetails?.loginEmail ?? controller.getBookingResponse.value?.emailId ?? '',
                                        style: Theme.of(context).grayCliff500.copyWith(letterSpacing: .5, fontSize: 14.sp),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ).paddingAll(16.sp),
                        ),
                        10.sp.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 6.sp),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset(ImageConstants.icClosePopUp, height: 26.sp).addGesture(() => Get.back()),
                                              ],
                                            ),
                                            Image.asset(ImageConstants.icWhatINeed, height: 60.sp),
                                            12.sp.verticalSpace,
                                            (controller.getBookingResponse.value?.service?.isNotEmpty ?? false)
                                                ? HtmlWidget(
                                                    controller.getBookingResponse.value?.service?.first.whatINeed ?? "What i need?",
                                                    renderMode: RenderMode.column,
                                                    textStyle: const TextStyle(fontSize: 14),
                                                  )
                                                : Text("What i need?", style: Theme.of(context).grayCliff500),
                                            10.sp.verticalSpace
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 98.sp,
                                  padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 10.sp),
                                  decoration: BoxDecoration(color: MyColors.white, borderRadius: BorderRadius.circular(6.sp)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(ImageConstants.icWhatINeed, height: 44.sp),
                                      12.sp.verticalSpace,
                                      Text("What i need?", style: Theme.of(context).grayCliff500.copyWith(letterSpacing: .5))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            8.sp.horizontalSpace,
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final String googleMapsUrl =
                                      "google.navigation:q=${controller.getBookingResponse.value?.supplier?.latitude},${controller.getBookingResponse.value?.supplier?.longitude}";
                                  final Uri gmmIntentUri = Uri.parse(googleMapsUrl);

                                  if (await canLaunchUrl(gmmIntentUri)) {
                                    await launchUrl(gmmIntentUri, mode: LaunchMode.externalApplication);
                                  } else {
                                    throw "Could not open the map.";
                                  }
                                },
                                child: Container(
                                  height: 98.sp,
                                  padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 10.sp),
                                  decoration: BoxDecoration(color: MyColors.white, borderRadius: BorderRadius.circular(6.sp)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(ImageConstants.icNewDirection, height: 44.sp),
                                      12.sp.verticalSpace,
                                      Text("Get direction", style: Theme.of(context).grayCliff500.copyWith(letterSpacing: .5))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            8.sp.horizontalSpace,
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  try {
                                    Position currentPosition = await _getCurrentLocation();
                                    String uberUrl =
                                        "uber://?action=setPickup&pickup[latitude]=${currentPosition.latitude}&pickup[longitude]=${currentPosition.longitude}&dropoff[latitude]=${controller.getBookingResponse.value?.supplier?.latitude}&dropoff[longitude]=${controller.getBookingResponse.value?.supplier?.longitude}";

                                    if (await canLaunchUrl(Uri.parse(uberUrl))) {
                                      await launchUrl(Uri.parse(uberUrl), mode: LaunchMode.externalApplication);
                                    } else {
                                      await launchUrl(
                                        Uri.parse("market://details?id=com.ubercab"),
                                        mode: LaunchMode.externalApplication,
                                      );
                                    }
                                  } catch (e) {
                                    showCustomFlushBar(msg: "Unable to open Uber app: $e");
                                  }
                                },
                                child: Container(
                                  height: 98.sp,
                                  padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 10.sp),
                                  decoration: BoxDecoration(color: MyColors.white, borderRadius: BorderRadius.circular(6.sp)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(ImageConstants.icUber, height: 44.sp),
                                      12.sp.verticalSpace,
                                      Text(
                                        "Uber",
                                        style: Theme.of(context).grayCliff500.copyWith(letterSpacing: .5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        60.sp.verticalSpace
                      ],
                    ).paddingAll(10.sp),
                  )
                : const SizedBox.shrink(),
            bottomSheet: controller.itHasToShowBoomSheet
                ? Container(
                    width: Get.width,
                    height: 50.sp,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: MyColors.redBorderColor),
                    child: Text("Cancel Booking", style: Theme.of(context).grayCliff800.copyWith(color: MyColors.white, fontSize: 16.sp)),
                  ).addGesture(
                    () => controller.getBookingResponse.value?.bookingType == "eat"
                        ? controller.changeOrderStatus(
                            status: 'canceled', statusInfo: "Are you sure you want to cancel booking", reservationId: controller.getBookingResponse.value?.reservationId ?? "")
                        : null,
                  )
                : null,
          );
        },
      ),
    );
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check for location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    // Get current location
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
