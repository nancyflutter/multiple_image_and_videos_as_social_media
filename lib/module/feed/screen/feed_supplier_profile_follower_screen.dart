import 'package:multiple_image_and_videos_as_social_media/module/feed/controller/feed_supplier_profile_follower_controller.dart';
import '../../../core/core.dart';

class FeedSupplierProfileFollowerScreen extends StatelessWidget {
  const FeedSupplierProfileFollowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: FeedSupplierProfileFollowerController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  color: MyColors.white,
                ),
              ),
              backgroundColor: Colors.black,
              title: Text(controller.userName.value.toUpperCase()),
            ),
            body: controller.isDataLoading.value
                ? const SizedBox.shrink()
                : controller.followerList.value.responseData?.isNotEmpty == true
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.followerList.value.responseData?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.sp),
                            child: Column(
                              children: [
                                10.verticalSpace,
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.sp),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.sp),
                                    child: Row(
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
                                        "${controller.appController.loginResponse.value.userId}" == "${controller.followerList.value.responseData?[index].followingUserId}"
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
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(child: Text("No followers")),
          );
        });
  }
}
