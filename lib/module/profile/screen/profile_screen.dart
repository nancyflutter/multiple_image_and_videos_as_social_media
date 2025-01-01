import 'package:multiple_image_and_videos_as_social_media/core/routes/routes.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/video_player/common_video_player.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_endpoints.dart';
import '../../../core/core.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileScreenController>(
      init: ProfileScreenController(),
      initState: (cnt) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          cnt.controller?.userProfileAPI();
          cnt.controller?.getBadgeAPI();
        });
      },
      builder: (controller) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: MyColors.white,
            appBar: AppBar(
              backgroundColor: MyColors.white,
              elevation: 0.5,
              centerTitle: true,
              leadingWidth: 110.sp,
              leading: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                          color: MyColors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImageConstants.iconCoin, height: 12.sp),
                            4.horizontalSpace,
                            Flexible(
                              child: Text(
                                controller.userProfileData.value.totalAvailableCoin ?? "",
                                style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ).addGesture(
                () => Get.toNamed(RoutesStrings.wanderCoinsRoute),
              ),
              title: Image.asset(
                ImageConstants.splashLogo,
                height: 50.sp,
                width: 50.sp,
              ),
              actions: [
                Image.asset(
                  ImageConstants.iconUnBookmark,
                  height: 25.sp,
                  width: 25.sp,
                ).addGesture(
                  () {
                    Get.toNamed(RoutesStrings.favouritesRoute);
                  },
                ),
                15.horizontalSpace,
                Image.asset(
                  ImageConstants.iconEditProfile,
                  height: 25.sp,
                  width: 25.sp,
                  color: MyColors.appTxtColor,
                ).addGesture(
                  () {
                    Get.toNamed(RoutesStrings.editProfileRoute, arguments: {
                      'image': controller.userProfileData.value.image,
                      'full_name': controller.userProfileData.value.fullName,
                      'bio': controller.userProfileData.value.bio,
                    });
                  },
                ),
                15.horizontalSpace,
                Image.asset(
                  ImageConstants.iconSettings,
                  height: 25.sp,
                  width: 25.sp,
                  color: MyColors.appTxtColor,
                ).addGesture(
                  () {
                    Get.toNamed(RoutesStrings.settingRoute, arguments: {
                      'image': controller.userProfileData.value.image,
                      'full_name': controller.userProfileData.value.fullName,
                      'bio': controller.userProfileData.value.bio,
                    });
                  },
                ),
                15.horizontalSpace,
              ],
            ),
            body: NestedScrollView(
              controller: controller.scrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 300.sp,
                    pinned: false,
                    backgroundColor: MyColors.white,
                    elevation: 0.5,
                    flexibleSpace: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        var top = constraints.biggest.height;
                        double opacity = (top - kToolbarHeight) / (250.0 - kToolbarHeight);
                        opacity = opacity.clamp(0.0, 1.0);
                        return FlexibleSpaceBar(
                          centerTitle: true,
                          background: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topCenter,
                                child: Column(
                                  children: [
                                    25.verticalSpace,
                                    Container(
                                      height: 120.sp,
                                      width: 120.sp,
                                      decoration: BoxDecoration(color: MyColors.white, shape: BoxShape.circle, border: Border.all(color: MyColors.black)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100.sp),
                                        child: Padding(
                                          padding: EdgeInsets.all(3.sp),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(100.sp),
                                            child: CachedNetworkImage(
                                              imageUrl: controller.userProfileData.value.image.toString(),
                                              placeholder: (context, url) => Center(
                                                child: Image.asset(
                                                  ImageConstants.icUserPlaceholder,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              errorWidget: (context, url, error) => Image.asset(
                                                ImageConstants.icUserPlaceholder,
                                                fit: BoxFit.cover,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    8.verticalSpace,
                                    Text(
                                      controller.userProfileData.value.fullName ?? "",
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14, color: MyColors.black),
                                    ),
                                    Text(
                                      controller.userProfileData.value.email ?? "",
                                      style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14, color: MyColors.appTxtColor),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8.sp, right: 40.sp, left: 40.sp, top: 4.sp),
                                      child: Text(
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        controller.userProfileData.value.bio != 'null' ? controller.userProfileData.value.bio ?? '' : "",
                                        style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts12, color: MyColors.appTxtColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Opacity(
                                  opacity: opacity,
                                  child: SizedBox(
                                    height: 65.sp,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed('${RoutesStrings.followersFollowingRoute}?tab=followers');
                                          },
                                          behavior: HitTestBehavior.opaque,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("${controller.userProfileData.value.followers ?? 0}", style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16)),
                                              Text("Followers", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 23.sp,
                                          color: MyColors.appTxtColor,
                                          width: 1,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed('${RoutesStrings.followersFollowingRoute}?tab=following');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("${controller.userProfileData.value.follwing ?? 0}", style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16)),
                                              Text("Following", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 23.sp,
                                          color: MyColors.appTxtColor,
                                          width: 1,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("${controller.userProfileData.value.trips ?? 0}", style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16)),
                                            Text("Trips", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  Material(
                    elevation: controller.showElevation.value ? 5.sp : 0.sp,
                    color: Colors.white,
                    child: SizedBox(
                      height: 55.sp,
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: MyColors.greenBorderColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: MyColors.white,
                        ),
                        indicatorColor: Colors.white,
                        automaticIndicatorColorAdjustment: false,
                        onTap: (value) {
                          controller.selectedIndex.value = value;
                        },
                        tabs: [
                          Tab(
                            icon: Image.asset(
                              ImageConstants.iconGridView,
                              height: 22.sp,
                              color: controller.selectedIndex.value == 0 ? MyColors.greenBorderColor : MyColors.black,
                            ),
                          ),
                          Tab(
                            icon: Image.asset(
                              ImageConstants.icBadges,
                              height: 25.sp,
                              color: controller.selectedIndex.value == 1 ? MyColors.greenBorderColor : MyColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        controller.isPostDataLoading.value == true
                            ? const SizedBox.shrink()
                            : GridView.builder(
                                padding: EdgeInsets.all(8.sp),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2.sp,
                                  mainAxisSpacing: 2.sp,
                                  // childAspectRatio: 1.sp,
                                ),
                                itemCount: controller.postData.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RoutesStrings.profilePostDetailPageRoute, arguments: {
                                        "postData": controller.postData,
                                        "image": controller.userProfileData.value.image,
                                        "index": index,
                                        "name": controller.userProfileData.value.fullName,
                                      });
                                    },
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        controller.postData[index].media?.first.type == 'image'
                                            ? SizedBox(
                                                height: double.infinity,
                                                width: double.infinity,
                                                child: CachedNetworkImage(
                                                  imageUrl: '${controller.userProfileData.value.mediaUrl}${controller.postData[index].media?[0].media ?? ''}',
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, url, error) => Image.asset(
                                                    ImageConstants.icNoImage,
                                                    scale: 3,
                                                  ),
                                                ))
                                            : SizedBox(
                                                height: double.infinity,
                                                width: double.infinity,
                                                child: CommonVideoPlayer(
                                                  url: '${ApiEndPoints.secureImageBaseUrl}${controller.postData[index].media?[0].media ?? ''}',
                                                  aspectRatio: 5 / 5,
                                                  isShowPlayPause: false,
                                                ),
                                              ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 3.sp),
                                          child: (controller.postData[index].media?.length ?? 0) > 1
                                              ? Image(
                                                  image: AssetImage(ImageConstants.iconMultipleMedia),
                                                  height: 30.sp,
                                                  width: 30.sp,
                                                  color: MyColors.white,
                                                )
                                              : (controller.postData[index].media?.first.type == 'video' || controller.postData[index].media?.first.type == 'multipart')
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
                        if (controller.badgeData!.isNotEmpty)
                          GridView.builder(
                            padding: EdgeInsets.only(bottom: 100.sp, left: 8.sp, right: 8.sp, top: 8.sp),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.sp,
                              mainAxisSpacing: 75.sp,
                              // childAspectRatio: 1.0,
                            ),
                            itemCount: controller.badgeData?.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        backgroundColor: Colors.transparent,
                                        insetPadding: EdgeInsets.zero,
                                        child: Container(
                                          color: Colors.white,
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Padding(
                                            padding: EdgeInsets.all(12.sp),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(top: 40.sp),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const SizedBox(),
                                                      IconButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        icon: Image.asset(ImageConstants.icClosePopUp),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SizedBox(
                                                          height: 156.sp,
                                                          width: 156.sp,
                                                          child: CachedNetworkImage(
                                                            imageUrl: "${controller.badgeData?[index].beforeImage}".isNotEmpty
                                                                ? "${controller.badgeData?[index].isTaken}" == "1"
                                                                    ? "${controller.badgeData?[index].afterImage}"
                                                                    : "${controller.badgeData?[index].beforeImage}"
                                                                : ImageConstants.carousalImage1,
                                                            placeholder: (context, url) => Center(
                                                              child: Image.asset(
                                                                ImageConstants.icNoImage,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            errorWidget: (context, url, error) => Image.asset(
                                                              ImageConstants.icNoImage,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 20.sp),
                                                          child: Text("${controller.badgeData?[index].name}", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts18, fontWeight: FontWeight.w700)),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 20.sp, right: 20.sp, left: 20.sp),
                                                          child: Text(
                                                            textAlign: TextAlign.center,
                                                            "${controller.badgeData?[index].isTaken}" == "1" ? "${controller.badgeData?[index].afterDescription}" : "${controller.badgeData?[index].beforeDescription}",
                                                            style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16),
                                                          ),
                                                        ),
                                                        20.verticalSpace,
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                20.verticalSpace,
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.symmetric(vertical: 15.sp),
                                                    width: double.infinity,
                                                    height: 50.sp,
                                                    decoration: BoxDecoration(
                                                      color: MyColors.white,
                                                      border: Border.all(color: MyColors.secondaryColor),
                                                    ),
                                                    child: Text(
                                                      'Share',
                                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16, color: MyColors.secondaryColor),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: "${controller.badgeData?[index].beforeImage}".isNotEmpty
                                          ? "${controller.badgeData?[index].isTaken}" == "1"
                                              ? "${controller.badgeData?[index].afterImage}"
                                              : "${controller.badgeData?[index].beforeImage}"
                                          : ImageConstants.carousalImage1,
                                      placeholder: (context, url) => Center(
                                        child: Image.asset(
                                          ImageConstants.icNoImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Image.asset(
                                        ImageConstants.icNoImage,
                                        fit: BoxFit.cover,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8.sp),
                                      child: Column(
                                        children: [
                                          Text("${controller.badgeData?[index].name}", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14, fontWeight: FontWeight.w700)),
                                          Padding(
                                            padding: EdgeInsets.only(top: 4.sp),
                                            child: Text(
                                              "${controller.badgeData?[index].name}",
                                              style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        else
                          Center(child: Text("No data found", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: AnimatedSlide(
              offset: controller.showFab.value ? const Offset(0, 0) : const Offset(0, 5),
              duration: const Duration(milliseconds: 700),
              child: GestureDetector(
                onTap: () {
                  controller.pickMedia(NewPostScreenController());
                },
                child: CircleAvatar(
                  radius: 28.sp,
                  backgroundColor: MyColors.secondaryColor,
                  child: Icon(
                    Icons.add,
                    color: MyColors.white,
                    size: 35.sp,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
