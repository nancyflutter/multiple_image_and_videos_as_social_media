import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/constant.dart';
import 'console.dart';

class CommonWidgets {
  ///Custom TextView
  static customTextView(
      {required String text,
      required Color color,
      required double fontSize,
      required FontWeight fontWeight,
      String? fontFamily,
      double? letterSpacing,
      double? wordSpacing,
      double? height,
      TextDecoration? textDecoration,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
      style: TextStyle(
        decoration: textDecoration ?? TextDecoration.none,
        fontSize: fontSize,
        fontFamily: fontFamily ??  Fonts.grayCliff,
        wordSpacing: wordSpacing,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
      ),
    );
  }

  //Custom Skip Button
  static customSkipButton({
    required VoidCallback onTap,
    required String text,
    required Color textcolor,
    required Color bgcolor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp), color: bgcolor),
        child: CommonWidgets.customTextView(text: text, color: textcolor, fontSize: MyFonts.fonts14, fontWeight: FontWeight.normal, fontFamily: "outfit_light"),
      ),
    );
  }

  ///CustomBack Button
  static CustomSkipButton({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          border: Border.all(color: MyColors.black, width: 1.sp),
        ),
        child: CommonWidgets.customTextView(
            text: text, color: MyColors.black, fontSize: MyFonts.fonts14, fontWeight: FontWeight.normal, fontFamily: "outfit_bold"),
      ),
    );
  }

  ///custom TextField
  static customTextField({
    required TextEditingController editController,
    required String labelText,
    Widget? prefixIcon,
    required Key formKey,
    bool? isFieldEmpty,
    final bool? isInfoVisible,
    TextInputAction? textInputAction,
    TextInputType? inputType,
    bool? readonly,
    Color? hintTextcolor,
    Color? fillColor,
    Function(String)? onChanged,
    GestureTapCallback? ontap,
    void Function(String)? onSubmit,
    String? Function(String?)? validation,
    int? maxlines,
    bool? isPasswordType,
    Widget? suffixIcon,
    int? maxLength,
    bool? autofocus,
    int? fontsize,
    bool? autovalidate = false,
  }) {
    return TextFormField(
      autovalidateMode: autovalidate == false ? AutovalidateMode.disabled : AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onSubmit,
      onTap: ontap,
      onChanged: onChanged,
      // maxLength: maxLength,
      readOnly: readonly ?? false,
      textInputAction: textInputAction,
      maxLines: maxlines,
      inputFormatters: [
        maxLength != null ? LengthLimitingTextInputFormatter(maxLength) : LengthLimitingTextInputFormatter(1000),
      ],
      autofocus: autofocus ?? false,
      keyboardType: inputType,
      controller: editController,
      cursorColor: MyColors.black,
      validator: validation,
      obscureText: isPasswordType ?? false,
      style: TextStyle(color: MyColors.black, fontSize: MyFonts.fonts16, fontFamily: "outfit_medium", fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(width: 1.h, color: MyColors.black),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: labelText,
          hintStyle: TextStyle(color: MyColors.black, fontSize: MyFonts.fonts14, fontFamily: "outfit_medium", fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(top: 20.h, bottom: 16.h, left: 16.w),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(width: 1.h, color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(width: 1.sp, color: MyColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(width: 1.h, color: MyColors.black),
          ),
          fillColor: fillColor ?? null,
          filled: true),
    );
  }

  ///Custom Like,Comment,Save Button on FeedPageUi
  static customLCSButton({required String image, required String text, required Null Function() onTap, Null Function()? onLongPress}) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        height: 40.sp,
        color: Colors.transparent,
        child: Row(
          children: [
            CommonWidgets.imageAsset(image: image, height: 22.sp, width: 22.sp),
            SizedBox(width: 5.sp),
            CommonWidgets.customTextView(
                text: text,
                color: MyColors.grey,
                fontFamily: "regular",
                fontSize: MyFonts.fonts14,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400),
          ],
        ),
      ),
    );
  }

  static customReactionButton({required String image, required String text}) {
    return SizedBox(
      height: 50.sp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets.imageAsset(image: image, height: 22.sp, width: 22.sp),
          SizedBox(width: 8.sp),
          CommonWidgets.customTextView(
              text: text, color: MyColors.grey, fontFamily: "regular", fontSize: MyFonts.fonts14, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w400),
        ],
      ),
    );
  }

  static customLabelTextField({
    required TextEditingController editController,
    required String labelText,
    Widget? prefixIcon,
    required Key formKey,
    bool? isFieldEmpty,
    final bool? isInfoVisible,
    TextInputAction? textInputAction,
    TextInputType? inputType,
    bool? readonly,
    Color? hintTextcolor,
    Color? fillColor,
    void Function(String)? onChanged,
    GestureTapCallback? ontap,
    void Function(String)? onSubmit,
    String? Function(String?)? validation,
    int? maxlines,
    bool? isPasswordType,
    Widget? suffixIcon,
    int? maxLength,
    bool? autofocus,
    int? fontsize,
  }) {
    return TextFormField(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onSubmit,
      onTap: ontap,
      onChanged: onChanged,
      // maxLength: maxLength,
      readOnly: readonly ?? false,
      textInputAction: textInputAction,
      maxLines: maxlines,
      inputFormatters: [
        maxLength != null ? LengthLimitingTextInputFormatter(maxLength) : LengthLimitingTextInputFormatter(1000),
      ],
      autofocus: autofocus ?? false,
      keyboardType: inputType,
      controller: editController,
      cursorColor: MyColors.black,
      validator: validation,
      obscureText: isPasswordType ?? false,
      style: TextStyle(color: MyColors.black, fontSize: MyFonts.fonts16, fontFamily: "outfit_medium", fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(width: 1.h, color: MyColors.black),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: TextStyle(color: MyColors.black, fontSize: MyFonts.fonts14, fontFamily: "outfit_medium", fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(top: 20.h, bottom: 16.h, left: 16.w),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(width: 1.h, color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(width: 1.sp, color: MyColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(width: 1.h, color: MyColors.black),
          ),
          fillColor: fillColor ?? null,
          filled: true),
    );
  }

  static imageAsset({required String image, BoxFit? boxFit, double? height, double? width, Color? color}) {
    return Image.asset(image, fit: boxFit, height: height, width: width, color: color);
  }

  /// Custom Button
  static customButton({required String buttonText, required Function() onTap, Color? buttonColor, Color? borderColor, Color? textColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp), color: buttonColor ?? MyColors.black, border: Border.all(color: borderColor ?? MyColors.black)),
        child: CommonWidgets.customTextView(
            text: buttonText, color: textColor ?? MyColors.white, fontSize: MyFonts.fonts14, fontWeight: FontWeight.normal, fontFamily: "outfit_bold"),
      ),
    );
  }

  ///custom Divider
  static divider({Gradient? gradientColor}) {
    return Container(decoration: BoxDecoration(gradient: gradientColor), height: 1.h, width: 60.w);
  }

  ///custom BackButton
  static backButton() {
    return GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Image.asset("assets/icons/back.png", height: 24.h, width: 24.w));
  }

  /// title and back appbar
  static appBar({required String title, required Function() onTap}) {
    return AppBar(
      title: CommonWidgets.customTextView(
          text: title,
          color: MyColors.black,
          fontFamily: "outfit_bold",
          fontSize: MyFonts.fonts18,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w600),
      centerTitle: true,
      iconTheme: IconThemeData(color: MyColors.black),
      backgroundColor: MyColors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Image.asset("assets/icons/back.png", height: 24.h, width: 24.w, color: Colors.black),
        ),
      ),
    );
  }

