import 'package:multiple_image_and_videos_as_social_media/module/profile/controller/web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/core.dart';

class WebConditionScreen extends StatelessWidget {
  const WebConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(Get.arguments['Name'] ?? "", style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp)),
        leading: Icon(Icons.arrow_back_ios_new_outlined, color: MyColors.black, size: 20.sp).addGesture(() => Get.back(canPop: true, closeOverlays: true)),
      ),
      body: SafeArea(
        child: GetBuilder<ShowWebViewController>(
            init: ShowWebViewController(Get.arguments['url'] ?? ""),
            builder: (controller) {
              return Stack(
                children: [
                  WebViewWidget(
                    controller: WebViewController()
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..setBackgroundColor(const Color(0x00000000))
                      ..setNavigationDelegate(
                        NavigationDelegate(
                          onPageStarted: (String url) {
                            AppLoader.showLoader();
                            controller.isLoading.value = true;
                          },
                          onPageFinished: (String url) {
                            AppLoader.removeLoader();
                            controller.isLoading.value = false;
                          },
                          onWebResourceError: (WebResourceError error) {
                            print('Error occurred :::: ${error.description}');
                          },
                          onNavigationRequest: (NavigationRequest request) {
                            return NavigationDecision.navigate;
                          },
                        ),
                      )
                      ..loadRequest(Uri.parse(controller.url.toString())),
                  ),
                  // Obx(() {
                  //   if (controller.isLoading.value) {
                  //     AppLoader.showLoader();
                  //   } else {
                  //     AppLoader.removeLoader();
                  //   }
                  //   return const SizedBox();
                  // }),
                ],
              );
            }),
      ),
    );
  }
}
