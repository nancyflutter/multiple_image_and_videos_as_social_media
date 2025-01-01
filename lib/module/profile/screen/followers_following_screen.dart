import '../../../core/core.dart';

class FollowersFollowingScreen extends StatelessWidget {
  const FollowersFollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String initialTab = Get.parameters['tab'] ?? 'followers';

    return GetX(
      init: FollowersFollowingScreenController(),
      initState: (cnt) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (Get.arguments != null) {
            cnt.controller?.otherUserId.value = Get.arguments['FollowUserId'];
          }
          if (Get.arguments != null) {
            cnt.controller?.userName.value = Get.arguments['user_name'];
          }
          cnt.controller?.getFollowingListAPI();
          cnt.controller?.getFollowerListAPI();
        });
      },
      builder: (controller) {
        return DefaultTabController(
          length: 2,
          initialIndex: initialTab == 'following' ? 0 : 1,
          child: Scaffold(
            backgroundColor: MyColors.white,
            appBar: AppBar(
              backgroundColor: MyColors.white,
              centerTitle: true,
              title: Text(
                controller.userName.value.isNotEmpty ? controller.userName.value : "${controller.appController.loginResponse.value.fullName}",
                style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
              ),
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.appTxtColor,
                ),
              ),
              elevation: 0.5,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.sp, top: 12.sp, right: 12.sp),
                  child: Container(
                    height: 60.sp,
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
                        labelStyle: TextStyle(fontFamily: Fonts.grayCliff, fontWeight: FontWeight.w600, fontSize: MyFonts.fonts18),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 4.sp),
                        tabs: const [
                          Tab(text: "Following"),
                          Tab(text: "Followers"),
                        ],
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Expanded(
                  child: TabBarView(
                    children: [
                      (controller.followingList.value.responseData != null && controller.followingList.value.responseData!.isNotEmpty)
                          ? controller.isLoadingFollowing.value == true
                              ? const SizedBox.shrink()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.followingList.value.responseData?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                                      child: Column(
                                        children: [
                                          30.verticalSpace,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (controller.followingList.value.responseData?[index].type == "u") {
                                                    if (controller.appController.loginResponse.value.userId.toString() == "${controller.followingList.value.responseData?[index].userId}") {
                                                      Get.put<DashboardScreenController>(DashboardScreenController());
                                                      final bottomNavController = Get.find<DashboardScreenController>();
                                                      bottomNavController.goToProfile();
                                                    } else {
                                                      Get.toNamed(RoutesStrings.userAccountGetProfileRoute, arguments: {"userId": "${controller.followingList.value.responseData?[index].userId}"});
                                                    }
                                                  } else {
                                                    Get.toNamed(RoutesStrings.serviceDetailsRoute, arguments: {"userId": "${controller.followingList.value.responseData?[index].userId}"});
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 50.sp,
                                                      width: 50.sp,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(100.sp)),
                                                        child: CachedNetworkImage(
                                                          imageUrl: "${controller.followingList.value.responseData?[index].image}".isNotEmpty ? "${controller.followingList.value.responseData?[index].image}" : ImageConstants.icUserPlaceholder,
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
                                                    8.horizontalSpace,
                                                    Text(
                                                      "${controller.followingList.value.responseData?[index].name}",
                                                      style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              "${controller.appController.loginResponse.value.userId}" == "${controller.followingList.value.responseData?[index].userId}"
                                                  ? const SizedBox.shrink()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        if ("${controller.followingList.value.responseData?[index].follow}" == "1") {
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
                                                                      if (controller.followingList.value.responseData?[index].type == "u") {
                                                                        controller.addFollowUserAPI(index: index, isFollower: false);
                                                                        controller.followingList.refresh();
                                                                      } else {
                                                                        controller.addFollowSupplierAPI(index);
                                                                        controller.followerList.refresh();
                                                                      }
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
                                                          if (controller.followingList.value.responseData?[index].type == "u") {
                                                            controller.addFollowUserAPI(index: index, isFollower: false);
                                                            controller.followingList.refresh();
                                                          } else {
                                                            controller.addFollowSupplierAPI(index);
                                                            controller.followerList.refresh();
                                                          }
                                                        }
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 12.sp),
                                                        decoration: BoxDecoration(
                                                            color: "${controller.followingList.value.responseData?[index].follow}" == "1" ? MyColors.white : MyColors.greenBorderColor,
                                                            borderRadius: BorderRadius.circular(6.sp),
                                                            border: "${controller.followingList.value.responseData?[index].follow}" == "1" ? Border.all(color: MyColors.greenBorderColor, width: 1.sp) : null),
                                                        child: Text(
                                                          "${controller.followingList.value.responseData?[index].follow}" == "1" ? "UnFollow" : "Follow",
                                                          style: Theme.of(context).grayCliff600.copyWith(color: "${controller.followingList.value.responseData?[index].follow}" == "1" ? MyColors.greenBorderColor : MyColors.white, fontSize: MyFonts.fonts15),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                )
                          : const Text(""),
                      (controller.followerList.value.responseData != null && controller.followerList.value.responseData!.isNotEmpty)
                          ? controller.isLoadingFollower.value == true
                              ? const SizedBox.shrink()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.followerList.value.responseData?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                                      child: Column(
                                        children: [
                                          30.verticalSpace,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (controller.appController.loginResponse.value.userId.toString() == "${controller.followerList.value.responseData?[index].userId}") {
                                                    Get.put<DashboardScreenController>(DashboardScreenController());
                                                    final bottomNavController = Get.find<DashboardScreenController>();
                                                    bottomNavController.goToProfile();
                                                  } else {
                                                    Get.toNamed(RoutesStrings.userAccountGetProfileRoute, arguments: {"userId": "${controller.followerList.value.responseData?[index].userId}"});
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 50.sp,
                                                      width: 50.sp,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(100.sp)),
                                                        child: CachedNetworkImage(
                                                          imageUrl: "${controller.followerList.value.responseData?[index].image}".isNotEmpty ? "${controller.followerList.value.responseData?[index].image}" : ImageConstants.icUserPlaceholder,
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
                                                    8.horizontalSpace,
                                                    Text(
                                                      "${controller.followerList.value.responseData?[index].name}",
                                                      style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              "${controller.appController.loginResponse.value.userId}" == "${controller.followerList.value.responseData?[index].userId}"
                                                  ? const SizedBox.shrink()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        if ("${controller.followerList.value.responseData?[index].follow}" == "1") {
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
                                                                      controller.addFollowUserAPI(index: index);
                                                                      controller.followerList.refresh();
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
                                                          controller.addFollowUserAPI(index: index);
                                                          controller.followerList.refresh();
                                                        }
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 12.sp),
                                                        decoration: BoxDecoration(
                                                            color: "${controller.followerList.value.responseData?[index].follow}" == "1" ? MyColors.white : MyColors.greenBorderColor,
                                                            borderRadius: BorderRadius.circular(6.sp),
                                                            border: "${controller.followerList.value.responseData?[index].follow}" == "1" ? Border.all(color: MyColors.greenBorderColor, width: 1.sp) : null),
                                                        child: Text(
                                                          "${controller.followerList.value.responseData?[index].follow}" == "1" ? "UnFollow" : "Follow",
                                                          style: Theme.of(context).grayCliff600.copyWith(color: "${controller.followerList.value.responseData?[index].follow}" == "1" ? MyColors.greenBorderColor : MyColors.white, fontSize: MyFonts.fonts15),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                )
                          : const Text(""),
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
}
