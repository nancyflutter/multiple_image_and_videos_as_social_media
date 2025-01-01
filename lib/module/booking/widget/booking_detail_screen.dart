import 'package:multiple_image_and_videos_as_social_media/module/booking/model/booking_history_model.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/controller/track_order_controller.dart';

import '../../../core/core.dart';
import 'booking_history_widget.dart';

class BookingDetailsScreen2 extends StatelessWidget {
  const BookingDetailsScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.black,
        title: Text('Booking Details', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp)),
        centerTitle: true,
      ),
      body: GetX(
          init: TrackOrderController(),
          builder: (controller) {
            return Column(
              children: [
                8.sp.verticalSpace,
                BookingHistoryWidget(
                  historyData: BookingHistoryModel(
                      image: controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.imageUrl,
                      title: controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.name,
                      location: '${controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.addressLine1},${controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.addressLine2},${controller.restaurantBookingDetails.value.restaurantsdDetail?.attributes?.city}',
                      id: controller.restaurantBookingDetails.value.bookNumber,
                      status: controller.restaurantBookingDetails.value.statusString,
                      date: '${DateFormat('MMM dd, yyyy').format(controller.restaurantBookingDetails.value.date ?? DateTime.now())} ${controller.restaurantBookingDetails.value.time}'),
                ),

                // Ticket Details
                Container(
                  padding: EdgeInsets.all(16.sp),
                  margin: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ticket Details',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 8.sp),
                            decoration: BoxDecoration(color: MyColors.googleBorder, borderRadius: BorderRadius.circular(12.sp)),
                            child: CommonWidgets.customTextView(
                              text: "${DateFormat('MMM dd, yyyy').format(controller.restaurantBookingDetails.value.date ?? DateTime.now())} ${controller.restaurantBookingDetails.value.time}",
                              color: MyColors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      22.sp.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(controller.restaurantBookingDetails.value.numberOfPerson ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
                              6.sp.verticalSpace,
                              Text('Total Person', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp)),
                            ],
                          ),
                          Container(height: 40.sp, width: 2.sp, color: Colors.grey.shade300),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(controller.restaurantBookingDetails.value.totalAmount ?? '0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
                              6.sp.verticalSpace,
                              Text('Total Price (AED)', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp)),
                            ],
                          ),
                        ],
                      ),
                      10.sp.verticalSpace,
                    ],
                  ),
                ),
                controller.restaurantBookingDetails.value.pickupAddress != "" || controller.restaurantBookingDetails.value.supplier?.supplierAddress != '' ?
                const PickupDropLocationCard()
                    : const SizedBox.shrink()
              ],
            );
          }),
    );
  }
}

class PickupDropLocationCard extends StatelessWidget {
  const PickupDropLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: TrackOrderController(),
        builder: (controller) {
          return Card(
            elevation: 0,
            color: MyColors.white,
            margin: EdgeInsets.all(8.sp),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets.customTextView(
                    text: "Pickup & Drop Location",
                    color: MyColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 14.sp),
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      children: [
                        controller.restaurantBookingDetails.value.pickupAddress != ""
                            ? _buildRow(
                                iconPath: ImageConstants.iconPickupVisit,
                                title: "Pickup",
                                subtitle: controller.restaurantBookingDetails.value.pickupAddress ?? '',
                                showDivider: true,
                              )
                            : const SizedBox.shrink(),
                        Padding(
                          padding: EdgeInsets.only(left: 6.sp),
                          child: controller.restaurantBookingDetails.value.supplier?.supplierAddress != ''
                              ? _buildRow(
                                  iconPath: ImageConstants.iconServiceProviderNew,
                                  title: controller.restaurantBookingDetails.value.supplier?.serviceName ?? '',
                                  subtitle: controller.restaurantBookingDetails.value.supplier?.supplierAddress ?? '',
                                  showDivider: false,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buildRow({required String iconPath, required String title, required String subtitle, required bool showDivider}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5.sp),
          child: Column(
            children: [
              Image.asset(iconPath, height: 16.sp, fit: BoxFit.cover),
              if (showDivider)
                Expanded(
                  child: Container(
                    width: 1.sp,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(vertical: 3.sp),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(width: 8.sp),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title.isNotEmpty)
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              !showDivider && title.isEmpty ? 5.verticalSpace : 0.verticalSpace,
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
