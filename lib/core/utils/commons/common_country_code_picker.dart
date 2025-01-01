import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../module/login/login.dart';
import '../../core.dart';

showNewCountryCodeDialog(BuildContext context) {
  return SizedBox(
    height: 700.sp,
    width: double.maxFinite,
    child: GetX<SignupScreenController>(
      init: SignupScreenController(),
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50.sp,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Search country here...",
                  filled: true,
                  fillColor: MyColors.materialScaffoldBackground,
                  labelStyle: TextStyle(color: MyColors.appTxtColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
                  enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(8.sp), borderSide: BorderSide(color: MyColors.secondaryColor)),
                  focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(8.sp), borderSide: BorderSide(color: Colors.red)),
                ),
                onChanged: (value) {
                  controller.filterItem(value ?? "");
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.foundItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Console.debug(controller.foundItems[index], key: "selected country data");
                      controller.selectedCountry.value = controller.foundItems[index];
                      controller.mobileNumberController.value.clear();
                      // controller.formKeyPhone.currentState!.validate();
                      Get.back();
                      controller.resetCountryData();
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 10.sp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            controller.foundItems[index]["flag"],
                            style: TextStyle(fontSize: 25.sp),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Text(
                              controller.foundItems[index]["country_en"],
                              style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts16),
                            ),
                          ),
                          SizedBox(width: 5.sp),
                          Text(
                            "(+${controller.foundItems[index]["phone_code"]})",
                            style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts14),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    ),
  );
}