//FlushBar
  /*void showSnackBar(BuildContext context, String msg) {
    Flushbar(
      backgroundColor: Colors.black.withOpacity(0.9),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(10),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      margin: const EdgeInsets.all(10),
      messageText: Text(msg, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white)),
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.info_outline, size: 75.sp, color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    ).show(context);
  }*/

  /// CommonContainer Like Appbar
  /*static appBarContainer({required String titleText, required String subtitleText, required final child, bool? onTap}) {
    return Container(
      color: MyColors.bgcolor,
      height: Get.height,
      width: Get.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 60.h),
        Padding(padding: EdgeInsets.symmetric(horizontal: 14.w), child: CommonWidgets.backButton()),
        SizedBox(height: 20.h),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: CommonWidgets.customTextView(
                text: titleText, color: MyColors.white, fontSize: MyFonts.fonts22, fontWeight: FontWeight.normal, fontFamily: "outfit_bold")),
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: CommonWidgets.customTextView(
              text: subtitleText, color: MyColors.grey1, fontSize: MyFonts.fonts14, fontWeight: FontWeight.normal, fontFamily: "outfit_medium"),
        ),
        SizedBox(height: 20.h),
        Expanded(child: child)
      ]),
    );
  }*/

  Widget loader({dataLoad}) {
    return dataLoad
        ? Padding(padding: const EdgeInsets.symmetric(vertical: 32), child: Center(child: CircularProgressIndicator(color: MyColors.black)))
        : const SizedBox();
  }
}

