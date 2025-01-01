import 'package:multiple_image_and_videos_as_social_media/core/core.dart';
import 'package:multiple_image_and_videos_as_social_media/services/service.dart';

class TagSearchScreen extends StatelessWidget {
  const TagSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: NewPostScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Tag people",
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
                        hintText: "Tag Your Service Provider...",
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
                controller.tagSearchList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.tagSearchList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 12.sp, bottom: 12.sp),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesStrings.newPostRoute, arguments: {'tagSearchList': controller.tagSearchList[index]});
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
                                          imageUrl: controller.tagSearchList[index].image != null ? controller.tagSearchList[index].image.toString() : ImageConstants.icUserPlaceholder,
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
                                    Expanded(
                                      child: Text(
                                        "${controller.tagSearchList[index].serviceName}",
                                        style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                      ),
                                    ),
                                  ],
                                ),
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
