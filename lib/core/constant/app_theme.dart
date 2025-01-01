import 'package:flutter/material.dart';
import 'constant.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: MyColors.black,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: MyColors.materialScaffoldBackground,
    useMaterial3: false,
  );
}

extension CustomThemeExtension on ThemeData {
  TextStyle get grayCliff800 => TextStyle(fontFamily: Fonts.grayCliff, fontWeight: FontWeight.w800, color: MyColors.appTxtColor);

  TextStyle get grayCliffBold => TextStyle(fontFamily: Fonts.grayCliffBold,fontWeight: FontWeight.w600, color: MyColors.appTxtColor);

  TextStyle get grayCliff700 => TextStyle(fontFamily: Fonts.grayCliff, fontWeight: FontWeight.w700, color: MyColors.appTxtColor);

  TextStyle get grayCliff600 => TextStyle(fontFamily: Fonts.grayCliff, fontWeight: FontWeight.w600, color: MyColors.appTxtColor);

  TextStyle get grayCliff500 => TextStyle(fontFamily: Fonts.grayCliff, fontWeight: FontWeight.w500, color: MyColors.appTxtColor);

  TextStyle get grayCliff400 => TextStyle(fontFamily: Fonts.grayCliff, fontWeight: FontWeight.w400, color: MyColors.appTxtColor);

  TextStyle get grayCliff300 => TextStyle(fontFamily: Fonts.grayCliff, fontWeight: FontWeight.w300, color: MyColors.appTxtColor);
}
