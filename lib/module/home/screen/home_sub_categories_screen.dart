import 'package:get/get.dart';
import '../../../core/core.dart';

class HomeSubCategoriesScreen extends StatelessWidget {
  const HomeSubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: HomeSubCategoriesScreenController(),
      // initState: (cnt) {
      //   WidgetsBinding.instance.addPostFrameCallback((_) {
      //     cnt.controller?.userServiceAPI(supplier: cnt.controller?.supplier.value, id: cnt.controller?.id.value);
      //   });
      // },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            centerTitle: true,
            title: Text(
              controller.title.value,
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
            actions: [
              Image.asset(
                ImageConstants.icSearch,
                height: 20.sp,
                width: 20.sp,
                color: MyColors.appTxtColor,
              ),
              20.horizontalSpace,
              GestureDetector(
                onTap: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      return const Text("Show Bottom Sheet");
                    },
                  );
                },
                child: Image.asset(
                  ImageConstants.iconFilter,
                  height: 25.sp,
                  width: 25.sp,
                  color: MyColors.appTxtColor,
                ),
              ),
              15.horizontalSpace
            ],
            elevation: 0.5,
          ),
          body: ListView.builder(
            itemCount: controller.userServiceData.length,
            itemBuilder: (context, index) {
              // final item = controller.serviceList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.sp),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesStrings.serviceDetailsRoute);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.sp),
                    ),
                    elevation: 2.0,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(6.sp), topRight: Radius.circular(6.sp)),
                              child: Image.network(
                                "${controller.userServiceData[index].image}",
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 190.sp,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Rating
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.userServiceData[index].serviceName}",
                                          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14),
                                        ),
                                        const SizedBox(height: 5.0),
                                        Text(
                                          "${controller.userServiceData[index].supplierAddress}",
                                          style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts12),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 9.sp),
                                    decoration: BoxDecoration(
                                      color: MyColors.secondaryColor,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      "BOOK",
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts10, color: MyColors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.sp),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 3.sp),
                                    decoration: BoxDecoration(
                                      color: MyColors.black,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text("${controller.userServiceData[index].rating}", style: Theme.of(context).grayCliff300.copyWith(color: MyColors.white, fontSize: MyFonts.fonts14)),
                                  ),
                                  const SizedBox(width: 5.0),
                                  ...List.generate(
                                      5,
                                      (starIndex) => Padding(
                                            padding: EdgeInsets.only(left: starIndex == 0 ? 5.0 : 0.0),
                                            child: Icon(
                                              Icons.star,
                                              size: 18.sp,
                                              color: starIndex < controller.userServiceData[index].rating ? MyColors.appTxtColor : MyColors.grey,
                                            ),
                                          )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
