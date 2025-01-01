import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/socket_helper.dart';
import '../../../core/core.dart';
import '../model/booking_history_response.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text("Booking History", style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp)),
      ),
      body: GetX<BookingHistoryScreenController>(
        init: BookingHistoryScreenController(),
        initState: (cnt) {
          cnt.controller!.scrollController = ScrollController();
          cnt.controller!.scrollController.addListener(cnt.controller!.scrollListener);
        },
        builder: (controller) {
          if (controller.bookingResponse[controller.isInitialize] && controller.bookingResponse[controller.getDataMapVal.value].isEmpty) {
            return Center(
              child: Text(
                "No orders",
                style: Theme.of(context).grayCliff400.copyWith(fontSize: 16.sp, color: MyColors.hintColor),
              ),
            );
          }
          return ListView.builder(
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.nextPage.isNotEmpty ? controller.bookingResponse[controller.getDataMapVal.value].length + 1 : controller.bookingResponse[controller.getDataMapVal.value].length,
            itemBuilder: (context, index) {
              // if (controller.loadMore.value && (index) > controller.bookingResponse[controller.getDataMapVal.value].length - 1) {
              //   return SizedBox(height: 50.sp, child: const Center(child: CircularProgressIndicator()));
              // }
              if (index > (controller.bookingResponse[controller.getDataMapVal.value].length ?? 0) - 1 && (controller.nextPage.isNotEmpty)) {
                return SizedBox(
                  height: 50.sp,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: MyColors.secondaryColor,
                    ),
                  ),
                );
              }
              BookingHistoryData data = controller.bookingResponse[controller.getDataMapVal.value][index];
              //print("$index::::::::${data.toMap()}");
              return GestureDetector(
                onTap: () => Get.toNamed(RoutesStrings.bookingDetailsScreen, arguments: controller.bookingResponse[controller.getDataMapVal.value][index].id)?.then((val) {
                  BookingHistoryData data = controller.bookingResponse[controller.getDataMapVal.value][index];

                  if (val["isChatOpen"]) {
                    final socketHelperController = Get.find<SocketHelper>();
                    RxInt msgCount = RxInt(data.msgCount ?? 0);
                    socketHelperController.allTotalUnReadMsg - (msgCount.value);
                    socketHelperController.allTotalUnReadMsg.refresh();
                    print("chatController.allOrderTotalUnRead ${socketHelperController.allTotalUnReadMsg}   // val ${val["count"]} :: msgCount ${msgCount}");

                    val["isHasChanged"] ?? false ? controller.syncOrderListWithStatus.call() : null;
                    data.msgCount = val["count"] ?? 0;
                    controller.bookingResponse.refresh();
                  }
                }),
                child: Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.sp), color: MyColors.white),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100.sp),
                              child: CachedNetworkImage(
                                imageUrl: data.image ?? "",
                                height: 60.sp,
                                width: 60.sp,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder: (context, url, progress) => Image.asset(ImageConstants.icUserPlaceholder),
                                errorWidget: (context, url, error) => Image.asset(ImageConstants.icUserPlaceholder),
                              )),
                          12.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(data.serviceName ?? "", style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16))),
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
                                          decoration: BoxDecoration(color: MyColors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(20.sp)),
                                          child: Text("ID: ${data.bookNumber ?? ""}", style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14)),
                                        ),
                                        (data.msgCount ?? 0) > 0
                                            ? Container(
                                                height: 20.sp,
                                                margin: EdgeInsets.only(top: 3.sp),
                                                width: 20.sp,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(color: MyColors.red, borderRadius: BorderRadius.circular(100.sp)),
                                                child: Text("${data.msgCount}", style: Theme.of(context).grayCliff700.copyWith(fontSize: 12.sp, color: MyColors.white)),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ],
                                ),
                                2.verticalSpace,
                                Text(data.supplierAddress ?? "", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14))
                              ],
                            ),
                          )
                        ],
                      ),
                      15.verticalSpace,
                      Row(
                        children: [
                          Text(DateFormat('MMM dd, yyyy').format(data.date ?? DateTime.now()), style: Theme.of(context).grayCliff300.copyWith(fontSize: 13.sp)),
                          6.sp.horizontalSpace,
                          Text(data.time ?? "", style: Theme.of(context).grayCliff400.copyWith(fontSize: 13.sp)),
                          data.coin.toString().isNotEmpty && data.coin.toString() != "0"
                              ? Row(
                                  children: [
                                    6.sp.horizontalSpace,
                                    Image.asset(ImageConstants.iconCoin, height: 14.sp),
                                    6.sp.horizontalSpace,
                                    Text(data.coin.toString(), style: Theme.of(context).grayCliff600.copyWith(fontSize: 13.sp)),
                                  ],
                                )
                              : const SizedBox(),
                          const Spacer(),
                          Row(
                            children: [
                              Text(data.statusString ?? "", style: Theme.of(context).grayCliff600.copyWith(fontSize: 13.sp)),
                              6.sp.horizontalSpace,
                              Image.asset(getStatusText(data.status ?? 0)["icon"], height: 12.sp),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ).paddingSymmetric(vertical: 6.sp, horizontal: 10.sp);
              // return BookingRequestWidget(
              //   booking: controller.bookingResponse[controller.getDataMapVal.value][index],
              //   callback: () => Get.toNamed(RoutesStrings.bookingDetailsScreen, arguments: controller.bookingResponse[controller.getDataMapVal.value][index].id)?.then((val) => val ?? false ? controller.syncOrderListWithStatus.call() : null),
              // );
            },
          );
        },
      ),
    );
  }

  Map<String, dynamic> getStatusText(int statusCode) {
    return {
          14: {"status": "Booking Confirmed", "icon": ImageConstants.icStatusConfirm},
          21: {"status": "Cancelled by User", "icon": ImageConstants.icStatusCancell},
          1: {"status": "Pending", "icon": ImageConstants.icStatusPending},
          3: {"status": "Rejected", "icon": ImageConstants.icStatusCancell},
        }[statusCode] ??
        {"status": "Pending", "icon": ImageConstants.icStatusPending};
  }
}
