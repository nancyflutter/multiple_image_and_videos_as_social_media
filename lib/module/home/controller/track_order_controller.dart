import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/location_helper.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurant_booking_detail_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurant_booking_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';
import '../../../core/core.dart';

class TrackOrderController extends GetxController {
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  final DashboardScreenController ds = Get.put<DashboardScreenController>(DashboardScreenController());
  RxMap<MarkerId, Marker> markers = RxMap({});
  final appController = Get.find<AppController>();
  Rx<RestaurantBookingResponse> restaurantBookingDetails = Rx(RestaurantBookingResponse());
  Rx<LatLng> serviceLocationLatLng = Rx(LatLng(
    LocationHelper.lat.value,
    LocationHelper.lng.value,
  ));
  final sheet = GlobalKey();
  RxBool isMin = RxBool(true);
  Rx<DraggableScrollableController> draggableScrollableController = Rx(DraggableScrollableController());
  RxSet<Polyline> polyLines2 = RxSet({});
  RxString bookingId = RxString('');
  RxBool isCancelOrderButtonEnable = RxBool(true);

  void onMapCreated(GoogleMapController controller) {
    print("serviceLocationLatLng ::::::::: ${serviceLocationLatLng.value}");
    mapController.value = controller;
    mapController.value?.animateCamera(CameraUpdate.newLatLngZoom(serviceLocationLatLng.value, 4));
  }

  Future<void> addMarker(LatLng position, String id, String iconPath) async {
    final BitmapDescriptor icon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(36, 48)),
      iconPath,
    );

    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(markerId: markerId, position: position, icon: icon);
    markers[markerId] = marker;
  }

  void createPolyLines(LatLng original, LatLng destination) {
    List<LatLng> polylineCoordinates = [original, destination];

    Polyline polyline = Polyline(
      polylineId: const PolylineId('polyline'),
      color: Colors.black,
      points: polylineCoordinates,
      width: 2,
      patterns: [
        PatternItem.dash(25),
        PatternItem.gap(15),
      ],
    );

    polyLines2.add(polyline);
  }

  getTrackOrderDetails(String bookId) async {
    RestaurantBookingPayload restaurantBookingPayload = RestaurantBookingPayload(
      userId: appController.loginResponse.value.userId,
      timeZone: 'Asia/Calcutta',
      bookId: bookId,
    );

    RestaurantBookingResponse? restaurantBookingResponse = await ApiRepository.getRestaurantBookingDetails(restaurantBookingPayload);
    if (restaurantBookingResponse != null) {
      restaurantBookingDetails.value = restaurantBookingResponse;
      isCancelOrderButtonEnable.value = true;
      setAndAddMarker(
        latLng: LatLng(restaurantBookingDetails.value.supplier?.latitude ?? 0.0, restaurantBookingDetails.value.supplier?.longitude ?? 0.0),
      );

    }
  }

  setAndAddMarker({
    required LatLng latLng,
  }) async {
    serviceLocationLatLng.value = latLng;
    mapController.value?.animateCamera(CameraUpdate.newLatLngZoom(serviceLocationLatLng.value, 3));

    await addMarker(LatLng(LocationHelper.lat.value, LocationHelper.lng.value), 'origin', 'assets/images/icon_home_pin_new.png');
    await addMarker(serviceLocationLatLng.value, 'destination', 'assets/images/icon_service_pin.png');
    createPolyLines(LatLng(LocationHelper.lat.value, LocationHelper.lng.value), serviceLocationLatLng.value);
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookingId.value = Get.arguments;
      getTrackOrderDetails(Get.arguments);
    });

    super.onInit();
  }

  Future<void> changeOrderStatusImpl() async {
    isCancelOrderButtonEnable.value = false;
    BookingStatusPayload payload = BookingStatusPayload(
      status: "canceled",
      covers: restaurantBookingDetails.value.numberOfPerson,
      startTime: restaurantBookingDetails.value.startTime.toString(),
    );
    print(payload.toMap());

    if (await ApiRepository.bookingStatusApi(payload.toMap(), reservationId: restaurantBookingDetails.value.reservationId) ?? false) {
      showCustomFlushBar(msg: "Booking canceled successfully.");
      getTrackOrderDetails(bookingId.value);
    }

  }
}
