/*
import 'package:get/get.dart';

class AvailabilityScreenController extends GetxController {
  RxString abc = RxString('abc');
  RxString selectedDate = RxString('');


  RxInt numberOfPersons = RxInt(1);
  void incrementPersons() {
    numberOfPersons.value++;
  }
  void decrementPersons() {
    if (numberOfPersons.value > 1) {
      numberOfPersons.value--;
    }
  }


  RxString selectedTime = RxString('');
  void selectTime(String time) {
    selectedTime.value = time;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
*/

import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/check_availability_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_availability_status_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/pass_restaurant_availability_detail_model.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/pass_restaurant_detail_model.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/time_slot_model.dart';
import 'package:multiple_image_and_videos_as_social_media/services/service.dart';

class AvailabilityScreenController extends GetxController {
  RxString selectedDate = RxString('');
  Rx<DateTime> rawDate = Rx(DateTime.now());
  Rx<CheckAvailabilityStatus> checkAvailabilityData = Rx(CheckAvailabilityStatus());
  RxList<TimeSlotModel> availableLateDinnerList = RxList([]);
  RxList<TimeSlotModel> availableBreakFastList = RxList([]);
  RxList<TimeSlotModel> availableLunchList = RxList([]);
  RxList<TimeSlotModel> availableDinnerList = RxList([]);
  RxList<Available> timeList = RxList([]);
  Rx<PassRestaurantDetailModel> passRestaurantDetail = Rx(PassRestaurantDetailModel());
  Rx<PassRestaurantAvailabilityDetailModel> passRestaurantAvailabilityDetail = Rx(PassRestaurantAvailabilityDetailModel());
  Rx<String> preferredTime = RxString('');

  RxInt numberOfPersons = RxInt(1);

  void incrementPersons() {
    if (numberOfPersons.value < 16) {
      numberOfPersons.value++;
    }
  }

  void decrementPersons() {
    if (numberOfPersons.value > 1) {
      numberOfPersons.value--;
    }
  }

  // RxString selectedTime = RxString('');
  //
  // void selectTime(String time) {
  //   selectedTime.value = time;
  // }

  checkAvailabilityStatus([DateTime? earliestStartDate]) async {
    CheckAvailabilityPayload payload = CheckAvailabilityPayload(
      latestStartTime: DateTime(earliestStartDate?.year ?? DateTime.now().year, earliestStartDate?.month ?? DateTime.now().month, earliestStartDate?.day ?? DateTime.now().day, 23, 59, 59).toIso8601String().split('.').first,
      restaurantId: passRestaurantDetail.value.restaurantId ?? '',
      earliestStartTime: earliestStartDate?.toIso8601String().split('.').first ?? DateTime.now().toIso8601String().split('.').first,
      covers: '1',
    );

    CheckAvailabilityStatus? data = await ApiRepository.checkAvailabilityStatus(payload);
    if (data != null) {
      checkAvailabilityData.value = data;
      if (timeList.isNotEmpty) {
        timeList.clear();
        availableLateDinnerList.clear();
        availableBreakFastList.clear();
        availableLunchList.clear();
        availableDinnerList.clear();
      }
      timeList.value = checkAvailabilityData.value.available ?? [];

      if (timeList.isNotEmpty) {
        for (int i = 0; i < (timeList.length); i++) {
          if (checkTime(timeStr: timeList[i].value.toString(), afterStr: "00:00", beforeStr: "06:00")) {
            availableLateDinnerList.add(TimeSlotModel(time: timeList[i].value.toString()));
          } else if (checkTime(timeStr: timeList[i].value.toString(), afterStr: "06:01", beforeStr: "11:59")) {
            availableBreakFastList.add(TimeSlotModel(time: timeList[i].value.toString()));
          } else if (checkTime(timeStr: timeList[i].value.toString(), afterStr: "12:00", beforeStr: "18:00")) {
            availableLunchList.add(TimeSlotModel(time: timeList[i].value.toString()));
          } else {
            availableDinnerList.add(TimeSlotModel(time: timeList[i].value.toString()));
          }
        }
      }
    }
  }

  onContinueTap() {
    passRestaurantAvailabilityDetail.value = PassRestaurantAvailabilityDetailModel(
      date: selectedDate.value,
      time: preferredTime.value,
      totalPerson: numberOfPersons.value.toString(),
      cab: 0,
      isFrom: '',
      latRestaurant: passRestaurantDetail.value.latRestaurant,
      lngRestaurant: passRestaurantDetail.value.lngRestaurant,
      pickUpAddress: '',
      pickUpLat: '',
      pickUpLng: '',
      previousTotalAmount: '',
      restaurantAddress: passRestaurantDetail.value.restaurantAddress,
      restaurantDescription: passRestaurantDetail.value.restaurantDescription,
      restaurantImage: passRestaurantDetail.value.restaurantImage,
      restaurantName: passRestaurantDetail.value.restaurantName,
      restaurantId: passRestaurantDetail.value.restaurantId,
      startTime: '',
    );
  }

  bool checkTime({required String timeStr, required String afterStr, required String beforeStr}) {
    try {
      DateTime now = DateTime.now();
      DateTime date1 = formatTime(timeStr);
      DateTime afterDate = DateTime.parse("${now.toIso8601String().split('T').first}T$afterStr:00");
      DateTime beforeDate = DateTime.parse("${now.toIso8601String().split('T').first}T$beforeStr:00");

      if (date1.isAfter(afterDate) && date1.isBefore(beforeDate)) {
        return true;
      }
    } catch (e) {
      print("Error parsing date: $e");
    }
    return false;
  }

  DateTime formatTime(String time) {
    DateTime now = DateTime.now();
    String timeStr = DateFormat('HH:mm').format(DateTime.parse(time));
    String dateTimeStr = "${now.toIso8601String().split('T').first}T$timeStr:00";
    DateTime dateTime = DateTime.parse(dateTimeStr);
    return dateTime;
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectedDate.value = DateFormat('MMM dd, yyyy').format(DateTime.now());
      if (Get.arguments != null) {
        passRestaurantDetail.value = Get.arguments;
        checkAvailabilityStatus();
      }
    });

    super.onInit();
  }
}
