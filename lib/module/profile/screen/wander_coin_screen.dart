import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/core.dart';

class WanderCoinScreen extends StatelessWidget {
  const WanderCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<WanderCoinScreenController>(
      init: WanderCoinScreenController(),
      initState: (cnt) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          cnt.controller?.myCoinHistoryAPI();
        });
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Wander Coins",
              style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
            ),
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(scale: 3, ImageConstants.iconBack),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Column(
                children: [
                  12.verticalSpace,
                  _buildCoinInfoCard(context, controller),
                  12.verticalSpace,
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Coins History",
                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Source Name",
                                  style: Theme.of(context).grayCliff500.copyWith(
                                        fontSize: MyFonts.fonts15,
                                        color: MyColors.secondaryColor,
                                      ),
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: Text(
                                  "Date",
                                  style: Theme.of(context).grayCliff500.copyWith(
                                        fontSize: MyFonts.fonts15,
                                        color: MyColors.secondaryColor,
                                      ),
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: Text(
                                  "Coins Earned",
                                  style: Theme.of(context).grayCliff500.copyWith(
                                        fontSize: MyFonts.fonts15,
                                        color: MyColors.secondaryColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          SizedBox(
                            height: 700,
                            child: controller.isLoading.value == true
                                ? const SizedBox.shrink()
                                : ListView.builder(
                                    padding: const EdgeInsets.only(bottom: 200),
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: controller.coinHistoryData.value.coinHistory?.data?.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 22.sp),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                controller.coinHistoryData.value.coinHistory?.data?[index].coinName ?? "",
                                                style: Theme.of(context).grayCliff500.copyWith(
                                                      fontSize: MyFonts.fonts15,
                                                      color: MyColors.appTxtColor,
                                                    ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                controller.coinHistoryData.value.coinHistory?.data?[index].createdAt != null
                                                    ? DateFormat('dd MMM yyyy').format(
                                                        DateTime.parse(
                                                          "${controller.coinHistoryData.value.coinHistory?.data?[index].createdAt}",
                                                        ),
                                                      )
                                                    : 'Invalid date',
                                                style: Theme.of(context).grayCliff500.copyWith(
                                                      fontSize: MyFonts.fonts15,
                                                      color: MyColors.appTxtColor,
                                                    ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    ImageConstants.iconCoin,
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                  ),
                                                  4.horizontalSpace,
                                                  Text(
                                                    controller.coinHistoryData.value.coinHistory?.data?[index].earn != null ? (double.tryParse("${controller.coinHistoryData.value.coinHistory?.data?[index].earn}")! * 100).toStringAsFixed(1) : '0',
                                                    style: Theme.of(context).grayCliff500.copyWith(
                                                          fontSize: MyFonts.fonts15,
                                                          color: MyColors.appTxtColor,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCoinInfoCard(BuildContext context, WanderCoinScreenController controller) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.sp),
        color: MyColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCoinHeader(context, controller),
          20.verticalSpace,
          _buildCoinDetails(context, controller),
        ],
      ),
    );
  }

  Widget _buildCoinHeader(BuildContext context, WanderCoinScreenController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My Coins",
          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 8.sp),
          decoration: BoxDecoration(
            color: MyColors.materialScaffoldBackground,
            borderRadius: BorderRadius.circular(4.sp),
          ),
          child: controller.isLoading.value == true
              ? const SizedBox.shrink()
              : Text("${controller.coinHistoryData.value.label}", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts15)),
        ),
      ],
    );
  }

  Widget _buildCoinDetails(BuildContext context, WanderCoinScreenController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCoinColumn(context, "${controller.coinHistoryData.value.accumulatedCoin ?? 0}", "Accumulated Coins", "${controller.coinHistoryData.value.totalAvailableCoin ?? 0}", "Total Available Coins"),
        Image.asset(
          ImageConstants.iconCoin,
          height: 25.sp,
          width: 25.sp,
        ),
        _buildCoinColumn(context, "${controller.coinHistoryData.value.spentCoin ?? 0}", "Spent Coins", "${controller.coinHistoryData.value.aedCoin ?? 0}", "Coins Value in AED"),
      ],
    );
  }

  Widget _buildCoinColumn(BuildContext context, String topValue, String topLabel, String bottomValue, String bottomLabel) {
    return Column(
      children: [
        Text(
          topValue,
          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts15),
        ),
        10.verticalSpace,
        Text(
          topLabel,
          style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts15),
        ),
        25.verticalSpace,
        Text(
          bottomValue,
          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts15),
        ),
        10.verticalSpace,
        Text(
          bottomLabel,
          style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts15),
        ),
      ],
    );
  }
}
