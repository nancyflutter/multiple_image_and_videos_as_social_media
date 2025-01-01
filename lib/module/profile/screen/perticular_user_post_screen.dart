import 'package:fluttertoast/fluttertoast.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/video_player/common_video_player.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';
import '../../../core/core.dart';

class ParticularUserPostScreen extends StatelessWidget {
  const ParticularUserPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: FavouritesScreenController(),
      initState: (state) {
        final controller = state.controller;

        controller?.heartAnimationController = AnimationController(
          vsync: controller,
          duration: const Duration(milliseconds: 300),
        );

        controller?.heartAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(controller.heartAnimationController);

        controller?.isHeartVisibleList.value = List<bool>.filled(controller.getBookMarkedPost.length, false);

        controller?.scrollToTappedIndex();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Bookmarks",
              style: Theme.of(context).grayCliff600.copyWith(
                    fontSize: 16.sp,
                  ),
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
          ),
          body: controller.getBookMarkedPost.isNotEmpty
              ? GetX(
                  init: FavouritesScreenController(),
                  builder: (controller) {
                    return ScrollablePositionedList.separated(
                      itemScrollController: controller.scrollControllerItem,
                      itemCount: controller.getBookMarkedPost.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (controller.getBookMarkedPost[index].postBy == "u") {
                                      if (controller.appController.loginResponse.value.userId.toString() == "${controller.getBookMarkedPost[index].user?[0].id}") {
                                        Get.put<DashboardScreenController>(DashboardScreenController());
                                        final bottomNavController = Get.find<DashboardScreenController>();
                                        bottomNavController.goToProfile();
                                      } else {
                                        Get.toNamed(RoutesStrings.userAccountGetProfileRoute, arguments: {"userId": "${controller.getBookMarkedPost[index].user?[0].id}"});
                                      }
                                    } else {
                                      Get.toNamed(RoutesStrings.serviceDetailsRoute, arguments: {"userId": "${controller.getBookMarkedPost[index].supplier?[0].id}"});
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
                                            imageUrl: (controller.getBookMarkedPost[index].user?.isNotEmpty ?? false)
                                                ? "${controller.userBaseUrl}${controller.getBookMarkedPost[index].user?[0].image}"
                                                : (controller.getBookMarkedPost[index].supplier?.isNotEmpty ?? false)
                                                    ? "${controller.userBaseUrl}${controller.getBookMarkedPost[index].supplier?[0].image}"
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
                                        (controller.getBookMarkedPost[index].user?.isNotEmpty ?? false) ? "${controller.getBookMarkedPost[index].user?[0].fullName}" : "${controller.getBookMarkedPost[index].title}",
                                        style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  controller.getBookMarkedPost[index].createdAt != null
                                      ? DateFormat('dd MMM').format(
                                          DateTime.parse(
                                            "${controller.getBookMarkedPost[index].createdAt}",
                                          ),
                                        )
                                      : ' ',
                                  style: Theme.of(context).grayCliff400.copyWith(fontSize: 14.sp, color: MyColors.appTxtColor),
                                ),
                              ],
                            ).paddingOnly(left: 16.sp, right: 16.sp, top: 20.sp, bottom: 12.sp),
                            controller.getBookMarkedPost[index].tag != null
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
                                            Get.toNamed(RoutesStrings.serviceDetailsRoute, arguments: {"supplierId": "${controller.getBookMarkedPost[index].tag}"});
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 6.sp),
                                            decoration: BoxDecoration(color: MyColors.secondarLightyColor, borderRadius: BorderRadius.circular(10.sp)),
                                            child: Text(
                                              "${controller.getBookMarkedPost[index].title}",
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
                                if (index < controller.getBookMarkedPost.length) {
                                  controller.addLikeAPI(index: index);
                                } else {
                                  print("Index $index is out of bounds, cannot perform double-tap action.");
                                }
                              },
                              child: SizedBox(
                                  height: 350.sp,
                                  width: Get.width,
                                  child: controller.getBookMarkedPost[index].media?.first.media != null && controller.getBookMarkedPost[index].media!.isNotEmpty
                                      ? Stack(
                                          alignment: Alignment.topRight,
                                          // alignment: Alignment.center,
                                          children: [
                                            PageView.builder(
                                              controller: PageController(initialPage: controller.currentIndexMap[index] ?? 0),
                                              physics: const BouncingScrollPhysics(),
                                              onPageChanged: (value) {
                                                controller.currentIndexMap[index] = value;
                                                controller.currentIndexMap.refresh();
                                              },
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller.getBookMarkedPost[index].media?.length,
                                              itemBuilder: (context, index2) {
                                                if (controller.getBookMarkedPost[index].media?[index2].type == "image") {
                                                  return SizedBox(
                                                    height: 350.sp,
                                                    width: Get.width,
                                                    child: CachedNetworkImage(
                                                      imageUrl: "${ApiEndPoints.secureImageBaseUrl}${controller.getBookMarkedPost[index].media?[index2].media}",
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
                                                } else if (controller.getBookMarkedPost[index].media?[index2].type == "video") {
                                                  return Padding(
                                                    padding: EdgeInsets.only(bottom: 8.sp),
                                                    child: GetBuilder(
                                                        init: FavouritesScreenController(),
                                                        builder: (controller) {
                                                          return CommonVideoPlayer(
                                                            isShowPlayPause: true,
                                                            url: "${ApiEndPoints.secureImageBaseUrl}${controller.getBookMarkedPost[index].media?.first.media}",
                                                          );
                                                        }),
                                                  );
                                                } else {
                                                  return Image.asset(ImageConstants.placeholderImg);
                                                }
                                              },
                                            ),
                                            controller.getBookMarkedPost[index].media?.length == 1
                                                ? const SizedBox()
                                                : Padding(
                                                    padding: EdgeInsets.only(top: 20.sp, right: 6.sp),
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
                                                            "${currentIndex + 1}/${controller.getBookMarkedPost[index].media?.length ?? 0}",
                                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.sp),
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                            controller.isHeartVisibleList.isNotEmpty
                                                ? Align(
                                                    alignment: Alignment.center,
                                                    child: Obx(
                                                      () => Visibility(
                                                        visible: controller.isHeartVisibleList[index],
                                                        child: AnimatedBuilder(
                                                          animation: controller.heartAnimationController,
                                                          builder: (context, child) {
                                                            return Transform.scale(
                                                              scale: controller.heartAnimation.value,
                                                              child: Image.asset(
                                                                ImageConstants.iconUnlikeWhite,
                                                                color: controller.getBookMarkedPost[index].liked == 1 ? Colors.red.withOpacity(0.85) : Colors.white.withOpacity(0.85),
                                                                height: 300.sp,
                                                                width: 300.sp,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                          ],
                                        )
                                      : Image.asset(ImageConstants.placeholderImg)),
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
                                      controller.getBookMarkedPost[index].liked == 1 ? ImageConstants.iconLike : ImageConstants.iconUnlike,
                                      color: controller.getBookMarkedPost[index].liked == 1 ? Colors.red : Colors.black,
                                      height: 26.sp,
                                    );
                                  }),
                                ),
                                Text('${controller.getBookMarkedPost[index].likes}', style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                                // 8.sp.horizontalSpace,

                                /// Comment
                                IconButton(
                                    onPressed: () {
                                      MountedCallbackExecutor.ensureIsThatMounted(
                                        () => controller.postsCommentsListAPI(id: controller.getBookMarkedPost[index].id.toString()),
                                      );
                                      Get.toNamed(RoutesStrings.particularUserCommentRoute, arguments: {
                                        'index': index,
                                        'postId': "${controller.getBookMarkedPost[index].id}",
                                      });
                                    },
                                    icon: Image.asset(ImageConstants.iconComment, color: Colors.black, height: 24.sp)),
                                Text('${controller.getBookMarkedPost[index].comments}', style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                                // 8.sp.horizontalSpace,

                                /// BookMark
                                _addBookMarkButtonView(controller, index),
                                const Spacer(),

                                /// REPORT Or DELETE
                                _deleteOrReportView(controller, index, context),
                              ],
                            ),
                            controller.getBookMarkedPost[index].description != null && controller.getBookMarkedPost[index].description != ""
                                ? RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: controller.getBookMarkedPost[index].description != null && controller.getBookMarkedPost[index].description != ""
                                                ? (controller.getBookMarkedPost[index].user?.isNotEmpty ?? false)
                                                    ? "${controller.getBookMarkedPost[index].user?[0].fullName} "
                                                    : "${controller.getBookMarkedPost[index].title}"
                                                : "",
                                            style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                                        TextSpan(text: " ${controller.getBookMarkedPost[index].description}", style: Theme.of(context).grayCliff500.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                                      ],
                                    ),
                                  ).paddingSymmetric(horizontal: 12.sp)
                                : const SizedBox.shrink(),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => controller.getBookMarkedPost[index].description != null && controller.getBookMarkedPost[index].description != "" ? 10.sp.verticalSpace : 0.verticalSpace,
                    );
                  })
              : const Center(child: Text("No data found.")),
        );
      },
    );
  }

  Widget _addBookMarkButtonView(FavouritesScreenController controller, int index) {
    return IconButton(
      onPressed: () {
        controller.addBookMarkAPI(id: controller.getBookMarkedPost[index].id.toString());
      },
      icon: Obx(() {
        return Image.asset(
          controller.getBookMarkedPost[index].isBookmark == 1
              ? ImageConstants.iconFillBookmark
              : controller.getBookMarkedPost[index].isBookmark == 0
                  ? ImageConstants.iconBookmark
                  : ImageConstants.iconFillBookmark,
          color: Colors.black,
          height: 24.sp,
        );
      }),
    );
  }

  Widget _deleteOrReportView(FavouritesScreenController controller, int index, BuildContext context) {
    return IconButton(
      onPressed: () {
        if (((controller.getBookMarkedPost[index].user?.isNotEmpty ?? false) ? (controller.getBookMarkedPost[index].user?[0].id?.toString()) : (controller.getBookMarkedPost[index].supplier?[0].id?.toString() ?? "")) == controller.appController.loginResponse.value.userId.toString()) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: GestureDetector(
                  onTap: () {
                    controller.deletePostAPI(id: "${controller.getBookMarkedPost[index].id}");
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
                                      controller.reportPostAPI(id: "${controller.getBookMarkedPost[index].id}");
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
