import 'package:multiple_image_and_videos_as_social_media/core/core.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/create_reservation_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/create_reservation_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/pass_restaurant_availability_detail_model.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';

class PaymentScreenController extends GetxController {
  RxString abc = RxString('abc');
  RxBool isCODPayMethodSelected = RxBool(true);
  RxBool isGPayMethodSelected = RxBool(false);
  final appController = Get.find<AppController>();
  Rx<PassRestaurantAvailabilityDetailModel> restaurantDetail = Rx(PassRestaurantAvailabilityDetailModel());
  Rx<CreateReservationResponse> createReservationData = Rx(CreateReservationResponse());

  String formatDate(String dateString) {
    DateFormat inputFormat = DateFormat('MMM dd, yyyy');
    DateTime dateTime = inputFormat.parse(dateString);
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    String formattedDate = outputFormat.format(dateTime);
    return formattedDate;
  }

  createReservationApi() async {
    CreateReservationPayload createReservationPayload = CreateReservationPayload(
      date: formatDate(restaurantDetail.value.date ?? ''),
      deliveryCharge: '0.00',
      deliveryRate: '1-10',
      distance: '0',
      distanceTime: '0',
      emailId: appController.loginResponse.value.email,
      firstName: appController.loginResponse.value.fullName?.split(' ').first,
      isCab: '0',
      isCod: '1',
      isReturn: '1',
      lastName: appController.loginResponse.value.fullName?.split(' ').last,
      mobileNumber: '${appController.loginResponse.value.mobileCode}${appController.loginResponse.value.mobile}',
      numberOfPerson: restaurantDetail.value.totalPerson,
      payId: '123',
      pickupCharge: '0.00',
      restaurantId: restaurantDetail.value.restaurantId,
      returnCharge: '0.00',
      returnDistance: '0',
      returnTime: '0',
      startTime: '${formatDate(restaurantDetail.value.date ?? '')}T${DateFormat('HH:mm:ss').format(
        DateTime.parse(restaurantDetail.value.time ?? ''),
      )}',
      time: DateFormat('hh:mm a').format(DateTime.parse(restaurantDetail.value.time ?? '')),
      userId: appController.loginResponse.value.userId,
    );
    CreateReservationResponse? createReservationResponse = await ApiRepository.createReservation(createReservationPayload);
    if (createReservationResponse != null) {
      createReservationData.value = createReservationResponse;
      Get.toNamed(RoutesStrings.trackOrderScreen, arguments: createReservationData.value.id.toString());
    }
  }

  @override
  void onInit() {
    restaurantDetail.value = Get.arguments;
    super.onInit();
  }
}
