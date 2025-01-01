/*
import 'package:get/get.dart';
import 'package:wandersupplier_android_flutter/module/profile/profile.dart';

import '../../core/core.dart';

class NewPostScreen extends StatelessWidget {
  final ProfileScreenController controller;

  final ValueNotifier _currentPage = ValueNotifier(0);

  NewPostScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.off(const BottomNavigationBarUI(currentIndex: 3));
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
            onPressed: () {
              Get.off(const BottomNavigationBarUI(currentIndex: 3));
            },
          ),
          title: Text("New Post", style: Theme.of(context).grayCliff700.copyWith(fontSize: 16)),
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300.sp,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView(
                      onPageChanged: (value) {
                        _currentPage.value = value;
                      },
                      scrollDirection: Axis.horizontal,
                      children: controller.imageList
                          .map(
                            (e) => SizedBox(
                            width: Get.width,
                            child: (controller.getMimeType(e.extension ?? ""))
                                ? FutureBuilder<String?>(
                              future: CommonUtilsMethods.generateVideoThumbnail(e.path ?? ""),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                                  return Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Image.file(height: Get.height, width: Get.width, File(snapshot.data!), fit: BoxFit.cover),
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
                                  );
                                } else {
                                  return SizedBox(
                                    height: 125.sp,
                                    width: 125.sp,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100.sp),
                                      child: Image.asset("assets/images/pl.png"),
                                    ),
                                  );
                                }
                              },
                            )
                                : Image.file(File(e.path ?? ""), fit: BoxFit.cover)),
                      )
                          .toList(),
                    ),
                    (controller.imageList.length) > 1
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
                                  .toList());
                        },
                      ),
                    )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6.sp),
                child: TextField(
                  controller: controller.addMediaDescription,
                  maxLength: 300,
                  maxLines: 5,
                  style: Theme.of(context).grayCliff500,
                  decoration: InputDecoration(
                    hintText: 'Description...',
                    hintStyle: Theme.of(context).grayCliff500,
                    fillColor: const Color(0xFFEEF2FC),
                    filled: true,
                    border: InputBorder.none,
                  ),
                ),
              ).paddingAll(16.sp),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 50.sp,
          color: MyColors.secondaryColor,
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("Post", style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp, color: MyColors.white)),
        ).addGesture(() {
          controller.addPost();
        }),
      ),
    );
  }
}
*/
