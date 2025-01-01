import 'package:intl/intl.dart';

class CustomValidation {
  ///valid Url
  static bool hasValidUrl(String value) {
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  ///ValidEmail
  static bool isValidEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  /*///ValidPassword
  bool isValidPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }*/

  ///ValidPassword
  static bool isValidPassword(String value) {
    String pattern =
        r'^.{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  ///ValidPhone
  static bool isValidPhone(String value) {
    String pattern = r'^[0-9]{9,13}$';
    // String pattern = r'^(?=.*?[0-9]).{10,10}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  ///ValidName
  static bool isValidName(String value) {
    String pattern = r'^[a-zA-Z_ ]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  ///ValidNumber
  static bool isValidNumber(String value) {
    String pattern = r'^[0-9_ ]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String humanReadableFormat(double numberToFormat){
    if(numberToFormat == 0){
      return NumberFormat.compactCurrency(
        decimalDigits: 0,
        // locale: 'en_IN',
        symbol: '',
      ).format(numberToFormat);
    }else{
      return NumberFormat.compactCurrency(
        decimalDigits: 2,
        // locale: 'en_IN',
        symbol: '',
      ).format(numberToFormat);
    }

  }

  static String splitNumberFormat(dynamic numberToFormat){
    return NumberFormat.decimalPattern('En').format(numberToFormat);
  }


}