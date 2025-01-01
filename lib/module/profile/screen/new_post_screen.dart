import 'dart:io';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/video_player/common_video_player.dart';
import '../../../core/core.dart';

class NewPostScreen extends StatelessWidget {
  final ValueNotifier _currentPage = ValueNotifier(0);

  NewPostScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: NewPostScreenController(),
      initState: (cnt) {
        if (Get.arguments != null) {
          cnt.controller?.selectedTag.value = Get.arguments['tagSearchList'];
        }
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "New Post",
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
          body: SizedBox(
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView(
                          onPageChanged: (value) {
                            _currentPage.value = value;
                          },
                          scrollDirection: Axis.horizontal,
                          children: controller.imageList.isNotEmpty
                              ? controller.imageList
                                  .map(
                                    (e) => SizedBox(
                                      width: Get.width,
                                      child: (controller.getMimeType(e.extension ?? "").contains("video"))
                                          ? Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Container(color: MyColors.black, alignment: Alignment.center, child: CommonVideoPlayer(url: e.path ?? "")),
                                                Positioned(
                                                  right: 5,
                                                  top: 5,
                                                  child: Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.all(4.sp),
                                                      child: Icon(Icons.emergency_recording_rounded, color: MyColors.secondaryColor),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : (controller.getMimeType(e.extension ?? "").contains("image"))
                                              ? Image.file(File(e.path ?? ""), fit: BoxFit.cover)
                                              : Icon(
                                                  Icons.error_outline,
                                                  size: 30.sp,
                                                ),
                                    ),
                                  )
                                  .toList()
                              : [const Center(child: Text("No media selected"))],
                        ),
                        (controller.imageList.length > 1)
                            ? Positioned(
                                bottom: 10.sp,
                                child: ValueListenableBuilder(
                                  valueListenable: _currentPage,
                                  builder: (context, val, child) {
                                    return Row(
                                      children: controller.imageList
                                          .asMap()
                                          .entries
                                          .map(
                                            (entry) => AnimatedContainer(
                                              margin: EdgeInsets.symmetric(horizontal: 6.sp),
                                              duration: const Duration(milliseconds: 400),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100.sp),
                                                color: val == entry.key ? Colors.green : Colors.green.withOpacity(.4),
                                              ),
                                              height: 10.sp,
                                              width: 10.sp,
                                            ),
                                          )
                                          .toList(),
                                    );
                                  },
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        20.verticalSpace,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12.sp),
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.sp),
                            color: MyColors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Caption",
                                style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                              ),
                              12.verticalSpace,
                              TextFormField(
                                controller: controller.descriptionController.value,
                                maxLength: 300,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xffE8EEF2),
                                  errorStyle: TextStyle(
                                    fontSize: 0.sp,
                                    color: MyColors.transparent,
                                  ),
                                  hintText: "Add a caption..",
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
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12.sp),
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.sp),
                            color: MyColors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tags",
                                style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                              ),
                              12.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50.sp,
                                    width: 50.sp,
                                    child: ClipOval(
                                      child: controller.selectedTag.value?.image != null
                                          ? CachedNetworkImage(
                                              imageUrl: controller.selectedTag.value?.image ?? '',
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              ImageConstants.icUserPlaceholder, // Placeholder image
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  12.horizontalSpace,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.selectedTag.value?.serviceName ?? '',
                                          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                        ),
                                        5.verticalSpace,
                                        Text(
                                          controller.selectedTag.value?.supplierAddress ?? '',
                                          style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        65.verticalSpace
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              controller.addPost();
            },
            child: Container(
              height: 50.sp,
              color: MyColors.secondaryColor,
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Post",
                style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
