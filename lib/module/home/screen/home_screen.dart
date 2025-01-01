import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/location_helper.dart';
import '../../../core/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: HomeScreenController(),
      initState: (cnt) {},
      builder: (controller) {
        return DefaultTabController(
          length: 2,
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: MyColors.white,
                centerTitle: true,
                toolbarHeight: 65.sp,
                // leadingWidth: 60.sp,
                leading: Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Image.asset(ImageConstants.splashLogo),
                ),
                title: GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesStrings.searchLocationRoute);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: LocationHelper.lat.value != 0.0 && LocationHelper.lng.value != 0.0
                      ? Text(
                          controller.address.value,
                          style: Theme.of(context).grayCliff600.copyWith(
                                fontSize: 16.sp,
                              ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Set Location",
                              style: Theme.of(context).grayCliff600.copyWith(
                                    fontSize: 16.sp,
                                  ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.black,
                            )
                          ],
                        ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesStrings.searchLocationRoute);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Icon(
                      Icons.location_on,
                      color: MyColors.secondaryColor,
                    ),
                  ),
                  // 10.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesStrings.searchLocationRoute);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: EdgeInsets.all(22.sp),
                      child: Image.asset(
                        ImageConstants.icSearch,
                        height: 20.sp,
                        color: MyColors.appTxtColor,
                      ),
                    ),
                  ),
                  // 15.horizontalSpace
                ],
                elevation: 0.5,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.sp, top: 12.sp, right: 12.sp),
                    child: Container(
                      height: 53.sp,
                      decoration: BoxDecoration(
                        color: MyColors.materialScaffoldBackground,
                        border: Border.all(color: MyColors.tabBar),
                        borderRadius: BorderRadius.circular(3.sp),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 3.sp),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(3.sp),
                          ),
                          dividerColor: MyColors.transparent,
                          unselectedLabelColor: MyColors.hintColor,
                          labelColor: MyColors.appTxtColor,
                          labelStyle: const TextStyle(fontFamily: Fonts.grayCliff, fontWeight: FontWeight.w600),
                          labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                          indicatorPadding: EdgeInsets.symmetric(horizontal: 4.sp),
                          onTap: (val) {
                            controller.typeIndex.value = val;
                            // if (controller.typeIndex.value == 1) {
                            //   controller.getCuiSineCategoriesAPI();
                            // }
                          },
                          tabs: const [
                            Tab(text: "Play"),
                            Tab(text: "Eat"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Expanded(
                    child: TabBarView(
                      children: [
                        ///Play TAB
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.sp),
                              child: Text(
                                "Select category",
                                style: Theme.of(context).grayCliff600.copyWith(
                                      fontSize: MyFonts.fonts16,
                                    ),
                              ),
                            ),

                          5.verticalSpace,
                          Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(left: 12.sp, right: 12.sp, bottom: 20.sp),
                              // itemCount: controller.categoriesItems.length,
                              itemCount: controller.categoriesList.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.07.sp,
                                mainAxisSpacing: 12.sp,
                                crossAxisSpacing: 15.sp,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      RoutesStrings.homeSubCategoriesRoute,
                                      arguments: {'title': controller.categoriesList[index].categoryName, 'id': controller.categoriesList[index].categoryId, 'supplier': controller.categoriesList[index].supplier},
                                    );
                                  },
                                  child: Card(
                                    margin: EdgeInsets.zero, color: MyColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    // elevation: 7,
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 150.sp,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage("https://staging.appwander.com${controller.categoriesList[index].image}"),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(5.sp)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.sp),
                                          child: Text(
                                            controller.categoriesList[index].categoryName ?? "",
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // 15.verticalSpace
                        ],
                      ),

                      ///Eat TAB
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.sp),
                            // child: CommonWidgets.customTextView(text: "Select category", color: MyColors.appTxtColor, fontSize: MyFonts.fonts15, fontWeight: FontWeight.bold),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select Your Cuisine",
                                  style: Theme.of(context).grayCliff600.copyWith(
                                        fontSize: MyFonts.fonts16,
                                      ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Powered by: ',
                                    style: Theme.of(context).grayCliff300.copyWith(fontSize: MyFonts.fonts14),
                                    children: <TextSpan>[
                                      TextSpan(text: 'eat', style: Theme.of(context).grayCliffBold.copyWith(fontSize: MyFonts.fonts17, color: Colors.green)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          5.verticalSpace,
                          Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(left: 12.sp, right: 12.sp, bottom: 20.sp),
                              itemCount: controller.cuiSineData.length ?? 0,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.07.sp,
                                mainAxisSpacing: 12.sp,
                                crossAxisSpacing: 15.sp,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.selectedEatIndex.value = index.toString();
                                    Get.toNamed(
                                      RoutesStrings.homeSubEatCategoriesRoute,
                                      arguments: {'cuisineID': controller.cuiSineData[int.parse(controller.selectedEatIndex.value)].cuisineId},
                                    );
                                  },
                                  child: Card(
                                    margin: EdgeInsets.zero, color: MyColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    // elevation: 7,
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Container(
                                          height: 150.sp,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: NetworkImage(controller.cuiSineData[index].cuisineImage ?? ""), fit: BoxFit.cover),
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(5.sp)),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(10.sp),
                                            child: Text(
                                              controller.cuiSineData[index].cuisineName ?? "",
                                              style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts12),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // 15.verticalSpace
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          )
        );
      },
    );
  }
}
