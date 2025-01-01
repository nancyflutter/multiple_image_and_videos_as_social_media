import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/video_player/common_video_player.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_endpoints.dart';
import '../../../core/core.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: FeedScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Image.asset(
              width: 60.sp,
              fit: BoxFit.cover,
              ImageConstants.splashLogo,
            ),
            leading: Stack(
              alignment: Alignment.topRight,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesStrings.userActivityFeedNotificationRoute);
                  },
                  child: Center(
                    child: Image.asset(
                      scale: 5,
                      ImageConstants.icNotificationBell,
                      color: Colors.black,
                    ),
                  ),
                ),

                /// NOTIFICATION COUNT
                // Obx(
                //   () => Container(
                //     decoration: const BoxDecoration(
                //       color: Colors.red,
                //       shape: BoxShape.circle,
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(6.0),
                //       child: Text(controller.unreadCount.value),
                //     ),
                //   ),
                // ),
              ],
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesStrings.searchRoute);
                  },
                  child: Image.asset(scale: 3.2, ImageConstants.icSearch, color: MyColors.black)),
            ],
          ),
          body: controller.isFeedLoading.value == true || controller.postDataList.isNotEmpty
              ? ListView.separated(
                  itemCount: controller.postDataList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (controller.postDataList[index].postBy == "u") {
                                  if (controller.appController.loginResponse.value.userId.toString() == "${controller.postDataList[index].user?.id}") {
                                    Get.put<DashboardScreenController>(DashboardScreenController());
                                    final bottomNavController = Get.find<DashboardScreenController>();
                                    bottomNavController.goToProfile();
                                  } else {
                                    Get.toNamed(RoutesStrings.userAccountGetProfileRoute, arguments: {"userId": "${controller.postDataList[index].user?.id}"});
                                  }
                                } else {
                                  Get.toNamed(RoutesStrings.serviceDetailsRoute, arguments: {"userId": "${controller.postDataList[index].supplier?.id}"});
                                }
                              },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40.sp),
                                    child: SizedBox(
                                      height: 50.sp,
                                      width: 50.sp,
                                      child: CachedNetworkImage(
                                        imageUrl: controller.postDataList[index].user?.image != null
                                            ? "${controller.userBaseUrl.value}${controller.postDataList[index].user?.image}"
                                            : controller.postDataList[index].supplier?.image != null
                                                ? "${controller.supplierBaseUrl.value}${controller.postDataList[index].supplier?.image}"
                                                : "",
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
                                  10.sp.horizontalSpace,
                                  Text(
                                    controller.postDataList[index].user?.fullName != null ? "${controller.postDataList[index].user?.fullName}" : "${controller.postDataList[index].title}",
                                    // "${controller.postDataList[index].title}",
                                    style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              controller.postDataList[index].createdAt != null
                                  ? DateFormat('dd MMM').format(
                                      DateTime.parse(
                                        "${controller.postDataList[index].createdAt}",
                                      ),
                                    )
                                  : ' ',
                              style: Theme.of(context).grayCliff400.copyWith(fontSize: 14.sp, color: MyColors.appTxtColor),
                            ),
                          ],
                        ).paddingOnly(left: 16.sp, right: 16.sp, top: 20.sp, bottom: 12.sp),
                        controller.postDataList[index].tag != null
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 12.sp, left: 16.sp),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Tags",
                                      style: Theme.of(context).grayCliff500.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor),
                                    ),
                                    8.sp.horizontalSpace,
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RoutesStrings.serviceDetailsRoute, arguments: {"supplierId": "${controller.postDataList[index].tag}"});
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 6.sp),
                                        decoration: BoxDecoration(color: MyColors.secondarLightyColor, borderRadius: BorderRadius.circular(10.sp)),
                                        child: Text(
                                          "${controller.postDataList[index].title}",
                                          style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp, color: MyColors.greenBorderColor),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        GestureDetector(
                          onDoubleTap: () {
                            controller.addLikeAPI(index: index, isAnimate: true);
                          },
                          child: SizedBox(
                            height: 350.sp,
                            width: Get.width,
                            child: controller.postDataList[index].media != null && controller.postDataList[index].media!.isNotEmpty
                                ? Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      PageView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        controller: PageController(initialPage: controller.currentIndexMap[index] ?? 0),
                                        onPageChanged: (value) {
                                          controller.currentIndexMap[index] = value;
                                          controller.currentIndexMap.refresh();
                                        },
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller.postDataList[index].media?.length,
                                        itemBuilder: (context, index2) {
                                          if (controller.postDataList[index].media?[index2].type == "image") {
                                            return SizedBox(
                                              height: 350.sp,
                                              width: Get.width,
                                              child: CachedNetworkImage(
                                                imageUrl: "${ApiEndPoints.secureImageBaseUrl}${controller.postDataList[index].media?[index2].media}",
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
                                            );
                                          } else if (controller.postDataList[index].media?[index2].type == "video") {
                                            return Padding(
                                              padding: EdgeInsets.only(bottom: 8.sp),
                                              child: CommonVideoPlayer(
                                                isShowPlayPause: true,
                                                url: "${controller.mediaBaseUrl.value}${controller.postDataList[index].media?[index2].media}",
                                              ),
                                            );
                                          } else {
                                            return Image.asset(ImageConstants.placeholderImg);
                                          }
                                        },
                                      ),
                                      controller.postDataList[index].media?.length == 1
                                          ? const SizedBox()
                                          : Padding(
                                              padding: EdgeInsets.only(top: 10.sp, right: 8.sp),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: MyColors.appTxtColor,
                                                  borderRadius: BorderRadius.circular(20.sp),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 8.sp),
                                                  child: Obx(() {
                                                    final currentIndex = controller.currentIndexMap[index] ?? 0;
                                                    return Text(
                                                      "${currentIndex + 1}/${controller.postDataList[index].media?.length ?? 0}",
                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.sp),
                                                    );
                                                  }),
                                                ),
                                              ),
                                            ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Obx(() {
                                          return Visibility(
                                            visible: controller.isHeartVisibleList[index],
                                            child: AnimatedBuilder(
                                              animation: controller.heartAnimationController,
                                              builder: (context, child) {
                                                return Transform.scale(
                                                  scale: controller.heartAnimation.value,
                                                  child: Image.asset(
                                                    ImageConstants.iconUnlikeWhite,
                                                    color: controller.postDataList[index].liked == 1 ? Colors.red.withOpacity(0.85) : Colors.white.withOpacity(0.85),
                                                    height: 300.sp,
                                                    width: 300.sp,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  )
                                : Image.asset(ImageConstants.placeholderImg),
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),

                            /// LIKE
                            24.sp.horizontalSpace,
                            IconButton(
                              onPressed: () {
                                controller.addLikeAPI(index: index, isAnimate: false);
                              },
                              icon: Obx(() {
                                return Image.asset(
                                  controller.postDataList[index].liked == 1 ? ImageConstants.iconLike : ImageConstants.iconUnlike,
                                  color: controller.postDataList[index].liked == 1 ? Colors.red : Colors.black,
                                  height: 26.sp,
                                );
                              }),
                            ),
                            Text('${controller.postDataList[index].likes}', style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                            // 8.sp.horizontalSpace,

                            /// Comment
                            IconButton(
                                onPressed: () {
                                  MountedCallbackExecutor.ensureIsThatMounted(
                                    () => controller.postsCommentsListAPI(id: controller.postDataList[index].id.toString()),
                                  );
                                  Get.toNamed(RoutesStrings.commentRoute, arguments: {
                                    'index': index,
                                    'postId': "${controller.postDataList[index].id}",
                                  });
                                },
                                icon: Image.asset(ImageConstants.iconComment, color: Colors.black, height: 24.sp)),
                            Text('${controller.postDataList[index].comments}', style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                            // 8.sp.horizontalSpace,

                            /// BookMark
                            IconButton(
                              onPressed: () {
                                controller.addBookMarkAPI(id: controller.postDataList[index].id.toString());
                              },
                              icon: Obx(() {
                                return Image.asset(
                                  controller.postDataList[index].isBookmark == 1
                                      ? ImageConstants.iconFillBookmark
                                      : ImageConstants.iconBookmark,
                                  color: Colors.black,
                                  height: 24.sp,
                                );
                              }),
                            ),
                            const Spacer(),

                            /// REPORT Or DELETE
                            _deleteOrReportView(controller, index, context),
                          ],
                        ),
                        controller.postDataList[index].description != null && controller.postDataList[index].description != ""
                            ? RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: controller.postDataList[index].description != null && controller.postDataList[index].description != ""
                                            ? controller.postDataList[index].user?.fullName != null
                                                ? "${controller.postDataList[index].user?.fullName} "
                                                : "${controller.postDataList[index].title}"
                                            : "",
                                        style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                                    TextSpan(text: " ${controller.postDataList[index].description}", style: Theme.of(context).grayCliff500.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                                  ],
                                ),
                              ).paddingSymmetric(horizontal: 12.sp)
                            : const SizedBox.shrink(),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => controller.postDataList[index].description != null && controller.postDataList[index].description != "" ? 10.sp.verticalSpace : 0.verticalSpace,
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _deleteOrReportView(FeedScreenController controller, int index, BuildContext context) {
    return IconButton(
      onPressed: () {
        if ((controller.postDataList[index].user?.id?.toString() ?? controller.postDataList[index].supplier?.id?.toString() ?? "") == controller.appController.loginResponse.value.userId.toString()) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: GestureDetector(
                  onTap: () {
                    controller.deletePostAPI(id: "${controller.postDataList[index].id}");
                    controller.postDataList.removeAt(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10.sp, top: 10.sp),
                    child: const Text("Delete"),
                  ),
                ),
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10, bottom: 12.sp, top: 10.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    Text(
                                      "Report",
                                      style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Get.back();
                                        Get.back();
                                        controller.reportController.value.clear();
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                12.verticalSpace,
                                TextFormField(
                                  controller: controller.reportController.value,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xffE8EEF2),
                                    errorStyle: TextStyle(
                                      fontSize: 0.sp,
                                      color: MyColors.transparent,
                                    ),
                                    hintText: 'Why are you reporting this post?...',
                                    hintStyle: Theme.of(context).grayCliff400.copyWith(color: MyColors.hintColor),
                                    border: CommonProps.textFieldWhiteBorder,
                                    disabledBorder: CommonProps.textFieldWhiteBorder,
                                    enabledBorder: CommonProps.textFieldWhiteBorder,
                                    errorBorder: CommonProps.textFieldWhiteBorder,
                                    focusedBorder: CommonProps.textFieldWhiteBorder,
                                    focusedErrorBorder: CommonProps.textFieldWhiteBorder,
                                  ),
                                  cursorColor: MyColors.secondaryColor,
                                  style: Theme.of(context).grayCliff400.copyWith(color: MyColors.black),
                                ),
                                12.verticalSpace,
                                GestureDetector(
                                  onTap: () {
                                    if (controller.reportController.value.text.trim().isNotEmpty) {
                                      controller.reportPostAPI(id: "${controller.postDataList[index].id}");
                                    } else {
                                      Fluttertoast.showToast(msg: "Message cannot be empty or just spaces.");
                                    }
                                  },
                                  child: Container(
                                    height: 50.sp,
                                    color: MyColors.secondaryColor,
                                    padding: EdgeInsets.symmetric(vertical: 15.sp),
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Submit',
                                      style: Theme.of(context).grayCliff500.copyWith(
                                            fontSize: MyFonts.fonts16,
                                            color: MyColors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10.sp, top: 10.sp),
                    child: const Text("Report"),
                  ),
                ),
              );
            },
          );
        }
      },
      icon: Image.asset(ImageConstants.iconMore, color: Colors.black, height: 20.sp),
    );
  }
}
