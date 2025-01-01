import 'dart:async';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/socket_helper.dart';
import '../../../services/api/api_repository.dart';
import '../booking.dart';
import '../model/booking_history_detail_model.dart';

class BookingHistoryDetailsController extends GetxController {
  final AppController appController = Get.find<AppController>();
  final DashboardScreenController ds = Get.put<DashboardScreenController>(DashboardScreenController());
  final socketHelperController = Get.find<SocketHelper>();

  late final Rx<BookingDetailsWrapper> _bookingResponse = Rx<BookingDetailsWrapper>(
    BookingDetailsWrapper(isHasChanged: false, bookingDetailsResponse: Rx<BookingHistoryDetailsResponse>(BookingHistoryDetailsResponse())),
  );

  Rx<BookingHistoryDetailsResponse?> get getBookingResponse => _bookingResponse.value.bookingDetailsResponse;

  bool get itHasToShowBoomSheet => _bookingResponse.value.bookingDetailsResponse.value.status == 1;

  static final Rx<LatLng> _initialPosition = Rx<LatLng>(const LatLng(45.521563, -122.677433));
  final Rx<Marker> _markers = Rx<Marker>(const Marker(markerId: MarkerId("markerId")));
  Rx<LatLng> get position => _initialPosition;
  Rx<Marker> get getMarker => _markers;
  RxInt msgCount = RxInt(0);
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  RxBool isChatOpen = RxBool(false);

  void onMapCreated(GoogleMapController controller) {
    mapController.value = controller;
  }

  @override
  void onInit() {
    MountedCallbackExecutor.ensureIsThatMounted(() => _getBookings());
    super.onInit();
  }

  Future<void> _getBookings() async {
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    BookingHistoryDetailsPayload payload = BookingHistoryDetailsPayload(
      bookId: Get.arguments.toString(),
      userId: appController.loginResponse.value.userId.toString(),
      timeZone: currentTimeZone,
    );
    print("BookingHistoryDetailsPayload :::::::::::: ${payload.toJson()}");
    BookingHistoryDetailsResponse? bookingHistoryDetailsResponse = await ApiRepository.bookingDetailsApi(payload);
    if (bookingHistoryDetailsResponse != null) {
      _bookingResponse.value.bookingDetailsResponse.value = bookingHistoryDetailsResponse;

      msgCount.value = _bookingResponse.value.bookingDetailsResponse.value.allUnread ?? 0;
      print("message count::::::::::${msgCount.value}");
      if (_bookingResponse.value.bookingDetailsResponse.value.supplier?.latitude != null && _bookingResponse.value.bookingDetailsResponse.value.supplier?.longitude != null) {
        _initialPosition.value = LatLng(
          double.parse(_bookingResponse.value.bookingDetailsResponse.value.supplier!.latitude.toString()),
          double.parse(
            _bookingResponse.value.bookingDetailsResponse.value.supplier!.longitude.toString(),
          ),
        );

        mapController.value?.animateCamera(CameraUpdate.newLatLngZoom(_initialPosition.value, 18));
        _markers.value = Marker(markerId: const MarkerId("markerId"), position: _initialPosition.value);
      }
      print("driver id :::::::::: ${_bookingResponse.value.bookingDetailsResponse.value.driverId}");
      _bookingResponse.refresh();
    }
  }

  Future<void> _changeOrderStatusImpl({required String status, required String reservationId}) async {
    BookingStatusPayload payload = BookingStatusPayload(
      status: status.toString(),
      covers: _bookingResponse.value.bookingDetailsResponse.value.numberOfPerson,
      startTime: _bookingResponse.value.bookingDetailsResponse.value.startTime.toString(),
    );
    print(payload.toMap());
    Get.back();
    if (await ApiRepository.bookingStatusApi(payload.toMap(), reservationId: reservationId) ?? false) {
      _bookingResponse.update((_) {
        _?.isHasChanged = true;
        _?.bookingDetailsResponse.value.status = 21;
      });
      _bookingResponse.refresh();
      showCustomFlushBar(msg: "Booking canceled Successfully.");
    }
  }

  Future<void> changeOrderStatus({required String status, required String statusInfo, required String reservationId}) async {
    return await showYesNoDialogue(
        content: statusInfo,
        rejectedText: 'NO',
        confirmText: "YES",
        onConfirmation: () async => await _changeOrderStatusImpl(status: status, reservationId: reservationId),
        onRejected: () => Get.back());
  }

  void syncOrderListWithStatus() {
    Get.back(result: {"isHasChanged": _bookingResponse.value.isHasChanged, "count": msgCount.value, "isChatOpen": isChatOpen.value});
  }

  Map<String, dynamic> _getOrderStatus({required int orderStatus}) {
    return {
          14: {"color": MyColors.secondaryColor, "status": "Booking Confirmed", "icon": ImageConstants.icBooked},
          21: {"color": MyColors.red, "status": "Cancelled by User", "icon": ImageConstants.icRejected},
          2: {"color": MyColors.secondaryColor, "status": "Booking Confirmed", "icon": ImageConstants.icBooked},
          1: {"color": MyColors.yellowWarning, "status": "Pending", "icon": ImageConstants.icPendingBig},
          3: {"color": MyColors.red, "status": "Booking rejected", "icon": ImageConstants.icRejected},
        }[orderStatus] ??
        {"color": MyColors.yellowWarning, "status": "Booking pending", "icon": ImageConstants.icPendingBig};
  }

  Widget getOrderStatusWidget({required int orderStatus}) {
    if (orderStatus == 0) return SizedBox(height: 120.sp);
    return Column(
      children: [
        Image.asset(_getOrderStatus(orderStatus: orderStatus)['icon'], width: 90.sp, height: 90.sp),
        10.sp.verticalSpace,
        Text(
          _getOrderStatus(orderStatus: orderStatus)['status'],
          style: Theme.of(navigatorKey.currentState!.context)
              .grayCliff800
              .copyWith(color: _getOrderStatus(orderStatus: orderStatus)['color'], letterSpacing: .6, fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ],
    );
  }
}

class BookingDetailsWrapper {
  bool isHasChanged;
  Rx<BookingHistoryDetailsResponse> bookingDetailsResponse;

  BookingDetailsWrapper({required this.isHasChanged, required this.bookingDetailsResponse});
}
