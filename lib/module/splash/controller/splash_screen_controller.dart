import 'package:get/get.dart';
import '../../../core/routes/routes.dart';

class SplashScreenController extends GetxController {
  RxString splash = RxString('Splash');

  @override
  void onInit() async {
    if (await StorageService.getKey(key: StorageConstants.userPrefAddress) != null) {
      StorageService.removeKey(key: StorageConstants.userPrefAddress);
    }
    if (await StorageService.getKey(key: StorageConstants.userPrefLng) != null) {
      StorageService.removeKey(key: StorageConstants.userPrefLng);
    }
    if (await StorageService.getKey(key: StorageConstants.userPrefLat) != null) {
      StorageService.removeKey(key: StorageConstants.userPrefLat);
    }
    super.onInit();
  }
}
