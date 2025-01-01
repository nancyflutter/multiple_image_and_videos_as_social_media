import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/model/api_response_model.dart';
import '../../../core/core.dart';

class BookingServicelistScreenController extends GetxController {
  RxString abc = RxString('abc');
  RxList serviceData = RxList();

  // RxList<Map<String, dynamic>> serviceList = RxList<Map<String, dynamic>>(
  //   [
  //     {
  //       "img": ImageConstants.placeholderImg,
  //       "rating": 4.2,
  //       "name": "LAMBORGHINI CAR SERVICE",
  //       "address": "Durgram Chervu Cable Bridge, Inorbit Mall Road, Silpa Gram Craft Village, Madhapur, Telangana, India",
  //     },
  //     {
  //       "img": ImageConstants.placeholderImg,
  //       "rating": 3.5,
  //       "name": "DESERT SAFARI RIDES",
  //       "address": "Dubai - United Arab Emirates",
  //     },
  //     {
  //       "img": ImageConstants.placeholderImg,
  //       "rating": 3.5,
  //       "name": "AGADIR: BUGGY SAFARI ADVENTURE",
  //       "address": "W DUBAI - THE PALM, Palm Jumeirah - Dubai - United Arab Emirates",
  //     },
  //     {
  //       "img": ImageConstants.placeholderImg,
  //       "rating": 3.5,
  //       "name": "PALM JUMEIRAH CAR SERVICE",
  //       "address": "W DUBAI - THE PALM, Palm Jumeirah - Dubai - United Arab Emirates",
  //     },
  //   ],
  // );

  getBookingServices(String supplierId) async {
    Map<String, dynamic> payload = {'supplierID': supplierId};
    ApiResponseModel? bookingServiceData = await ApiRepository.getBookingServices(bodyData: payload);
    print('dafsfdsdsdds::::::::::${bookingServiceData?.responseData}');
    if (bookingServiceData?.responseData != null) {
      serviceData.value = bookingServiceData?.responseData;
    }
  }

  @override
  void onInit() {
    MountedCallbackExecutor.ensureIsThatMounted(() => getBookingServices(Get.arguments['supplierId'].toString()));
    super.onInit();
  }
}
