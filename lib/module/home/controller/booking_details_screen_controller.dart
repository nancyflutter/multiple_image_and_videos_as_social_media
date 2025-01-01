import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/location_helper.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/count_restaurant_tax_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/count_restaurant_tax_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/pass_restaurant_availability_detail_model.dart';
import 'package:multiple_image_and_videos_as_social_media/services/service.dart';

class BookingDetailsScreenController extends GetxController {
  RxString abc = RxString('abc');
  final appController = Get.find<AppController>();
  Rx<PassRestaurantAvailabilityDetailModel> passRestaurantAvailabilityDetail = Rx(PassRestaurantAvailabilityDetailModel());
  Rx<CountRestaurantTaxResponse> countRestaurantTaxData = Rx(CountRestaurantTaxResponse());
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  RxList<Marker> markers = RxList<Marker>([]);
  Rx<LatLng> serviceLocationLatLng = Rx(LatLng(
    LocationHelper.lat.value,
    LocationHelper.lng.value,
  ));

  void onMapCreated(GoogleMapController controller) {
    print("serviceLocationLatLng ::::::::: ${serviceLocationLatLng.value}");
    mapController.value = controller;
    mapController.value?.animateCamera(CameraUpdate.newLatLngZoom(serviceLocationLatLng.value, 14));
  }

  countRestaurantTaxApi() async {
    CountRestaurantTaxPayload countRestaurantTaxPayload = CountRestaurantTaxPayload(
      dropLat: "",
      dropLng: "",
      isCab: "0",
      pickupLat: "",
      pickupLng: "",
      restaurantLat: passRestaurantAvailabilityDetail.value.latRestaurant.toString(),
      restaurantLng: passRestaurantAvailabilityDetail.value.lngRestaurant.toString(),
      userId: appController.loginResponse.value.userId,
    );
    CountRestaurantTaxResponse? countRestaurantTaxResponse = await ApiRepository.countRestaurantTax(countRestaurantTaxPayload);
    if (countRestaurantTaxResponse != null) {
      countRestaurantTaxData.value = countRestaurantTaxResponse;
    }
  }

  setAndAddMarker({
    required LatLng latLng,
  }) async {
    final BitmapDescriptor markerIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(36.sp, 46.sp)),
      'assets/images/icon_map_pin_green.png',
    );
    serviceLocationLatLng.value = latLng;
    mapController.value?.animateCamera(CameraUpdate.newLatLngZoom(serviceLocationLatLng.value, 14));
    markers.add(
      Marker(
        markerId: const MarkerId('marker'),
        position: serviceLocationLatLng.value,
        icon: markerIcon,
      ),
    );
  }

  @override
  void onInit() {
    passRestaurantAvailabilityDetail.value = Get.arguments;
    setAndAddMarker(
      latLng: LatLng(passRestaurantAvailabilityDetail.value.latRestaurant ?? 0.0, passRestaurantAvailabilityDetail.value.lngRestaurant ?? 0.0),
    );
    super.onInit();
  }
}
