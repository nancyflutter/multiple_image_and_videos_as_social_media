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


import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/pass_restaurant_availability_detail_model.dart';
import '../../../core/core.dart';

class BookingEatInfoController extends GetxController {
  final appController = Get.find<AppController>();

  Rx<TextEditingController> countryCodeController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> mobileNoController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> specialRequestController = Rx<TextEditingController>(TextEditingController());
  Rx<PassRestaurantAvailabilityDetailModel> passRestaurantAvailabilityDetail = Rx(PassRestaurantAvailabilityDetailModel());
  Rx<String> preferredTime = RxString('');

  RxMap<String, dynamic> selectedCountry = RxMap();
  RxList<Map<String, dynamic>> foundItems = RxList<Map<String, dynamic>>([]);

  @override
  void onInit() {
    passRestaurantAvailabilityDetail.value = Get.arguments;
    mobileNoController.value.text = appController.loginResponse.value.mobile ?? '';
    countryCodeController.value.text = appController.loginResponse.value.mobileCode ?? '';
    super.onInit();
    selectedCountry.value = countryList.firstWhere((element) => element["country_en"] == "India");
    foundItems.value = countryList;
  }

  ///--------------- Other Functions --------------------------

  void filterItem(String item) {
    List<Map<String, dynamic>> results = [];
    if (item.isEmpty) {
      results = countryList;
    } else {
      results = countryList.where((element) => element["country_en"].toString().toLowerCase().startsWith(item.toLowerCase())).toList();
    }
    foundItems.value = results;
    foundItems.refresh();
  }

  resetCountryData() {
    foundItems.value = countryList;
  }
}
