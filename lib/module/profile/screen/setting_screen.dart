import '../../../core/core.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SettingScreenController>(
      init: SettingScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Settings",
              style: Theme.of(context).grayCliff600.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            leading: Image.asset(
              scale: 3,
              ImageConstants.iconBack,
            ).addGesture(
              () {
                Get.back();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                25.verticalSpace,
                Container(
                  height: 125.sp,
                  width: 125.sp,
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: MyColors.black),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.sp),
                    child: Padding(
                      padding: EdgeInsets.all(3.sp),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.sp),
                        child: /*Image.network(
                          // ImageConstants.carousalImage1,
                          controller.image.value,
                          fit: BoxFit.cover,
                        ),*/
                            CachedNetworkImage(
                          imageUrl: controller.image.value.isNotEmpty ? controller.image.value.toString() : ImageConstants.icUserPlaceholder,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(child: Image.asset(ImageConstants.icUserPlaceholder, fit: BoxFit.cover)),
                          errorWidget: (context, url, error) => Image.asset(ImageConstants.icUserPlaceholder, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                Text(
                  controller.fullName.value,
                  style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts18),
                ),
                5.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
                  child: Text(
                    textAlign: TextAlign.center,
                    controller.bio.value ?? "",
                    style: Theme.of(context).grayCliff500.copyWith(
                          fontSize: MyFonts.fonts16,
                          color: MyColors.grey,
                        ),
                  ),
                ),
                45.verticalSpace,
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  shrinkWrap: true,
                  itemCount: controller.settingDataList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.settingDataList[index]['ScreenName'] == RoutesStrings.changePasswordRoute) {
                          showChangePasswordBottomSheet(context);
                        } else if (controller.settingDataList[index]['Name'] == "Terms & Conditions") {
                          Get.toNamed(controller.settingDataList[index]['ScreenName'], arguments: {"url": controller.termsUrl.value, "Name": controller.settingDataList[index]['Name']});
                        } else if (controller.settingDataList[index]['Name'] == "About Us") {
                          Get.toNamed(controller.settingDataList[index]['ScreenName'], arguments: {"url": controller.aboutUsUrl.value, "Name": controller.settingDataList[index]['Name']});
                        } else if (controller.settingDataList[index]['Name'] == "Privacy Policy") {
                          Get.toNamed(controller.settingDataList[index]['ScreenName'], arguments: {"url": controller.privacyPolicyUrl.value, "Name": controller.settingDataList[index]['Name']});
                        } else {
                          Get.toNamed(controller.settingDataList[index]['ScreenName']);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 14.sp),
                        margin: EdgeInsets.only(bottom: 16.sp),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColors.materialScaffoldBackground),
                          borderRadius: BorderRadius.circular(2.sp),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              controller.settingDataList[index]['icon'].toString(),
                              height: 22.sp,
                              width: 22.sp,
                              color: MyColors.appTxtColor,
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Text(
                                controller.settingDataList[index]['Name'].toString(),
                                style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts18),
                              ),
                            ),
                            Image.asset(
                              ImageConstants.iconNextGreen,
                              height: 22.sp,
                              width: 22.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                65.verticalSpace,
              ],
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              AppController().removeAllKeysAndLogout();
            },
            child: Container(
              height: 50.sp,
              color: MyColors.secondaryColor,
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "LOGOUT",
                style: Theme.of(context).grayCliff600.copyWith(
                      fontSize: 16.sp,
                      color: MyColors.white,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
