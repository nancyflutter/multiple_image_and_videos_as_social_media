import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import '/core/core.dart';

Future<void> showYesNoDialogue({required String content, required String rejectedText, required String confirmText, VoidCallback? onRejected, VoidCallback? onConfirmation}) async {
  BuildContext context = navigatorKey.currentState!.context;
  return showDialog(
    context: navigatorKey.currentState!.context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                content,
                style: Theme.of(context).grayCliff400.copyWith(fontSize: 16.sp),
              ),
              20.sp.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    rejectedText,
                    style: Theme.of(context).grayCliff400.copyWith(color: MyColors.secondaryColor),
                  ).addGesture(() => onRejected?.call()),
                  30.sp.horizontalSpace,
                  Text(
                    confirmText,
                    style: Theme.of(context).grayCliff400.copyWith(color: MyColors.secondaryColor),
                  ).addGesture(() => onConfirmation?.call()),
                ],
              )
            ],
          ),
        ).paddingAll(20.sp),
      );
    },
  );
}
