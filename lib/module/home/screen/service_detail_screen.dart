import 'package:carousel_slider/carousel_slider.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/common_rating_bar.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/expanded_html_to_text_widget.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/video_player/common_video_player.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/screen/view_all_review_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';
import '../../../core/core.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ServiceDetailScreenController(),
      builder: (controller) {
        return DefaultTabController(
            length: 3,
            child: Scaffold(
              body: controller.userDetailServiceData.value.detail?.id != null
                  ? NestedScrollView(
                      controller: controller.scrollController,
                      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            expandedHeight: 270.sp,
                            pinned: true,
                            backgroundColor: MyColors.white,
                            elevation: 0.5,
                            leading: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: SizedBox(
                                height: 40.sp,
                                width: 40.sp,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius: BorderRadius.circular(4.sp),
                                  ),
                                  child: Image.asset(
                                    ImageConstants.iconBack,
                                    scale: 3,
                                  ).addGesture(
                                    () {
                                      Get.back();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            flexibleSpace: LayoutBuilder(
                              builder: (BuildContext context, BoxConstraints constraints) {
                                var top = constraints.biggest.height;
                                double opacity = (top - kToolbarHeight) / (250.0 - kToolbarHeight);
                                opacity = opacity.clamp(0.0, 1.0);
                                return FlexibleSpaceBar(
                                  centerTitle: true,
                                  title: Opacity(
                                    opacity: 1 - opacity,
                                    child: Text(
                                      controller.userDetailServiceData.value.detail?.serviceName ?? '',
                                      style: Theme.of(context).grayCliff600.copyWith(
                                            fontSize: 16.sp,
                                          ),
                                    ),
                                  ),
                                  background: controller.serviceImage.isNotEmpty
                                      ? Stack(
                                          fit: StackFit.expand,
                                          children: <Widget>[
                                            CarouselSlider(
                                              items: controller.serviceImage
                                                  .map((item) => CachedNetworkImage(
                                                        imageUrl: item,
                                                        fit: BoxFit.cover,
                                                      ))
                                                  .toList(),
                                              options: CarouselOptions(
                                                viewportFraction: 1,
                                                autoPlay: true,
                                                aspectRatio: 1.0,
                                                onPageChanged: (index, reason) {
                                                  controller.currentIndex.value = index;
                                                  controller.update();
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: List.generate(
                                                    controller.serviceImage.length,
                                                    (index) => Container(
                                                      width: 9.sp,
                                                      height: 9.sp,
                                                      margin: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 7.sp),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: controller.currentIndex.value == index ? MyColors.secondaryColor : MyColors.secondaryColor.withOpacity(0.4),
                                                      ),
                                                    ),
                                                  ).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Image.asset(
                                          ImageConstants.placeholderImg,
                                          fit: BoxFit.cover,
                                        ),
                                );
                              },
                            ),
                          ),
                          SliverPersistentHeader(
                            delegate: _SliverAppBarDelegate(
                              TabBar(
                                labelColor: MyColors.appTxtColor,
                                unselectedLabelColor: MyColors.appTxtColor.withOpacity(0.6),
                                tabs: const [
                                  Tab(text: "Info"),
                                  Tab(text: "Reviews"),
                                  Tab(text: "Social"),
                                ],
                                indicatorColor: MyColors.secondaryColor,
                              ),
                            ),
                            pinned: true,
                          ),
                        ];
                      },
                      body: TabBarView(
                        children: [
                          /// Info
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 8.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  /// Distance and reivews
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    // margin: EdgeInsets.all(8.0),
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    controller.userDetailServiceData.value.detail?.serviceName ?? '',
                                                    style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller.addBookMarkAPI(id: controller.id.toString());
                                                    },
                                                    child: Image.asset(
                                                      controller.userDetailServiceData.value.isBookmark == 1 ? ImageConstants.iconFillBookmark : ImageConstants.iconBookmark,
                                                      height: 25.sp,
                                                      width: 25.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                controller.userDetailServiceData.value.detail?.supplierAddress ?? '',
                                                style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts14),
                                              ),
                                            ],
                                          ),
                                          20.verticalSpace,
                                          Row(
                                            children: [
                                              Text(
                                                controller.userDetailServiceData.value.detail?.rating != null ? controller.userDetailServiceData.value.detail?.rating.toString() ?? '0.0' : '0.0',
                                                style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts30, color: MyColors.secondaryColor),
                                              ),
                                              10.horizontalSpace,
                                              Container(
                                                height: 30.sp,
                                                width: 1,
                                                color: Colors.grey,
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CommonRatingBar(
                                                        onRatingUpdate: (rating) {},
                                                        itemGap: 1.0.sp,
                                                        initialRating: controller.userDetailServiceData.value.detail?.rating != null ? double.parse(controller.userDetailServiceData.value.detail?.rating.toString() ?? '') : 0.0,
                                                        ignoreGestures: true,
                                                        iconSize: 16.sp,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 3.sp,
                                                  ),
                                                  Text(
                                                    "${controller.userDetailServiceData.value.review?.length} REVIEWS",
                                                    style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts14),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// About Us
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "About Us",
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                          ),
                                          10.verticalSpace,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ExpandableHtmlWidget(
                                                htmlContent: controller.userDetailServiceData.value.detail?.description ?? "",
                                                // collapsedHeight: 100.0,
                                                textStyle: const TextStyle(color: Colors.black),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// Opening Hours section
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    // margin: EdgeInsets.symmetric(horizontal: 8.0),
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Opening Hours",
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                          ),
                                          8.verticalSpace,
                                          ListView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemCount: 7,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(bottom: 12.sp),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      controller.userDetailServiceData.value.time?[index].day ?? '',
                                                      style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                                                    ),
                                                    Text(
                                                      '${controller.userDetailServiceData.value.time?[index].startTime ?? ''} - ${controller.userDetailServiceData.value.time?[index].startTime ?? ''}',
                                                      style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// Location section
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Location',
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                          ),
                                          const SizedBox(height: 10.0),
                                          SizedBox(
                                            height: 200.0,
                                            child: GoogleMap(
                                              onMapCreated: controller.onMapCreated,
                                              initialCameraPosition: CameraPosition(
                                                target: controller.serviceLocationLatLng.value,
                                                zoom: 11.0,
                                              ),
                                              markers: Set<Marker>.of(controller.markers),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  55.verticalSpace
                                ],
                              ),
                            ),
                          ),

                          /// Reviews
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 8.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  /// Reviews section
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: (controller.userDetailServiceData.value.review?.isNotEmpty ?? false)
                                            ? Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    'Reviews',
                                                    style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(const ViewAllReviewScreen());
                                                    },
                                                    child: Text(
                                                      'View All',
                                                      style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts16, color: MyColors.secondaryColor),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                      (controller.userDetailServiceData.value.review?.isNotEmpty ?? false)
                                          ? ListView.separated(
                                              shrinkWrap: true,
                                              itemCount: controller.userDetailServiceData.value.review?.length ?? 0,
                                              itemBuilder: (BuildContext context, int index) {
                                                return reviewTile(
                                                    context: context,
                                                    userName: controller.userDetailServiceData.value.review?[index].userName ?? '',
                                                    dateTime: DateFormat.yMMMd().format(
                                                      DateFormat("dd-MM-yyyy").parse(controller.userDetailServiceData.value.review?[index].reviewDate.toString() ?? ''),
                                                    ),
                                                    reviewText: controller.userDetailServiceData.value.review?[index].reviewText ?? '',
                                                    rating: controller.userDetailServiceData.value.review?[index].rate ?? '',
                                                    image: controller.userDetailServiceData.value.review?[index].image ?? '');
                                              },
                                              separatorBuilder: (BuildContext context, int index) {
                                                return const Divider();
                                              })
                                          : Center(
                                              child: Text(
                                                'No review',
                                                style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts18, color: MyColors.appTxtColor),
                                              ),
                                            )
                                    ],
                                  ),
                                  55.verticalSpace
                                ],
                              ),
                            ),
                          ),

                          /// Social
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 8.sp),
                              child: Column(
                                children: [
                                  10.verticalSpace,
                                  Container(
                                    height: 100.sp,
                                    width: 100.sp,
                                    decoration: BoxDecoration(color: MyColors.white, shape: BoxShape.circle, border: Border.all(color: MyColors.black)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100.sp),
                                      child: Padding(
                                        padding: EdgeInsets.all(3.sp),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100.sp),
                                          child: controller.userDetailServiceData.value.detail?.image != null
                                              ? CachedNetworkImage(
                                                  imageUrl: '${ApiEndPoints.imageBaseUrl}/${controller.userDetailServiceData.value.detail?.image}',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  ImageConstants.placeholderImg,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    controller.userDetailServiceData.value.detail?.supplierName ?? "",
                                    style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts18),
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    controller.userDetailServiceData.value.detail?.bio ?? "",
                                    style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16),
                                  ),
                                  20.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(controller.userDetailServiceData.value.followers.toString(), style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16)),
                                          Text("Followers", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                                        ],
                                      ).addGesture(
                                        () {
                                          Get.toNamed(RoutesStrings.feedSupplierProfileFollowerScreenRoute, arguments: {"FollowUserId": controller.id.value, "user_name": controller.userDetailServiceData.value.detail?.serviceName});
                                        },
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(controller.userDetailServiceData.value.follwing.toString(), style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16)),
                                          Text("Following", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                                        ],
                                      ).addGesture(
                                        () {
                                          // Get.toNamed(RoutesStrings.followersFollowingRoute);
                                        },
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(controller.userDetailServiceData.value.noOfPosts.toString(), style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16)),
                                          Text("Trips", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  20.verticalSpace,
                                  GestureDetector(
                                    onTap: () {
                                      // if (controller.userDetailServiceData.value.follwing == 1) {
                                      //   showDialog(
                                      //     context: context,
                                      //     builder: (BuildContext context) {
                                      //       return AlertDialog(
                                      //         title: const Text(
                                      //           'Are you sure you want to UnFollow?',
                                      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                      //         ),
                                      //         actions: [
                                      //           TextButton(
                                      //             onPressed: () {
                                      //               Get.back();
                                      //             },
                                      //             child: Text(
                                      //               'NO',
                                      //               style: TextStyle(color: MyColors.greenBorderColor),
                                      //             ),
                                      //           ),
                                      //           TextButton(
                                      //             onPressed: () {
                                      //               controller.addFollowSupplierAPI();
                                      //               Get.back();
                                      //             },
                                      //             child: Text(
                                      //               'YES',
                                      //               style: TextStyle(color: MyColors.greenBorderColor),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       );
                                      //     },
                                      //   );
                                      // } else {
                                      //   controller.addFollowSupplierAPI();
                                      // }
                                      controller.addFollowSupplierAPI();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 0.sp),
                                      child: Container(
                                        height: 45.sp,
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 12.sp),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6.sp),
                                          color: controller.userDetailServiceData.value.follwing == 0 ? MyColors.greenBorderColor : null,
                                          border: controller.userDetailServiceData.value.follwing == 0
                                              ? null
                                              : Border.all(
                                                  color: MyColors.greenBorderColor,
                                                  width: 1.sp,
                                                ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            controller.userDetailServiceData.value.follwing == 0 ? "Follow" : "UnFollow",
                                            style: Theme.of(context).grayCliff600.copyWith(
                                                  color: controller.userDetailServiceData.value.follwing == 0 ? MyColors.white : MyColors.greenBorderColor,
                                                  fontSize: MyFonts.fonts15,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  10.verticalSpace,
                                  GridView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(0.sp),
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 2.sp,
                                      mainAxisSpacing: 2.sp,
                                      // childAspectRatio: 1.0,
                                    ),
                                    itemCount: controller.postData.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(RoutesStrings.profilePostDetailPageRoute, arguments: {
                                            "postData": controller.postData,
                                            "image": "http://www.staging.appwander.com/${controller.userDetailServiceData.value.detail?.image}",
                                            "index": index,
                                            "name": controller.userDetailServiceData.value.detail?.serviceName,
                                          });
                                        },
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            controller.userDetailServiceData.value.posts?[index].media?[0].type == 'image'
                                                ? SizedBox(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    child: CachedNetworkImage(
                                                      imageUrl: '${controller.userDetailServiceData.value.url}${controller.userDetailServiceData.value.posts?[index].media?[0].media ?? ''}',
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context, url, error) => Image.asset(
                                                        ImageConstants.icNoImage,
                                                        scale: 3,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  )
                                                : CommonVideoPlayer(
                                                    url: '${ApiEndPoints.secureImageBaseUrl}${controller.userDetailServiceData.value.posts?[index].media?[0].media ?? ''}',
                                                    aspectRatio: 5 / 5,
                                                    isShowPlayPause: false,
                                                  ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 3.sp),
                                              child: (controller.userDetailServiceData.value.posts?[index].media?.length ?? 0) > 1
                                                  ? Image(
                                                      image: AssetImage(ImageConstants.iconMultipleMedia),
                                                      height: 30.sp,
                                                      width: 30.sp,
                                                      color: MyColors.white,
                                                    )
                                                  : (controller.userDetailServiceData.value.posts?[index].media?[0].type == 'video' || controller.userDetailServiceData.value.posts?[index].media?[0].type == 'multipart')
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              bottomSheet: controller.userDetailServiceData.value.detail?.id != null
                  ? GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesStrings.bookingServiceListRoute, arguments: {'supplierId': controller.userDetailServiceData.value.detail?.id});
                      },
                      child: Container(
                        height: 50.sp,
                        color: MyColors.secondaryColor,
                        padding: EdgeInsets.symmetric(vertical: 15.sp),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Search listings',
                          style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16, color: MyColors.white),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ));
      },
    );
  }

  Widget reviewTile({
    required BuildContext context,
    required String userName,
    required String dateTime,
    required String reviewText,
    required String rating,
    required String image,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.sp),
      ),
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Wrap(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                // height: 60.sp,
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(shape: BoxShape.circle, color: MyColors.black),
                child: image != ''
                    ? CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        ImageConstants.placeholderImg,
                        fit: BoxFit.cover,
                      )),
            4.horizontalSpace,
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts16),
                          ),
                          CommonRatingBar(
                            onRatingUpdate: (rating) {},
                            itemGap: 1.5.sp,
                            initialRating: rating != "" ? double.parse(rating) : 0.0,
                            ignoreGestures: true,
                            iconSize: 16.sp,
                          )
                        ],
                      ),
                      Text(
                        dateTime,
                        style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts16),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Text(
                    reviewText,
                    style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: MyColors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
