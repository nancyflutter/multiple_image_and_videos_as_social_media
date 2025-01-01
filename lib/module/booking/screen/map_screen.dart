import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/core.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: MapScreenController(),
      builder: (controller) {
        controller.abc.value;
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Map",
              style: Theme.of(context).grayCliff600.copyWith(
                fontSize: 16.sp,
              ),
            ),
            leading: Image.asset(
              scale: 3,
              ImageConstants.iconBack,
            ).addGesture(
                  () {
                Get.back();
              },
            ),
          ),
          body: GoogleMap(
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: CameraPosition(
              target: controller.center,
              zoom: 11.0,
            ),
          ),
        );
      },
    );
  }
}
