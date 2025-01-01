import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../model/booking_history_model.dart';

class BookingHistoryWidget extends StatelessWidget {
  final BookingHistoryModel historyData;
  const BookingHistoryWidget({super.key, required this.historyData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.to(BookingDetailsPage(historyData: historyData)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 6.sp),
        decoration: BoxDecoration(color: MyColors.white, borderRadius: BorderRadius.circular(6.sp)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 54.sp,
                  width: 54.sp,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: historyData.image ?? '',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      ImageConstants.placeholderImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.sp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidgets.customTextView(
                        text: historyData.title ?? '',
                        color: MyColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      4.verticalSpace,
                      CommonWidgets.customTextView(
                        text: historyData.location ?? '',
                        color: MyColors.appTxtColor,
                        fontSize: 13.sp,
                        maxLine: 3,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.sp),
                  padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 8.sp),
                  decoration: BoxDecoration(color: MyColors.googleBorder, borderRadius: BorderRadius.circular(12.sp)),
                  child: CommonWidgets.customTextView(
                    text: "ID : ${historyData.id}",
                    color: MyColors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ).paddingAll(12.sp),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 12.sp),
              decoration: BoxDecoration(
                color: historyData.status == 'Pending' ? Colors.orange : MyColors.redBorderColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(6.sp), bottomLeft: Radius.circular(6.sp)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidgets.customTextView(
                    text: "Status",
                    color: MyColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CommonWidgets.customTextView(
                    text: historyData.status ?? '',
                    color: MyColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
