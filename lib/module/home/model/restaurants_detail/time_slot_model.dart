import 'package:get/get.dart';

class TimeSlotModel{
  String? time;
  RxBool isSelect = RxBool(false);

  TimeSlotModel({this.time});
}