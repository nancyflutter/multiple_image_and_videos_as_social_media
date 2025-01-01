import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/video_player/common_video_player.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/controller/notification_post_detail_controller.dart';
import '../../../core/core.dart';

class NotificationPostDetailScreen extends StatelessWidget {
  const NotificationPostDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: NotificationPostDetailController(),
        initState: (cnt) {
          if (Get.arguments != null) {
            cnt.controller?.notificationPostId.value = Get.arguments['postId'].toString();
          }
          MountedCallbackExecutor.ensureIsThatMounted(
            () => cnt.controller?.notificationPostDetailAPI(id: "${cnt.controller?.notificationPostId.value}"),
          );
        },
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
            body: controller.notificationPostDetailList.isEmpty || controller.notificationPostDetail.value.post!.isEmpty || controller.isLoading.value == true
                ? const SizedBox.shrink()
                : Column(
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
                                    imageUrl: "${controller.userBaseUrl}${controller.appController.loginResponse.value.image}",
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
                                "${controller.appController.loginResponse.value.fullName}",
                                style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            controller.notificationPostDetailList.first.createdAt != null
                                ? DateFormat('dd MMM').format(
                                    DateTime.parse(
                                      "${controller.notificationPostDetailList.first.createdAt}",
                                    ),
                                  )
                                : ' ',
                            style: Theme.of(context).grayCliff400.copyWith(fontSize: 14.sp, color: MyColors.appTxtColor),
                          ),
                        ],
                      ).paddingOnly(left: 16.sp, right: 16.sp, top: 20.sp, bottom: 12.sp),
                      controller.notificationPostDetailList.first.tag != null
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
                                        "${controller.notificationPostDetailList.first.title}",
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
                          controller.addLikeAPI(isAnimate: true);
                        },
                        child: SizedBox(
                          height: 350.sp,
                          width: Get.width,
                          child: controller.notificationPostDetailList.first.media?.first.media != null
                              ? controller.notificationPostDetailList.first.media?.first.type == "image"
                                  ? Stack(
                                      alignment: Alignment.topRight,
                                      // alignment: Alignment.center,
                                      children: [
                                        PageView.builder(
                                          physics: const BouncingScrollPhysics(),
                                          onPageChanged: (value) {
                                            controller.currentIndex.value = value;
                                            controller.currentIndex.refresh();
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.notificationPostDetailList.first.media?.length,
                                          itemBuilder: (context, index2) {
                                            return SizedBox(
                                              height: 350.sp,
                                              width: Get.width,
                                              child: CachedNetworkImage(
                                                imageUrl: "${controller.mediaBaseUrl.value}${controller.notificationPostDetailList.first.media?[index2].media}",
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
                                          },
                                        ),
                                        controller.notificationPostDetail.value.post?.first.media?.length == 1
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
                                                    child: Obx(
                                                      () => Text(
                                                        "${controller.currentIndex.value + 1}/${controller.notificationPostDetailList.first.media?.length}",
                                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.sp),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Visibility(
                                            visible: controller.isHeartVisibleList.first,
                                            child: AnimatedBuilder(
                                              animation: controller.heartAnimationController,
                                              builder: (context, child) {
                                                return Transform.scale(
                                                  scale: controller.heartAnimation.value,
                                                  child: Image.asset(
                                                    ImageConstants.iconUnlikeWhite,
                                                    color: controller.notificationPostDetailList.first.liked == 1 ? Colors.red.withOpacity(0.85) : Colors.white.withOpacity(0.85),
                                                    height: 300.sp,
                                                    width: 300.sp,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : controller.notificationPostDetailList.first.media?.first.type == "video"
                                      ? Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 8.sp),
                                              child: GetBuilder(
                                                  init: NotificationPostDetailController(),
                                                  builder: (controller) {
                                                    return CommonVideoPlayer(
                                                      isShowPlayPause: true,
                                                      url: "${controller.mediaBaseUrl.value}${controller.notificationPostDetailList.first.media?.first.media}",
                                                    );
                                                  }),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Visibility(
                                                visible: controller.isHeartVisibleList.first,
                                                child: AnimatedBuilder(
                                                  animation: controller.heartAnimationController,
                                                  builder: (context, child) {
                                                    return Transform.scale(
                                                      scale: controller.heartAnimation.value,
                                                      child: Image.asset(
                                                        ImageConstants.iconUnlikeWhite,
                                                        color: controller.notificationPostDetailList.first.liked == 1 ? Colors.red.withOpacity(0.85) : Colors.white.withOpacity(0.85),
                                                        height: 300.sp,
                                                        width: 300.sp,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Image.asset(ImageConstants.placeholderImg)
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
                              controller.addLikeAPI(isAnimate: false);
                            },
                            icon: Obx(() {
                              return Image.asset(
                                controller.notificationPostDetailList.first.liked == 1 ? ImageConstants.iconLike : ImageConstants.iconUnlike,
                                color: controller.notificationPostDetailList.first.liked == 1 ? Colors.red : Colors.black,
                                height: 26.sp,
                              );
                            }),
                          ),
                          Text('${controller.notificationPostDetailList.first.likes}', style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                          // 8.sp.horizontalSpace,

                          /// Comment
                          IconButton(
                              onPressed: () {
                                final feedController = Get.find<FeedScreenController>();
                                MountedCallbackExecutor.ensureIsThatMounted(
                                  () => feedController.postsCommentsListAPI(id: "${controller.notificationPostDetailList.first.id}"),
                                );
                                Get.toNamed(RoutesStrings.commentRoute, arguments: {
                                  'notificationPostId': "${controller.notificationPostDetailList.first.id}",
                                });
                              },
                              icon: Image.asset(ImageConstants.iconComment, color: Colors.black, height: 24.sp)),
                          Text('${controller.notificationPostDetailList.first.comments}', style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                          // 8.sp.horizontalSpace,
                          const Spacer(),

                          /// DELETE
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    content: GestureDetector(
                                      onTap: () {
                                        controller.deletePostAPI(id: "${controller.notificationPostDetailList.first.id}");
                                        controller.notificationPostDetailList.removeAt(0);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10.sp, top: 10.sp),
                                        child: const Text("Delete"),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Image.asset(ImageConstants.iconMore, color: Colors.black, height: 20.sp),
                          )
                        ],
                      ),
                      controller.notificationPostDetailList.first.description != null && controller.notificationPostDetailList.first.description != ""
                          ? RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(text: " ${controller.notificationPostDetailList.first.description}", style: Theme.of(context).grayCliff500.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor)),
                                ],
                              ),
                            ).paddingSymmetric(horizontal: 12.sp)
                          : const SizedBox.shrink(),
                    ],
                  ),
          );
        });
  }
}
