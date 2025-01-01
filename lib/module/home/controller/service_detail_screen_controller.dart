import 'package:flutter/foundation.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/location_helper.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/user_service_detail/user_service_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';
import '../../../core/core.dart';

class ServiceDetailScreenController extends GetxController {
  RxInt currentIndex = RxInt(0);
  RxBool isReadMore = RxBool(false); // Add this line
  Rx<GetUserServiceDetailResponse> userDetailServiceData = Rx(GetUserServiceDetailResponse());
  RxList<Post> postData = RxList([]);
  RxList<String> serviceImage = RxList([]);
  RxList<Marker> markers = RxList<Marker>([]);
  final appController = Get.find<AppController>();

  //<Marker>[];

  //late GoogleMapController mapController;

  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);

  //final LatLng center = const LatLng(45.521563, -122.677433);
  Rx<LatLng> serviceLocationLatLng = Rx(LatLng(
    LocationHelper.lat.value,
    LocationHelper.lng.value,
  ));

  void onMapCreated(GoogleMapController controller) {
    if (kDebugMode) {
      print("serviceLocationLatLng ::::::::: ${serviceLocationLatLng.value}");
    }
    mapController.value = controller;
    mapController.value?.animateCamera(CameraUpdate.newLatLngZoom(serviceLocationLatLng.value, 14));
  }

  RxBool showElevation = RxBool(false);
  ScrollController scrollController = ScrollController();

  RxString id = RxString("");

  void toggleReadMore() {
    isReadMore.value = !isReadMore.value;
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.arguments != null) {
        bookmarkServiceDetailApi(Get.arguments['bookServiceId']?.toString() ?? "");
      }
      if (Get.arguments != null) {
        bookmarkServiceDetailApi(Get.arguments['userId']?.toString() ?? "");
      }
      if (Get.arguments != null) {
        bookmarkServiceDetailApi(Get.arguments['supplierId']?.toString() ?? "");
      }
    });
    super.onInit();
    id.value = Get.arguments['userId']?.toString() ?? Get.arguments['supplierId']?.toString() ?? Get.arguments['bookServiceId']?.toString() ?? "";
    scrollController.addListener(() {
      if (scrollController.position.pixels >= 268.sp) {
        if (!showElevation.value) {
          showElevation.value = true;
        }
      } else {
        if (showElevation.value) {
          showElevation.value = false;
        }
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  bookmarkServiceDetailApi(String bookmarkServiceId) async {
    if (bookmarkServiceId != "" && bookmarkServiceId.isNotEmpty) {
      GetUserServiceDetailResponse? getUserServiceDetailResponse = await ApiRepository.bookmarkServiceDetailApi(bookmarkServiceId: bookmarkServiceId);
      if (getUserServiceDetailResponse != null) {
        userDetailServiceData.value = getUserServiceDetailResponse;
        postData.value = getUserServiceDetailResponse.posts ?? [];

        /// for image
        if (userDetailServiceData.value.image != null) {
          for (int i = 0; i < (userDetailServiceData.value.image?.length ?? 0); i++) {
            serviceImage.add('${ApiEndPoints.imageBaseUrl}/${userDetailServiceData.value.image?[i]}');
          }
        }

        ///for location
        if (userDetailServiceData.value.detail?.latitude != null && userDetailServiceData.value.detail?.longitude != null) {
          setAndAddMarker(
              latLng: LatLng(
            double.parse(userDetailServiceData.value.detail?.latitude ?? ''),
            double.parse(userDetailServiceData.value.detail?.longitude ?? ''),
          ));
        } else {
          setAndAddMarker(
              latLng: LatLng(
            LocationHelper.lat.value,
            LocationHelper.lng.value,
          ));
        }
        userDetailServiceData.refresh();
        update();
      }
    }
  }

  /// ADD FOLLOW SUPPLIER API
  addFollowSupplierAPI() async {
    String? supplierId = Get.arguments['userId'] ?? Get.arguments['supplierId'] ?? Get.arguments['bookServiceId'];

    UserFollowAddSupplierPayLoad payLoad = UserFollowAddSupplierPayLoad(
      follow: userDetailServiceData.value.follwing == 0 ? 1 : 0,
      followingId: "${appController.loginResponse.value.userId}",
      supplierId: supplierId,
    );

    var addFollowingResponse = await ApiRepository.addFollowSupplierApi(payLoad);

    if (addFollowingResponse?.responseData != null) {
      await bookmarkServiceDetailApi(supplierId!);
      if (kDebugMode) {
        print("Success:::::::::::: ${addFollowingResponse?.responseData}");
      }
    } else {
      if (kDebugMode) {
        print("Failed to follow/unfollow supplier.");
      }
    }
  }

  setAndAddMarker({
    required LatLng latLng,
  }) {
    serviceLocationLatLng.value = latLng;
    mapController.value?.animateCamera(CameraUpdate.newLatLngZoom(serviceLocationLatLng.value, 14));
    markers.add(
      Marker(markerId: const MarkerId('marker'), position: serviceLocationLatLng.value),
    );
  }

  /// ADD BOOKMARK API
  addBookMarkAPI({required String id}) async {
    AddBookMarkPayLoad payLoad = AddBookMarkPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
      bookmarkId: id,
      bookmarkType: "supplier",
    );

    var addBookMarkResponse = await ApiRepository.addBookMarkApi(payLoad);
    if (addBookMarkResponse != null) {
      await bookmarkServiceDetailApi(id.toString());
      Get.put<FavouritesScreenController>(FavouritesScreenController());
      final cnt = Get.find<FavouritesScreenController>();
      await cnt.getBookMarksList();
    } else {
      if (kDebugMode) {
        print("fail implementation");
      }
    }
  }
}
