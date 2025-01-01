import '../../../core/core.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: SearchScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Search",
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
          body: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                SizedBox(
                    height: 45.sp,
                    child: TextFormField(
                      controller: controller.searchController.value,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.materialScaffoldBackground,
                        errorStyle: TextStyle(
                          fontSize: 0.sp,
                          color: MyColors.transparent,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 0.sp),
                        hintText: "Tag your service provider...",
                        hintStyle: Theme.of(context).grayCliff400.copyWith(color: MyColors.hintColor),
                        border: CommonProps.textFieldWhiteBorder,
                        disabledBorder: CommonProps.textFieldWhiteBorder,
                        enabledBorder: CommonProps.textFieldWhiteBorder,
                        errorBorder: CommonProps.textFieldWhiteBorder,
                        focusedBorder: CommonProps.textFieldWhiteBorder,
                        focusedErrorBorder: CommonProps.textFieldWhiteBorder,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: Image.asset(
                            ImageConstants.iconSearchGray,
                            height: 20.sp,
                            width: 20.sp,
                          ),
                        ),
                      ),
                      cursorColor: MyColors.secondaryColor,
                      style: Theme.of(context).grayCliff400.copyWith(color: MyColors.black),
                      onChanged: (value) {
                        controller.onSearchUser(value);
                      },
                    )),
                15.verticalSpace,
                controller.userList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.userList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 12.sp, bottom: 12.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  /// USER IMAGE AND NAME VIEW
                                  GestureDetector(
                                    onTap: () {
                                      if (controller.userList[index].type == "u") {
                                        if (controller.appController.loginResponse.value.userId.toString() == "${controller.userList[index].userId}") {
                                          Get.put<DashboardScreenController>(DashboardScreenController());
                                          final bottomNavController = Get.find<DashboardScreenController>();
                                          bottomNavController.goToProfile();
                                        } else {
                                          Get.toNamed(RoutesStrings.userAccountGetProfileRoute, arguments: {"userId": "${controller.userList[index].userId}"});
                                        }
                                      } else {
                                        Get.toNamed(RoutesStrings.serviceDetailsRoute, arguments: {"userId": "${controller.userList[index].userId}"});
                                      }
                                    },
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 50.sp,
                                          width: 50.sp,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(100.sp),
                                            child: CachedNetworkImage(
                                              imageUrl: controller.userList[index].image != null ? controller.userList[index].image.toString() : ImageConstants.icUserPlaceholder,
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
                                        12.horizontalSpace,
                                        Text(
                                          "${controller.userList[index].name}",
                                          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                        ),
                                        12.horizontalSpace
                                      ],
                                    ),
                                  ),

                                  /// Follow - UnFollow Button view
                                  controller.userList[index].userId.toString() == controller.appController.loginResponse.value.userId.toString()
                                      ? const SizedBox()
                                      : GestureDetector(
                                          onTap: () {
                                            if (controller.userList[index].isFollow == 1) {
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
                                                          if (controller.userList[index].type == "u") {
                                                            controller.addFollowUserAPI(index: index);
                                                            controller.userList.refresh();
                                                          } else {
                                                            controller.addFollowSupplierAPI(index);
                                                            controller.userList.refresh();
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
                                              if (controller.userList[index].type == "u") {
                                                controller.addFollowUserAPI(index: index);
                                              } else {
                                                controller.addFollowSupplierAPI(index);
                                              }
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 12.sp),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6.sp),
                                              color: controller.userList[index].isFollow == 0 ? MyColors.greenBorderColor : null,
                                              border: controller.userList[index].isFollow == 0
                                                  ? null
                                                  : Border.all(
                                                      color: MyColors.greenBorderColor,
                                                      width: 1.sp,
                                                    ),
                                            ),
                                            child: Text(
                                              controller.userList[index].isFollow == 0 ? "Follow" : "UnFollow",
                                              style: Theme.of(context).grayCliff600.copyWith(
                                                    color: controller.userList[index].isFollow == 0 ? MyColors.white : MyColors.greenBorderColor,
                                                    fontSize: MyFonts.fonts15,
                                                  ),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
