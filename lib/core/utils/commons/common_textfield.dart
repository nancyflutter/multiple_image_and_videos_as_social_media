import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/constant.dart';
import 'commons.dart';

class CommonTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscureText;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  const CommonTextField(
      {super.key,
        this.labelText,
        required this.controller,
        this.suffix,
        this.prefix,
        this.obscureText = false,
        this.fillColor, this.onChanged, this.inputFormatters,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? const Color(0xffE8EEF2),
        errorStyle: TextStyle(
          fontSize: 0.sp,
          color: MyColors.transparent,
        ),
        hintText: labelText ?? "",
        hintStyle:
        Theme.of(context).grayCliff400.copyWith(color: MyColors.hintColor),
        border: CommonProps.textFieldWhiteBorder,
        disabledBorder: CommonProps.textFieldWhiteBorder,
        enabledBorder: CommonProps.textFieldWhiteBorder,
        errorBorder: CommonProps.textFieldWhiteBorder,
        focusedBorder: CommonProps.textFieldWhiteBorder,
        focusedErrorBorder: CommonProps.textFieldWhiteBorder,
        suffixIcon: suffix,
        prefixIcon: prefix,
      ),
      cursorColor: MyColors.secondaryColor,
      obscureText: obscureText,
      style: Theme.of(context).grayCliff400.copyWith(color: MyColors.black),
    );
  }
}
