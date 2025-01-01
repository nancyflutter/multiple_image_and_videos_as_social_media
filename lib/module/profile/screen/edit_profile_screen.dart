import 'dart:io';
import 'package:flutter/services.dart';
import '../../../core/core.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: EditProfileScreenController(),
      initState: (cnt) {
        var controller = cnt.controller;
        cnt.controller?.setData(
          userName: controller?.fullName.value ?? '',
          userImage: controller?.image.value ?? '',
          bio: controller?.bio.value ?? '',
        );
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            centerTitle: true,
            title: Text(
              "Edit Profile",
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
            elevation: 0.5,
          ),
          body: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.sp),
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 125.sp,
                        width: 125.sp,
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: MyColors.black),
                        ),
                        child: (controller.selectedImage.value.isNotEmpty && controller.selectedImage.value.contains('http'))
                            ? Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.sp),
                            child: Image.network(
                              controller.selectedImage.value,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  ImageConstants.icUserPlaceholder,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        )
                            : controller.selectedImage.value.isNotEmpty
                            ? Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.sp),
                            child: Image.file(
                              File(controller.selectedImage.value),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  ImageConstants.icUserPlaceholder,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.sp),
                            child: Image.asset(
                              ImageConstants.icUserPlaceholder,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.selectImagePopup(context);
                        },
                        child: Container(
                          height: 38.sp,
                          width: 38.sp,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                          child: Image.asset(
                            ImageConstants.iconCamera,
                            height: 40.sp,
                            width: 40.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              25.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.sp),
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(border: Border.all(color: MyColors.materialScaffoldBackground), borderRadius: BorderRadius.circular(4.sp)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                    ),
                    8.verticalSpace,
                    CommonTextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#\$&*~`%^()_+\-=\[\]{};:"\\|,.<>\/?\s]*')),
                      ],
                      labelText: "Name",
                      controller: controller.nameController.value,
                      onChanged: (value) {
                        controller.isValidData();
                      },
                    ),
                  ],
                ),
              ),
              15.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.sp),
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(border: Border.all(color: MyColors.materialScaffoldBackground), borderRadius: BorderRadius.circular(4.sp)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bio",
                      style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                    ),
                    4.verticalSpace,
                    TextFormField(
                      controller: controller.bioController.value,
                      maxLength: 160,
                      maxLines: 3,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffE8EEF2),
                        errorStyle: TextStyle(
                          fontSize: 0.sp,
                          color: MyColors.transparent,
                        ),
                        hintText: 'Bio',
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
                      onChanged: (value) {
                        controller.isValidData();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              controller.isValidPage();
              if (controller.isValidData.value) {
                controller.editProfileAPI();
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: Container(
              height: 50.sp,
              color: MyColors.secondaryColor,
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Save',
                style: Theme.of(context).grayCliff500.copyWith(
                      fontSize: MyFonts.fonts16,
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
