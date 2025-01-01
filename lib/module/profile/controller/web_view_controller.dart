import 'package:get/get.dart';

class ShowWebViewController extends GetxController {
  String url = '';
  RxBool isLoading = RxBool(true);

  ShowWebViewController(this.url);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
