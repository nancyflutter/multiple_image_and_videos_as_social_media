import 'package:fluttertoast/fluttertoast.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/posts_comment_response.dart';
import '../../../core/core.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FeedScreenController>(
      init: FeedScreenController(),
      builder: (controller) {
        if (Get.arguments != null) {
          if (Get.arguments['index'] != null && Get.arguments['index'].toString().isNotEmpty) {
            controller.index.value = int.tryParse(Get.arguments['index'].toString()) ?? 0;
          }
          if (Get.arguments['notificationPostId'] != null) {
            controller.postId.value = Get.arguments['notificationPostId'].toString();
          }
          if (Get.arguments['postId'] != null) {
            controller.postId.value = Get.arguments['postId'].toString();
          }
        }

        var indexData = controller.index.value;
        var postIdData = controller.postId.value;
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text("Comments", style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp)),
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
                child: controller.isLoading.value == true
                    ? const SizedBox.shrink()
                    : controller.postsCommentList.isNotEmpty
                        ? GroupedListView<GetPostCommentResponse, DateTime>(
                            elements: controller.postsCommentList,
                            groupBy: (comment) => DateTime(comment.createdAt!.year, comment.createdAt!.month, comment.createdAt!.day),
                            groupHeaderBuilder: (GetPostCommentResponse comment) => SizedBox(
                              height: 32.sp,
                              child: Center(
                                child: Text(
                                  DateFormat('dd MMMM, yyyy').format(comment.createdAt!),
                                  style: Theme.of(context).grayCliff500.copyWith(fontSize: 14.sp, color: MyColors.appTxtColor),
                                ),
                              ),
                            ),
                            itemBuilder: (context, GetPostCommentResponse comment) {
                              String dateTimeUtc = "${comment.createdAt}";
                              String localDateTime = controller.uTCToLocal(dateTimeUtc, "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
                              String timeAgo = controller.getTimeAgo(localDateTime);
                              return GestureDetector(
                                onTap: () {
                                  if (comment.type == "u") {
                                    if (controller.appController.loginResponse.value.userId.toString() == "${comment.userId}") {
                                      Get.put<DashboardScreenController>(DashboardScreenController());
                                      final bottomNavController = Get.find<DashboardScreenController>();
                                      bottomNavController.goToProfile();
                                    } else {
                                      Get.toNamed(RoutesStrings.userAccountGetProfileRoute, arguments: {"userId": "${comment.userId}"});
                                    }
                                  } else {
                                    Get.toNamed(RoutesStrings.serviceDetailsRoute, arguments: {"userId": "${comment.userId}"});
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 12.sp),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 24,
                                        backgroundImage: NetworkImage(comment.image ?? ""),
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
                                                    text: comment.name,
                                                    style: Theme.of(context).grayCliff700.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor),
                                                  ),
                                                  const TextSpan(text: " "),
                                                  TextSpan(
                                                    text: comment.comment,
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
                                      )
                                    ],
                                  ),
                                ),
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
                                Text("No Comments", style: Theme.of(context).grayCliff500.copyWith(fontSize: 22.sp)).paddingSymmetric(vertical: 20.sp),
                                Text("Be the first to leave comments about\nwhat you are thinking!", textAlign: TextAlign.center, style: Theme.of(context).grayCliff400.copyWith(fontSize: 18.sp)),
                              ],
                            ),
                          ),
              ),
              Container(color: MyColors.googleBorder, width: Get.width, height: 1),
              Container(
                height: 96.sp,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.sendMessageController.value,
                        decoration: InputDecoration(
                          hintText: 'Write your message..',
                          filled: true,
                          fillColor: MyColors.materialScaffoldBackground,
                          contentPadding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
                          border: CommonProps.textFieldWhiteBorder,
                          disabledBorder: CommonProps.textFieldWhiteBorder,
                          enabledBorder: CommonProps.textFieldWhiteBorder,
                          errorBorder: CommonProps.textFieldWhiteBorder,
                          focusedBorder: CommonProps.textFieldWhiteBorder,
                          focusedErrorBorder: CommonProps.textFieldWhiteBorder,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    GestureDetector(
                      child: Image.asset(ImageConstants.icSend, height: 52.sp, width: 52.sp, fit: BoxFit.cover),
                      onTap: () {
                        if (controller.sendMessageController.value.text.trim().isNotEmpty) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.addCommentsAPI(postId: postIdData, index: indexData, isNotificationScreen: Get.arguments['notificationPostId'] != null ? true : false);
                        } else {
                          Fluttertoast.showToast(msg: "Message cannot be empty or just spaces.");
                        }
                      },
                    ),
                    8.sp.horizontalSpace
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
