import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/common_rating_bar.dart';
import '../../../core/core.dart';

class HomeSubEatCategoriesScreen extends StatelessWidget {
  const HomeSubEatCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: HomeSubCategoriesScreenController(),
      initState: (cnt) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            centerTitle: true,
            title: controller.isSearching.value
                ? TextField(
                    controller: controller.searchController.value,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.appTxtLightColor),
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).grayCliff600.copyWith(
                          fontSize: 16.sp,
                        ),
                    onChanged: (value) {
                      controller.onSearchUser(value.trim());
                    },
                  )
                : Text(
                    controller.appBarTitle.value,
                    style: Theme.of(context).grayCliff600.copyWith(
                          fontSize: 16.sp,
                        ),
                  ),
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                scale: 3,
                ImageConstants.iconBack,
              ),
            ),
            actions: [
              Image.asset(
                ImageConstants.icSearch,
                height: 20.sp,
                width: 20.sp,
                color: MyColors.appTxtColor,
              ).addGesture(
                () {
                  controller.isSearching.value = true;
                },
              ),
              20.horizontalSpace,
              Image.asset(
                ImageConstants.iconFilter,
                height: 25.sp,
                width: 25.sp,
                color: MyColors.appTxtColor,
              ).addGesture(
                () {
                  controller.isSearching.value = false;
                  Get.toNamed(RoutesStrings.eatTabFilterRoute);
                },
              ),
              15.horizontalSpace
            ],
            elevation: 0.5,
          ),
          body: !controller.isLoading.value
              ? controller.getRestaurantList.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.getRestaurantList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.sp),
                          child: GestureDetector(
                            onTap: () {
                              controller.isSearching.value = false;
                              Get.toNamed(RoutesStrings.serviceDetailsEatRoute, arguments: {
                                'bookRestaurantId': controller.getRestaurantList[index].id,
                              });
                            },
                            child: Card(
                              color: MyColors.white,
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
                                          child: CachedNetworkImage(
                                            imageUrl: controller.getRestaurantList[index].attributes?.imageUrl ?? '',
                                            fit: BoxFit.cover,
                                            height: 200.sp,
                                            errorWidget: (context, url, error) => Image.asset(
                                              ImageConstants.placeholderImg,
                                              scale: 3,
                                            ),
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.sp),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ///Rating
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.getRestaurantList[index].attributes?.name ?? '',
                                              style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14),
                                            ),
                                            const SizedBox(height: 5.0),
                                            Text(
                                              controller.getRestaurantList[index].attributes?.addressLine1 ?? '',
                                              style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts12),
                                            )
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
                                              child: Text(
                                                controller.getRestaurantList[index].attributes?.ratingsAverage ?? '0.0',
                                                style: Theme.of(context).grayCliff300.copyWith(color: MyColors.white, fontSize: MyFonts.fonts14),
                                              ),
                                            ),
                                            const SizedBox(width: 5.0),
                                            Padding(
                                              padding: EdgeInsets.only(top: 7.sp),
                                              child: CommonRatingBar(
                                                onRatingUpdate: (rating) {},
                                                itemGap: 1.5.sp,
                                                initialRating: controller.getRestaurantList[index].attributes?.ratingsAverage != "" ? double.parse(controller.getRestaurantList[index].attributes?.ratingsAverage ?? '0') : 0.0,
                                                ignoreGestures: true,
                                                iconSize: 16.sp,
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 9.sp),
                                              decoration: BoxDecoration(
                                                color: MyColors.secondaryColor,
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                "BOOK",
                                                style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14, color: MyColors.white),
                                              ),
                                            ),
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
                    )
                  : Center(
                      child: Text(
                        "No restaurant found",
                        style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16, color: MyColors.black.withOpacity(0.4)),
                      ),
                    )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
