import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/feed.dart';
import '../../core/core.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.rawSnackbar(
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 16.sp,
          messageText: CommonWidgets.customTextView(text: "PLEASE CONNECT TO THE INTERNET", color: MyColors.white, fontSize: MyFonts.fonts14, fontWeight: FontWeight.normal),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon: Icon(Icons.wifi_off, color: Colors.white, size: 25.sp),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}

class ConnectivityChecker {
  Future<bool> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.mobile)) {
      Console.debug("Device connected with internet");
      return true;
    } else {
      Console.debug("Device not connected with internet");
      return false;
    }
  }
}
