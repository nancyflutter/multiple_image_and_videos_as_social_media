import 'package:fluttertoast/fluttertoast.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/video_player/common_video_player.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/controller/profile_post_detail_page_controller.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_endpoints.dart';
import '../../../core/core.dart';

class ProfilePostDetailPage extends StatelessWidget {
  const ProfilePostDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ProfilePostDetailPageController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: MyColors.white,
            appBar: AppBar(
              backgroundColor: MyColors.white,
              centerTitle: true,
              title: Text(
                "Post",
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
              elevation: 0.5,
            ),
            body: controller.postDataList.isNotEmpty
                ? ScrollablePositionedList.separated(
                    itemScrollController: controller.itemScrollController,
                    itemCount: controller.postDataList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40.sp),
                                    child: SizedBox(
                                      height: 50.sp,
                                      width: 50.sp,
                                      child: CachedNetworkImage(
                                        imageUrl: controller.image.value,
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
                                    controller.name.value,
                                    style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor),
                                  ),
                                ],
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

                          /// tag view
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
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 6.sp),
                                          decoration: BoxDecoration(color: MyColors.secondarLightyColor, borderRadius: BorderRadius.circular(10.sp)),
                                          child: Text(
                                            "${controller.postDataList[index].title}",
                                            style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp, color: MyColors.greenBorderColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
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
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 6.sp),
                                          decoration: BoxDecoration(color: MyColors.secondarLightyColor, borderRadius: BorderRadius.circular(10.sp)),
                                          child: Text(
                                            controller.name.value,
                                            style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp, color: MyColors.greenBorderColor),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                          /// media view
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
                                          controller: PageController(initialPage: controller.currentIndexMap[index] ?? 0),
                                          physics: const BouncingScrollPhysics(),
                                          onPageChanged: (value) {
                                            controller.currentIndexMap[index] = value;
                                            controller.currentIndexMap.refresh();
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.postDataList[index].media?.length ?? 0,
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
                                                child: GetBuilder(
                                                  init: ProfilePostDetailPageController(),
                                                  builder: (controller) {
                                                    return CommonVideoPlayer(
                                                      isShowPlayPause: true,
                                                      url: "${controller.mediaBaseUrl.value}${controller.postDataList[index].media?[index2].media}",
                                                    );
                                                  },
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
                                                        "${currentIndex + 1}/${controller.postDataList[index].media?.length ?? 0}",
                                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.sp),
                                                      );
                                                    }),
                                                  ),
                                                ),
                                              ),
                                        Align(
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
                                                      color: controller.postDataList[index].liked == 1 ? Colors.red.withOpacity(0.85) : Colors.white.withOpacity(0.85),
                                                      height: 300.sp,
                                                      width: 300.sp,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
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
                                icon: Image.asset(
                                  controller.postDataList[index].liked == 1 ? ImageConstants.iconLike : ImageConstants.iconUnlike,
                                  color: controller.postDataList[index].liked == 1 ? Colors.red : Colors.black,
                                  height: 26.sp,
                                ),
                              ),
                              Text('${controller.postDataList[index].likes}', style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                              // 8.sp.horizontalSpace,

                              /// Comment
                              IconButton(
                                  onPressed: () {
                                    Get.put<FeedScreenController>(FeedScreenController());
                                    final commentController = Get.find<FeedScreenController>();
                                    MountedCallbackExecutor.ensureIsThatMounted(
                                      () => commentController.postsCommentsListAPI(id: controller.postDataList[index].id.toString()),
                                    );
                                    Get.toNamed(RoutesStrings.commentRoute, arguments: {
                                      'index': index,
                                      'postId': "${controller.postDataList[index].id}",
                                    });
                                  },
                                  icon: Image.asset(ImageConstants.iconComment, color: Colors.black, height: 24.sp)),
                              Text('${controller.postDataList[index].comments}', style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                              // 8.sp.horizontalSpace,
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
                : const Center(child: Text("No data found.")),
          );
        });
  }

  Widget _deleteOrReportView(ProfilePostDetailPageController controller, int index, BuildContext context) {
    return IconButton(
      onPressed: () {
        if (controller.postDataList[index].publisherId.toString() == controller.appController.loginResponse.value.userId.toString()) {
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
