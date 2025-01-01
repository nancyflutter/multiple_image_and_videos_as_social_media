import 'package:get/get.dart';

import '../service.dart';

class ApiValidation {
  ApiValidation._();

  static validateResponse(ApiResponseModel? apiResponseModel, {bool showLoader = true}) {
    if ((apiResponseModel?.statusCode == 200 || apiResponseModel?.statusCode == 201) &&
        (apiResponseModel?.responseCode == "1" || apiResponseModel?.responseCode == "2")) {
      return true;
    }
    if (showLoader) AppLoader.removeLoader();
    caseByStatusCode(apiResponseModel);
  }

  static caseByStatusCode(ApiResponseModel? apiResponseModel) {
    if (apiResponseModel?.statusCode == 406) {
      if (apiResponseModel?.responseData is Map && apiResponseModel?.responseData.containsKey("errors")) {
        var errors = apiResponseModel?.responseData["errors"];
        if (errors is List) {
          String errorMessage = errors.join("\n");
          showDialogueAccordingResponse(errorMessage);
        } else {
          showDialogueAccordingResponse('An unknown validation error occurred.');
        }
      } else {
        showDialogueAccordingResponse(apiResponseModel?.responseText ?? "");
      }
    } else if (apiResponseModel?.statusCode == 998 || apiResponseModel?.statusCode == 499) {
      showDialogueAccordingResponse(apiResponseModel?.responseText ?? "");
    } else if (apiResponseModel?.statusCode == 500) {
      showDialogueAccordingResponse('Something went wrong');
    } else if (apiResponseModel?.statusCode == 498) {
      showDialogueAccordingResponse(apiResponseModel?.responseText ?? "", isBack: false);
    } else if (apiResponseModel?.statusCode == 200) {
      if (apiResponseModel?.responseCode == '2') {
        showDialogueAccordingResponse(apiResponseModel?.responseText ?? "");
      }
    }
  }

  static showDialogueAccordingResponse(String message, {bool isBack = true}) async {
    print("navigator key ::::::::::: ${navigatorKey.currentState}");
    BuildContext context = navigatorKey.currentState!.context;
    return showDialog(
      context: navigatorKey.currentState!.context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          insetAnimationCurve: Curves.slowMiddle,
          insetPadding: EdgeInsets.all(20.sp),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.sp)),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Wander Consumer",
                  style: Theme.of(context).grayCliff400.copyWith(fontSize: 20.sp),
                ),
                14.sp.verticalSpace,
                Text(
                  message,
                  style: Theme.of(context).grayCliff400.copyWith(fontSize: 16.sp, color: MyColors.hintColor),
                ),
                20.sp.verticalSpace,
                Text(
                  "Ok",
                  style: Theme.of(context).grayCliff400.copyWith(fontSize: 20.sp, color: MyColors.hintColor),
                ).addGesture(() {
                  isBack ? Get.back() : Get.find<AppController>().removeAllKeysAndLogout();
                }),
              ],
            ),
          ).paddingAll(10.sp),
        );
      },
    );
  }
}
