import 'package:get/get.dart';
import '../../../app_controller/app_controller.dart';
import '../../../services/service.dart';
import '../model/booking_history_payload.dart';
import '../model/booking_history_response.dart';

class BookingHistoryScreenController extends GetxController {
  final appController = Get.find<AppController>();
  RxString abc = RxString('abc');

  RxBool loadMore = RxBool(false);
  final RxBool _isLoader = RxBool(false);
  final RxInt _currentPage = RxInt(1);
  late ScrollController scrollController;

  RxBool get getLoader => _isLoader;
  RxString get getDataMapVal => _dataMapVal;
  set setLoader(val) => _isLoader.value = val;
  final RxString _dataMapVal = RxString("bookings");
  String isInitialize = "isInitialize";
  final RxString nextPage = RxString("");

  late RxMap<String, dynamic> bookingResponse = RxMap<String, dynamic>({
    isInitialize: false,
    _dataMapVal.value: RxList<BookingHistoryData>([]),
  });

  @override
  void onInit() {
    super.onInit();
    MountedCallbackExecutor.ensureIsThatMounted(() => _getBookings());
  }

  void scrollListener() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
      _getBookings(fromPagination: true);
    }
  }

  Future _getBookings({bool fromPagination = false}) async {
    print(":::::::::::::::::::::::::::::::::: $fromPagination");
    if (_currentPage.value != 0) {
      if (fromPagination) [loadMore.value = true];
      if (!fromPagination) [bookingResponse[isInitialize] = false, bookingResponse.refresh()];
      BookingHistoryPayLoad getBookingPayload = BookingHistoryPayLoad(userId: appController.loginResponse.value.userId.toString());

      BookingHistoryResponseData? getBookingResponse = await ApiRepository.getBookingsApi(getBookingPayload.toMap(), page: "?page=$_currentPage", showLoader: !fromPagination);

      if (getBookingResponse != null) {
        [bookingResponse[isInitialize] = true, bookingResponse.refresh()];
        nextPage.value = getBookingResponse.nextPageUrl ?? "";
        getBookingResponse.data?.isNotEmpty ?? false ? _currentPage.value++ : _currentPage.value = 0;
        if (fromPagination) {
          bookingResponse[_dataMapVal.value].addAll(getBookingResponse.data ?? []);
          if (fromPagination) loadMore.value = false;
        } else {
          bookingResponse[_dataMapVal.value].value = getBookingResponse.data ?? [];
        }
      }
      bookingResponse.refresh();
    }
  }

  Future syncOrderListWithStatus() async {
    _currentPage.value = 1;
    await _getBookings(fromPagination: false);
  }
}
