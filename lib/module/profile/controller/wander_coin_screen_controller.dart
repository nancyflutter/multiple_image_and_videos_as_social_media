import 'package:get/get.dart';
import 'package:multiple_image_and_videos_as_social_media/app_controller/app_controller.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/coin_my_history_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/coin_my_history_response.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';

class WanderCoinScreenController extends GetxController {
  RxString abc = RxString('abc');
  final appController = Get.find<AppController>();
  Rx<CoinMyHistoryResponse> coinHistoryData = Rx(CoinMyHistoryResponse());
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  myCoinHistoryAPI() async {
    isLoading.value = true;
    CoinMyHistoryPayLoad payLoad = CoinMyHistoryPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
    );

    CoinMyHistoryResponse? coinMyHistoryResponse = await ApiRepository.coinHistoryApi(bodyData: payLoad);
    if (coinMyHistoryResponse != null) {
      coinHistoryData.value = coinMyHistoryResponse;
      isLoading.value = false;
    } else {
      print("fail to fetch data");
    }
  }
}
