import 'package:multiple_image_and_videos_as_social_media/module/feed/model/user_activity_list_response.dart';
import '../../../core/core.dart';
import 'package:grouped_list/grouped_list.dart';

class ActivityNotificationScreen extends StatelessWidget {
  const ActivityNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FeedScreenController>(
      init: FeedScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text("Activity", style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp)),
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
          body: Column(
            children: [
              Expanded(
                child: controller.userActivityDataList.isNotEmpty
                    ? GroupedListView<UserActivityListResponse, DateTime>(
                        elements: controller.userActivityDataList,
                        groupBy: (comment) => DateTime(comment.createdAt!.year, comment.createdAt!.month, comment.createdAt!.day),
                        groupHeaderBuilder: (UserActivityListResponse activity) => SizedBox(
                          height: 0.sp,
                          /*  child: Center(
                            child: Text(
                              DateFormat('dd MMMM, yyyy').format(activity.createdAt!),
                              style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp, color: MyColors.appTxtColor),
                            ),
                          ),*/
                        ),
                        itemBuilder: (context, UserActivityListResponse activity) {
                          String dateTimeUtc = "${activity.createdAt}";
                          String localDateTime = controller.uTCToLocal(dateTimeUtc, "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
                          String timeAgo = controller.getTimeAgo(localDateTime);
                          return Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    if (activity.userType == "u") {
                                      if (controller.appController.loginResponse.value.userId.toString() == "${activity.actionId}") {
                                        Get.put<DashboardScreenController>(DashboardScreenController());
                                        final bottomNavController = Get.find<DashboardScreenController>();
                                        bottomNavController.goToProfile();
                                      } else {
                                        Get.toNamed(RoutesStrings.userAccountGetProfileRoute, arguments: {"userId": "${activity.actionId}"});
                                      }
                                    } else {
                                      Get.toNamed(RoutesStrings.serviceDetailsRoute, arguments: {"userId": "${activity.actionId}"});
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 16.sp),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 12.sp),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 50.sp,
                                            width: 50.sp,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(100.sp)),
                                              child: CachedNetworkImage(
                                                imageUrl: activity.image != null ? activity.image.toString() : ImageConstants.icUserPlaceholder,
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: activity.fullName,
                                                        style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor),
                                                      ),
                                                      const TextSpan(text: " "),
                                                      TextSpan(
                                                        text: activity.string,
                                                        style: Theme.of(context).grayCliff400.copyWith(fontSize: 14.sp, color: MyColors.appTxtColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                6.sp.verticalSpace,
                                                Text(
                                                  timeAgo,
                                                  style: Theme.of(context).grayCliff400.copyWith(fontSize: 13.sp, color: MyColors.appTxtColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              "${activity.type}" == "like" || "${activity.type}" == "comment"
                                  ? GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RoutesStrings.notificationPostDetailScreen, arguments: {
                                          "postId": activity.postId,
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 16.sp),
                                        child: SizedBox(
                                          height: 46.sp,
                                          width: 46.sp,
                                          child: CachedNetworkImage(
                                            imageUrl: activity.media != null ? "${activity.media}" : ImageConstants.icNoImage,
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
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          );
                        },
                        order: GroupedListOrder.DESC,
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 100.sp),
                            SizedBox(width: Get.width, child: Image.asset(ImageConstants.iconNoComment, scale: 3)),
                            Text("No Notification", style: Theme.of(context).grayCliff500.copyWith(fontSize: 22.sp)).paddingSymmetric(vertical: 20.sp),
                          ],
                        ),
                      ),
              ), // import 'package:intl/intl.dart';
            ],
          ),
        );
      },
    );
  }
}
