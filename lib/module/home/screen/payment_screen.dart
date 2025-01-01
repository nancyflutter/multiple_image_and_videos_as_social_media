import '../../../core/core.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: PaymentScreenController(),
      builder: (controller) {
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
          body: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.sp),
              ),
              margin: EdgeInsets.all(15.sp),
              child: Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(4.sp),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Payment Method",
                      style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
                    ),
                    10.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        controller.isGPayMethodSelected.value = false;
                        controller.isCODPayMethodSelected.value = !controller.isCODPayMethodSelected.value;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16.sp),
                        decoration: BoxDecoration(
                          color: controller.isCODPayMethodSelected.value ? MyColors.secondaryColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(4.sp),
                          border: Border.all(color: controller.isCODPayMethodSelected.value ? MyColors.secondaryColor : MyColors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageConstants.iconCod,
                              height: 20.sp,
                              width: 20.sp,
                              color: controller.isCODPayMethodSelected.value ? MyColors.white : MyColors.appTxtColor,
                            ),
                            12.horizontalSpace,
                            Text(
                              "COD",
                              style: Theme.of(context).grayCliff600.copyWith(
                                    fontSize: 18.sp,
                                    color: controller.isCODPayMethodSelected.value ? MyColors.white : MyColors.appTxtColor,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    18.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        controller.isCODPayMethodSelected.value = false;
                        controller.isGPayMethodSelected.value = !controller.isGPayMethodSelected.value;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16.sp),
                        decoration: BoxDecoration(
                          color: controller.isGPayMethodSelected.value ? MyColors.secondaryColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(4.sp),
                          border: Border.all(color: controller.isGPayMethodSelected.value ? MyColors.secondaryColor : MyColors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageConstants.iconGooglePay,
                              height: 20.sp,
                              width: 20.sp,
                            ),
                            12.horizontalSpace,
                            Text(
                              "PAY",
                              style: Theme.of(context).grayCliff600.copyWith(
                                    fontSize: 18.sp,
                                    color: controller.isGPayMethodSelected.value ? MyColors.white : MyColors.appTxtColor,
                                  ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              if (controller.isCODPayMethodSelected.value) {
                // print("debug is here");
                controller.createReservationApi();
              }
            },
            child: Container(
              height: 50.sp,
              color: MyColors.secondaryColor,
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Buy",
                style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
