import 'package:multiple_image_and_videos_as_social_media/core/routes/routes.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/common_rating_bar.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/video_player/common_video_player.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';
import '../../../core/core.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: FavouritesScreenController(),
      builder: (controller) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: MyColors.white,
              centerTitle: true,
              title: Text(
                "Favourites",
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
                        onTap: (val) async {
                          controller.typeIndex.value = val;
                          await controller.getBookMarksList();
                        },
                        dividerColor: MyColors.transparent,
                        unselectedLabelColor: MyColors.hintColor,
                        labelColor: MyColors.appTxtColor,
                        labelStyle: const TextStyle(fontFamily: Fonts.grayCliff, fontWeight: FontWeight.w600),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 4.sp),
                        tabs: const [
                          Tab(text: "Places"),
                          Tab(text: "Post"),
                        ],
                      ),
                    ),
                  ),
                ),
                // 10.verticalSpace,
                Expanded(
                  child: TabBarView(
                    children: [
                      ///1st Tab
                      Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.sp),
                              child: controller.getBookMarkedPlaces.isEmpty
                                  ? const Center(child: Text("No Place Bookmarked"))
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: controller.getBookMarkedPlaces.length,
                                      itemBuilder: (BuildContext context, int index) => Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.sp),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.getBookMarkedPlaces[index].type == "supplier"
                                                ? Get.toNamed(RoutesStrings.serviceDetailsRoute, arguments: {'bookServiceId': controller.getBookMarkedPlaces[index].id})
                                                : Get.toNamed(RoutesStrings.serviceDetailsEatRoute, arguments: {
                                                    'bookRestaurantId': controller.getBookMarkedPlaces[index].id,
                                                  });
                                          },
                                          child: bookMarkPlaceTile(
                                            context: context,
                                            index: index,
                                            controller: controller,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),

                      ///2nd Tab
                      Column(
                        children: [
                          Expanded(
                            child: controller.getBookMarkedPost.isEmpty
                                ? const Center(child: Text("No Post Bookmarked"))
                                : GridView.builder(
                                    padding: EdgeInsets.all(15.sp),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 4.sp,
                                      mainAxisSpacing: 4.sp,
                                      childAspectRatio: 1.0,
                                    ),
                                    itemCount: controller.getBookMarkedPost.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(RoutesStrings.particularUserPostScreen, arguments: {
                                            "post_index": index,
                                          });
                                          print("index------------------$index");
                                        },
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            controller.getBookMarkedPost[index].media?[0].type == 'image'
                                                ? SizedBox(
                                                    height: 131.sp,
                                                    width: 131.sp,
                                                    child: CachedNetworkImage(
                                                      imageUrl: '${controller.getAllBookMarkedData.value.url}${controller.getBookMarkedPost[index].media?[0].media ?? ''}',
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context, url, error) => Image.asset(
                                                        ImageConstants.icNoImage,
                                                        scale: 3,
                                                      ),
                                                    ))
                                                : CommonVideoPlayer(
                                                    url: '${ApiEndPoints.secureImageBaseUrl}${controller.getBookMarkedPost[index].media?[0].media ?? ''}',
                                                    aspectRatio: 5 / 5,
                                                    isShowPlayPause: false,
                                                  ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 3.sp),
                                              child: (controller.getBookMarkedPost[index].media?.length ?? 0) > 1
                                                  ? Image(
                                                      image: AssetImage(ImageConstants.iconMultipleMedia),
                                                      height: 30.sp,
                                                      width: 30.sp,
                                                      color: MyColors.white,
                                                    )
                                                  : (controller.getBookMarkedPost[index].media?[0].type == 'video' || controller.getBookMarkedPost[index].media?[0].type == 'multipart')
                                                      ? Image(
                                                          image: AssetImage(ImageConstants.iconVideo),
                                                          height: 26.sp,
                                                          width: 26.sp,
                                                        )
                                                      : const SizedBox.shrink(),
                                            )
                                          ],
                                        ),
                                      );
                                    },
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
        );
      },
    );
  }

  Widget bookMarkPlaceTile({
    required BuildContext context,
    required int index,
    required FavouritesScreenController controller,
  }) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.sp), color: MyColors.white),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35.sp,
                        backgroundColor: MyColors.scaffoldBackground,
                        child: ClipOval(
                            child: CachedNetworkImage(
                          imageUrl: controller.getBookMarkedPlaces[index].image,
                          height: 70.sp,
                          width: 70.sp,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Image.asset(
                            ImageConstants.placeholderImg,
                            scale: 3,
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            ImageConstants.placeholderImg,
                            scale: 3,
                          ),
                        )),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    controller.getBookMarkedPlaces[index].serviceName,
                                    style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.getBookMarkedPlaces[index].type == "supplier" ? controller.supplierAddBookMarkAPI(id: controller.getBookMarkedPlaces[index].id) : controller.restaurantAddBookMarkAPI(id: controller.getBookMarkedPlaces[index].id);
                                  },
                                  child: Image.asset(
                                    ImageConstants.iconFillBookmark,
                                    height: 20.sp,
                                    width: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                            2.verticalSpace,
                            Text(
                              controller.getBookMarkedPlaces[index].address,
                              style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                            ),
                            // 2.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 3.sp),
                                      decoration: BoxDecoration(
                                        color: MyColors.appTxtColor,
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      child: Text(
                                        controller.getBookMarkedPlaces[index].rating != "" ? controller.getBookMarkedPlaces[index].rating : '0.0',
                                        style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts15, color: MyColors.white),
                                      ),
                                      // child: CommonWidgets.customTextView(text: "4.2", color: MyColors.white, fontSize: MyFonts.fonts14, fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 5.0.sp),
                                    Padding(
                                      padding: EdgeInsets.only(top: 7.sp),
                                      child: CommonRatingBar(
                                        onRatingUpdate: (rating) {},
                                        itemGap: 1.5.sp,
                                        initialRating: controller.getBookMarkedPlaces[index].rating != "" ? double.parse(controller.getBookMarkedPlaces[index].rating) : 0.0,
                                        ignoreGestures: true,
                                        iconSize: 16.sp,
                                      ),
                                    )
                                    // ...List.generate(
                                    //     5,
                                    //     (starIndex) => Padding(
                                    //           padding: EdgeInsets.only(left: starIndex == 0 ? 5.0 : 0.0),
                                    //           child: Icon(
                                    //             Icons.star,
                                    //             size: 18.sp,
                                    //             color: MyColors.appTxtColor,
                                    //           ),
                                    //         )),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 9.sp),
                                  decoration: BoxDecoration(
                                    color: MyColors.secondaryColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    'BOOK',
                                    style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14, color: MyColors.white),
                                  ),
                                  // child: CommonWidgets.customTextView(text: 'BOOK', color: MyColors.white, fontSize: MyFonts.fonts10, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
