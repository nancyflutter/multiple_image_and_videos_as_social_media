import 'package:get/get.dart';

class ServiceBookingScreenController extends GetxController {
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
