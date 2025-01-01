import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:multiple_image_and_videos_as_social_media/core/core.dart';

class LocationHelper {
  final isFetchingLocation = false.obs;
  static Rx<double> lat = RxDouble(0.0);
  static Rx<double> lng = RxDouble(0.0);

  Future<void> getCurrentPosition() async {
    print("call first");
    final hasPermission = await _handleLocationPermission();
    if (hasPermission) {
      isFetchingLocation.value = true;
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((position) {
        debugPrint('POSITION---::::::::::::::$position');
        lat.value = position.latitude;
        lng.value = position.longitude;
        StorageService.setKey(key: StorageConstants.userPrefLat, value: lat.value.toString());
        StorageService.setKey(key: StorageConstants.userPrefLng, value: lng.value.toString());
      }).catchError((e) {
        isFetchingLocation.value = false;
        debugPrint('------> ${e.toString()}');
      });
    } else {
      isFetchingLocation.value = false;
      return debugPrint('No Permission Granted');
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      isFetchingLocation.value = false;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          isFetchingLocation.value = false;
          debugPrint('Location permissions are denied');
          return false;
        }
      }
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isFetchingLocation.value = false;
        debugPrint('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // locationPermissionSheet();
    }
    return true;
  }
}
