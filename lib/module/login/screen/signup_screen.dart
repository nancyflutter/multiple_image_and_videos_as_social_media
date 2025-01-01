import 'package:flutter/services.dart';

import '../../../core/core.dart';

class SignupScreen extends StatelessWidget {
  final ValueNotifier<bool> passwordVisibility = ValueNotifier(true);
  final ValueNotifier<bool> confirmPasswordVisibility = ValueNotifier(true);

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: SignupScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: MyColors.white,
              elevation: 0.5,
              centerTitle: true,
              title: Text(
                "Sign up",
                style: Theme.of(context).grayCliff600.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  scale: 3,
                  ImageConstants.iconBack,
                ),
              )),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextField(
                  labelText: "Full Name",
                  controller: controller.nameController.value,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                  ],
                ),
                18.verticalSpace,
                TextFormField(
                  controller: controller.mobileNumberController.value,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffE8EEF2),
                    errorStyle: TextStyle(
                      fontSize: 0.sp,
                      color: MyColors.transparent,
                    ),
                    hintText: "Mobile Number",
                    hintStyle: Theme.of(context).grayCliff400.copyWith(color: MyColors.hintColor),
                    border: CommonProps.textFieldWhiteBorder,
                    disabledBorder: CommonProps.textFieldWhiteBorder,
                    enabledBorder: CommonProps.textFieldWhiteBorder,
                    errorBorder: CommonProps.textFieldWhiteBorder,
                    focusedBorder: CommonProps.textFieldWhiteBorder,
                    focusedErrorBorder: CommonProps.textFieldWhiteBorder,
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                      titlePadding: EdgeInsets.all(12.sp),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                      title: Text(
                                        "Select Country",
                                        style: Theme.of(context).grayCliff500.copyWith(fontSize: 25.sp),
                                      ),
                                      content: showNewCountryCodeDialog(context));
                                });
                          },
                          child: Row(
                            children: [
                              5.horizontalSpace,
                              Text(
                                controller.selectedCountry["flag"],
                                style: TextStyle(fontSize: 25.sp),
                              ),
                              5.horizontalSpace,
                              Text(
                                "+${controller.selectedCountry["phone_code"]}",
                                style: Theme.of(context).grayCliff600.copyWith(
                                      fontSize: MyFonts.fonts14,
                                    ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: MyColors.black,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 4.sp),
                      ],
                    ),
                  ),
                  // maxLength: controller.selectedCountry["max_length"],
                  validator: (value) {
                    value = value!.replaceAll(RegExp(r'[^\d]'), '');

                    if (value.isEmpty) {
                      return 'Please enter phone number';
                    }

                    int minLength = controller.selectedCountry["min_length"];
                    int maxLength = controller.selectedCountry["max_length"];
                    if (value.length < minLength || value.length > maxLength) {
                      return 'Phone number must have ${controller.selectedCountry["max_length"]} digits';
                    }
                    return null;
                  },
                  // onChanged: (value) {
                  //   controller.formKeyPhone.currentState!.validate();
                  // },
                  cursorColor: MyColors.secondaryColor,
                  style: Theme.of(context).grayCliff400.copyWith(color: MyColors.black),
                ),
                18.verticalSpace,
                CommonTextField(
                  labelText: "Email Address",
                  controller: controller.emailController.value,
                ),
                18.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: passwordVisibility,
                  builder: (context, val, _) {
                    return CommonTextField(
                      labelText: "Password",
                      controller: controller.passwordController.value,
                      obscureText: val,
                      suffix: GestureDetector(
                        onTap: () {
                          passwordVisibility.value = !val;
                        },
                        child: Icon(
                          val ? Icons.visibility_off : Icons.visibility,
                          color: MyColors.hintColor,
                        ),
                      ),
                    );
                  },
                ),
                18.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: confirmPasswordVisibility,
                  builder: (context, val, _) {
                    return CommonTextField(
                      labelText: "Confrim Password",
                      controller: controller.confirmPasswordController.value,
                      obscureText: val,
                      suffix: GestureDetector(
                        onTap: () {
                          confirmPasswordVisibility.value = !val;
                        },
                        child: Icon(
                          val ? Icons.visibility_off : Icons.visibility,
                          color: MyColors.hintColor,
                        ),
                      ),
                    );
                  },
                ),
                30.verticalSpace,
                CommonButton(
                  onTap: () {
                    controller.onSignup();
                  },
                  buttonText: "Create Account",
                ),
                25.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90.sp,
                      height: 2.sp,
                      color: MyColors.dividerColor,
                    ),
                    Text(" Or sign up with ", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                    Container(
                      width: 90.sp,
                      height: 2.sp,
                      color: MyColors.dividerColor,
                    ),
                  ],
                ),
                25.verticalSpace,
                GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.sp),
                    child: Container(
                        width: double.infinity,
                        height: 58.sp,
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(border: Border.all(color: MyColors.googleBorder)),
                        // color: MyColors.secondaryColor,
                        child: Image.asset(ImageConstants.iconGoogle)),
                  ),
                ),
                40.verticalSpace,
                Text(
                  "Already have an account?",
                  style: Theme.of(context).grayCliff600.copyWith(color: MyColors.appTxtColor, fontSize: MyFonts.fonts16),
                ),
                10.verticalSpace,
                Text(
                  "Sign in",
                  style: Theme.of(context).grayCliff500.copyWith(color: MyColors.secondaryColor, fontSize: MyFonts.fonts16),
                ).addGesture(
                  () => Get.offAllNamed(RoutesStrings.loginRoute),
                ),
              ],
            ).paddingAll(15.sp),
          ),
        );
      },
    );
  }
}