Widget customAppBar(
  BuildContext context, {
  bool isShowLogo = false,
  bool isShowBackArrow = false,
  String? title,
  String? suffixIcon,
  Color? iconColor,
  Function()? onTap,
  int currentStep = 1,
  int totalStep = 0,
  EdgeInsetsGeometry? padding,
}) {
  return Container(
    color: Colors.white,
    margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    padding: EdgeInsets.only(top: 10.sp),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            children: [
              if (isShowBackArrow)
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                    child: Image.asset("assets/icons/back.png", height: 24.sp, width: 24.sp, color: iconColor),
                  ),
                )
              else
                SizedBox(height: 44.sp, width: 44.sp),
              Expanded(
                child: Container(
                  height: 55.sp,
                  alignment: Alignment.center,
                  child: isShowLogo
                      ? Image.asset("images/img_logo.png", width: 110.sp)
                      : CommonWidgets.customTextView(
                          text: title ?? '',
                          color: const Color(0xff4C4D54),
                          fontSize: MyFonts.fonts18,
                          fontWeight: FontWeight.w600,
                        ),
                ),
              ),
              if (suffixIcon?.isNotEmpty ?? false)
                GestureDetector(
                  onTap: onTap ?? () {},
                  child: Container(
                    height: 44.sp,
                    width: 44.sp,
                    padding: padding ?? EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
                    child: Image.asset(suffixIcon ?? "icons/ic_search.png", color: iconColor),
                  ),
                )
              else
                SizedBox(height: 44.sp, width: 44.sp),
            ],
          ),
        ),
        SizedBox(height: 8.sp),
      ],
    ),
  );
}

/// this function is for displaying error view
void showCustomFlushBar({required String msg}) {
  Console.debug("Flush-Bar calling....");
  final flushBar = Flushbar(
    icon: Icon(Icons.info_outline, size: 30.sp, color: Colors.white),
    animationDuration: const Duration(milliseconds: 600),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: Colors.black,
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    messageText: Text(msg, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: Colors.white)),
  );

  flushBar.isDismissed();
  flushBar.show(Get.context!);
}

/*void showProgressDialog() {
  showDialog(
      context: navigatorKey.currentContext ?? Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.black, backgroundColor: Colors.blue),
        );
      });
}*/

dismissProgressDialog({bool? canPop}) {
  Get.back(canPop: canPop ?? false);
}

/*void updateConnectionStatus(ConnectivityResult connectivityResult) {
  if (connectivityResult == ConnectivityResult.none) {
    Get.rawSnackbar(
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 16.sp,
        messageText: CommonWidgets.customTextView(
            text: "PLEASE CONNECT TO THE INTERNET",
            color: MyColors.white,
            fontSize: MyFonts.fonts14,
            fontWeight: FontWeight.normal,
            fontFamily: "outfit_medium"),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.red[400]!,
        icon: Icon(Icons.wifi_off, color: Colors.white, size: 25.sp),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED);
  } else {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
  }
}*/

bool isDialogShowing = false;

/*void customAlertDialog(
    {String title = "Oops!",
    String? subTitle,
    void Function()? onTap,
    String primaryActionTitle = "Try again",
    String secondaryActionTitle = "Not now",
    bool showIcon = true,
    bool canPop = false,
    String? image}) {
  if (canPop) {
    Get.back(canPop: true);
  }
  Console.debug("isDialogShowing $isDialogShowing");
  if (!isDialogShowing) {
    isDialogShowing = true;
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext ?? Get.context!,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            isDialogShowing = false;
            return true;
          },
          child: AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            elevation: 2,
            title: showIcon
                ? Container(
                    padding: EdgeInsets.all(18.sp),
                    margin: EdgeInsets.symmetric(horizontal: 60.sp),
                    height: 80.sp,
                    width: 100.sp,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: const Color(0xFFC52300).withOpacity(.10)),
                    child: Image.asset(image ?? "assets/icons/ic_warningAlert.png", color: Colors.red),
                  )
                : Image.asset("assets/icons/ic_warningAlert.png", height: 70.sp, width: 100.sp),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonWidgets.customTextView(text: title, color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                Text(
                  subTitle ?? 'It seems like we are having some issue to connect with server, please wait for a while or try again',
                  style: TextStyle(fontSize: 14.sp, color: MyColors.textcolor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50.sp,
                        width: MediaQuery.of(context).size.width / 3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12.sp),
                          border: Border.all(color: MyColors.textcolor),
                        ),
                        child: SizedBox(
                          child: Container(
                            child: CommonWidgets.customTextView(text: secondaryActionTitle, color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      height: 50.sp,
                      width: MediaQuery.of(context).size.width / 3,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: onTap ??
                            () {
                              Get.back();
                            },
                        child: CommonWidgets.customTextView(text: primaryActionTitle, color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    ).then((value) {
      isDialogShowing = false;
    });
  }
}*/

class PrintLogs {
  static void printLongString({String? title, String? data}) {
    if (kDebugMode) {
      developer.log('---------${title ?? "No Title Given"}-------\n${data ?? ""}');
    }
  }
}

/*class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function() onTap;
  final String title;

  const CustomCheckbox({super.key, required this.value, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.sp),
        child: Row(
          children: [
            Container(
              child: value
                  ? CommonWidgets.imageAsset(image: "assets/icons/tick-square.png", height: 20.h)
                  : CommonWidgets.imageAsset(image: "assets/icons/ic_square.png", height: 20.h),
            ),
            SizedBox(width: 12.h),
            CommonWidgets.customTextView(
                text: title.toString(), color: MyColors.bgcolor, fontSize: MyFonts.fonts16, fontWeight: FontWeight.w400, fontFamily: "regular"),
          ],
        ),
      ),
    );
  }
}*/
