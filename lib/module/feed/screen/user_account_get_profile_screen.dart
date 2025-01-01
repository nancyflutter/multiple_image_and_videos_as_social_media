import 'package:multiple_image_and_videos_as_social_media/module/feed/controller/user_account_get_profile_controller.dart';
import '../../../core/core.dart';

class UserAccountGetProfileScreen extends StatelessWidget {
  const UserAccountGetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: UserAccountGetProfileController(),
      initState: (cnt) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (Get.arguments != null) {
            cnt.controller?.userId.value = Get.arguments["userId"]?.toString() ?? "";
          }
          cnt.controller?.getBadgeAPI();
          cnt.controller?.userAccountGetProfileAPI(userId: cnt.controller?.userId.value ?? "");
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
              // leadingWidth: 110.sp,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.appTxtColor,
                ),
              ),
              title: Text(
                controller.userAccountProfileData.value.fullName ?? "",
                style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
              ),
            ),
            body: NestedScrollView(
              controller: controller.scrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 350.sp,
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
                                    12.verticalSpace,
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
                                              imageUrl: controller.userAccountProfileData.value.image.toString(),
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
                                      controller.userAccountProfileData.value.fullName ?? "",
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14, color: MyColors.black),
                                    ),
                                    Text(
                                      controller.userAccountProfileData.value.email ?? "",
                                      style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14, color: MyColors.appTxtColor),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8.sp, right: 40.sp, left: 40.sp, top: 4.sp),
                                      child: Text(
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        controller.userAccountProfileData.value.bio != 'null' ? controller.userAccountProfileData.value.bio ?? "" : "",
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
                                    height: 120.sp,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("${controller.userAccountProfileData.value.followers ?? 0}", style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16)),
                                                Text("Followers", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                                              ],
                                            ).addGesture(
                                              () {
                                                Get.toNamed('${RoutesStrings.endUserToFollowFollowingScreen}?tab=followers', arguments: {"FollowUserId": controller.userId.value, "user_name": controller.userAccountProfileData.value.fullName});
                                              },
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
                                                Text("${controller.userAccountProfileData.value.follwing ?? 0}", style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16)),
                                                Text("Following", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                                              ],
                                            ).addGesture(
                                              () {
                                                Get.toNamed('${RoutesStrings.endUserToFollowFollowingScreen}?tab=following', arguments: {"FollowUserId": controller.userId.value, "user_name": controller.userAccountProfileData.value.fullName});
                                              },
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
                                                Text("${controller.userAccountProfileData.value.trips ?? 0}", style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16)),
                                                Text("Trips", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (controller.userAccountProfileData.value.follow == 1) {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                      'Are you sure you want to UnFollow?',
                                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          'NO',
                                                          style: TextStyle(color: MyColors.greenBorderColor),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          controller.addFollowUserAPI();
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          'YES',
                                                          style: TextStyle(color: MyColors.greenBorderColor),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            } else {
                                              controller.addFollowUserAPI();
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(12.sp),
                                            child: Container(
                                              height: 45.sp,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 12.sp),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6.sp),
                                                color: controller.userAccountProfileData.value.follow == 0 ? MyColors.greenBorderColor : null,
                                                border: controller.userAccountProfileData.value.follow == 0
                                                    ? null
                                                    : Border.all(
                                                        color: MyColors.greenBorderColor,
                                                        width: 1.sp,
                                                      ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  controller.userAccountProfileData.value.follow == 0 ? "Follow" : "UnFollow",
                                                  style: Theme.of(context).grayCliff600.copyWith(
                                                        color: controller.userAccountProfileData.value.follow == 0 ? MyColors.white : MyColors.greenBorderColor,
                                                        fontSize: MyFonts.fonts15,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
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
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: MyColors.white,
                        ),
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
                  12.horizontalSpace,
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        controller.postData.isNotEmpty
                            ? GridView.builder(
                                padding: EdgeInsets.all(10.sp),
                                shrinkWrap: true,
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
                                        "image": controller.userAccountProfileData.value.image,
                                        "index": index,
                                        "name": controller.userAccountProfileData.value.fullName,
                                      });
                                    },
                                    child: SizedBox(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: ("${controller.userAccountProfileData.value.mediaUrl}${controller.postData[index].media?.first.media}".isNotEmpty)
                                          ? Image.network(
                                              "${controller.userAccountProfileData.value.mediaUrl}${controller.postData[index].media?.first.media}",
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              ImageConstants.carousalImage1,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  );
                                },
                              )
                            : Center(child: Text("No data found", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16))),
                        controller.badgeData!.isNotEmpty
                            ? GridView.builder(
                                padding: EdgeInsets.all(10.sp),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2.sp,
                                  mainAxisSpacing: 2.sp,
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
                                    child: Container(
                                      child: controller.badgeData?[index].isTaken == 1
                                          ? ("${controller.badgeData?[index].beforeImage}".isNotEmpty)
                                              ? Image.network(
                                                  "${controller.badgeData?[index].beforeImage}",
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  ImageConstants.carousalImage1,
                                                  fit: BoxFit.cover,
                                                )
                                          : const SizedBox.shrink(),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  "No data found",
                                  style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16),
                                ),
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
    );
  }
}
