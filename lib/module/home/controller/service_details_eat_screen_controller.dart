import 'package:flutter/foundation.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/location_helper.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/add_bookmark_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurants_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_similar_restaurants_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_similar_restaurants_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/pass_restaurant_detail_model.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';
import '../../../core/core.dart';

class ServiceDetailsEatScreenController extends GetxController {
  RxString abc = RxString('abc');
  RxBool isReadMore = RxBool(false);
  RxBool showAll = RxBool(false);
  Rx<GetRestaurantsDetailResponse> getRestaurantDetailData = Rx(GetRestaurantsDetailResponse());
  Rx<PassRestaurantDetailModel> passRestaurantDetail = Rx(PassRestaurantDetailModel());
  RxList<GetSimilarRestaurantsDetailResponse> similarRestaurantData = RxList([]);
  RxList<String> serviceImage = RxList([]);
  RxList<Marker> markers = RxList<Marker>([]);
  final appController = Get.find<AppController>();
  RxInt currentPage = RxInt(1);
  RxBool isNextPage = RxBool(false);
  RxList<String> featuresList = RxList([]);
  RxInt currentIndex = RxInt(0);
  RxBool showElevation = RxBool(false);
  ScrollController scrollController = ScrollController();
  Rx<ScrollController> similarResScrollController = Rx(ScrollController());
  Rx<ScrollController> goToTopScrollController = Rx(ScrollController());
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  RxList<String> operatingHours = RxList([]);
  Rx<String> regionId = RxString('');
  Rx<String> restaurantId = RxString('');
  RxList<String> restaurantIdList = RxList([]);
  RxBool showVerifiedOpen = RxBool(true);

  //RxMap<String, dynamic> restaurantDetails = RxMap({});
  //final LatLng center = const LatLng(45.521563, -122.677433);
  Rx<LatLng> serviceLocationLatLng = Rx(LatLng(
    LocationHelper.lat.value,
    LocationHelper.lng.value,
  ));

  void onMapCreated(GoogleMapController controller) {
    print("serviceLocationLatLng ::::::::: ${serviceLocationLatLng.value}");
    mapController.value = controller;
    mapController.value?.animateCamera(CameraUpdate.newLatLngZoom(serviceLocationLatLng.value, 14));
  } // Add this line

  RxList<String> dayList = RxList([
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ]);

  void toggleReadMore() {
    isReadMore.value = !isReadMore.value;
  }

  manageNestedBackForSimilarRestaurant() {
    scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(seconds: 2), curve: Curves.linearToEaseOut);
    similarResScrollController.value.animateTo(similarResScrollController.value.position.minScrollExtent, duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn);
    bookmarkRestaurantDetailApi(restaurantIdList[restaurantIdList.length - 2]);
    restaurantIdList.remove(restaurantIdList[restaurantIdList.length - 2]);
    restaurantIdList.refresh();
  }

  manageNestedGoToSimilarRestaurant(int index) {
    restaurantIdList.add(similarRestaurantData[index].id ?? '');
    scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(seconds: 2), curve: Curves.linearToEaseOut);
    similarResScrollController.value.animateTo(similarResScrollController.value.position.minScrollExtent, duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn);
    bookmarkRestaurantDetailApi(similarRestaurantData[index].id ?? '');
  }

  bookmarkRestaurantDetailApi(String bookmarkRestaurantId) async {
    if (bookmarkRestaurantId != "" && bookmarkRestaurantId.isNotEmpty) {
      GetRestaurantsDetailResponse? getRestaurantsDetailResponse = await ApiRepository.bookmarkRestaurantsDetailApi(
        bookmarkRestaurantsId: bookmarkRestaurantId,
        userId: appController.loginResponse.value.userId ?? '',
      );
      if (getRestaurantsDetailResponse != null) {
        getRestaurantDetailData.value = getRestaurantsDetailResponse;
        regionId.value = getRestaurantDetailData.value.attributes?.regionId ?? '';
        restaurantId.value = getRestaurantDetailData.value.id ?? '';
        getSimilarRestaurants(restaurantId: restaurantId.value, cuisineId: regionId.value);
        passRestaurantDetail.value = PassRestaurantDetailModel(
            restaurantId: getRestaurantDetailData.value.id ?? '',
            restaurantName: getRestaurantDetailData.value.attributes?.name ?? '',
            restaurantImage: getRestaurantDetailData.value.attributes?.imageUrl ?? '',
            restaurantAddress: '${getRestaurantDetailData.value.attributes?.addressLine1}${getRestaurantDetailData.value.attributes?.addressLine2}${getRestaurantDetailData.value.attributes?.city}',
            latRestaurant: getRestaurantDetailData.value.attributes?.latitude ?? 0.0,
            lngRestaurant: getRestaurantDetailData.value.attributes?.longitude ?? 0.0,
            restaurantDescription: getRestaurantDetailData.value.attributes?.description ?? '',
            termsAndConditions: getRestaurantDetailData.value.attributes?.termsAndConditions,
            isForm: 1);

        /// for image
        if (getRestaurantDetailData.value.attributes?.imageUrls != null) {
          if (serviceImage.isNotEmpty) {
            serviceImage.clear();
          }
          for (int i = 0; i < (getRestaurantDetailData.value.attributes?.imageUrls?.length ?? 0); i++) {
            serviceImage.add('${getRestaurantDetailData.value.attributes?.imageUrls?[i]}');
          }
        }

        /// for features
        if (getRestaurantDetailData.value.attributes != null) {
          featuresList.clear(); // Clear previous data

          // Add features based on attributes
          if (getRestaurantDetailData.value.attributes?.alcohol == true) {
            featuresList.add("Serves alcohol");
          }
          if (getRestaurantDetailData.value.attributes?.valet == true) {
            featuresList.add("Valet parking available");
          }
          if (getRestaurantDetailData.value.attributes?.smoking == true) {
            featuresList.add("Smoking allowed");
          }
          if (getRestaurantDetailData.value.attributes?.outdoorSeating == true) {
            featuresList.add("Outdoor seating");
          }

          // Add 'Good For' features
          if (getRestaurantDetailData.value.attributes?.goodFor != null && getRestaurantDetailData.value.attributes?.goodFor?.isNotEmpty == true) {
            featuresList.addAll(getRestaurantDetailData.value.attributes?.goodFor ?? []);
          }

          // Add attire information
          if (getRestaurantDetailData.value.attributes?.attire != null && getRestaurantDetailData.value.attributes?.attire?.isNotEmpty == true) {
            featuresList.add(getRestaurantDetailData.value.attributes?.attire ?? '');
          }

          // Add payment options
          if (getRestaurantDetailData.value.attributes?.payments != null && getRestaurantDetailData.value.attributes?.payments?.isNotEmpty == true) {
            featuresList.addAll(getRestaurantDetailData.value.attributes?.payments ?? []);
          }

          // Add labels
          if (getRestaurantDetailData.value.attributes?.labels != null && getRestaurantDetailData.value.attributes!.labels!.isNotEmpty) {
            for (String label in getRestaurantDetailData.value.attributes?.labels ?? []) {
              featuresList.add(label);
            }
          }
        }

        ///for location
        if (getRestaurantDetailData.value.attributes?.latitude != null && getRestaurantDetailData.value.attributes?.longitude != null) {
          setAndAddMarker(
            latLng: LatLng(
              getRestaurantDetailData.value.attributes?.latitude ?? 0.0,
              getRestaurantDetailData.value.attributes?.longitude ?? 0.0,
            ),
          );
        } else {
          setAndAddMarker(
              latLng: LatLng(
            LocationHelper.lat.value,
            LocationHelper.lng.value,
          ));
        }

        ///for opening hours
        if (getRestaurantDetailData.value.attributes?.operatingHours != null) {
          var opHours = getRestaurantDetailData.value.attributes?.operatingHours?.split(';');
          if (opHours?.isNotEmpty ?? false) {
            if (operatingHours.isNotEmpty) {
              operatingHours.clear();
            }
            for (int i = 0; i < (opHours?.length ?? 0); i++) {
              operatingHours.add(opHours?[i] ?? '');
            }
          }
        }
        getRestaurantDetailData.refresh();
        update();
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

  getSimilarRestaurants({required String restaurantId, required String cuisineId}) async {
    if (currentPage.value == 0) return;
    GetSimilarRestaurantsPayload payload = GetSimilarRestaurantsPayload(
      restaurantId: restaurantId,
      cuisineId: cuisineId,
    );
    var res = await ApiRepository.getSimilarRestaurantsApi(
      page: currentPage.value.toString(),
      bodyData: payload,
    );
    if (res != null && res.isNotEmpty) {
      isNextPage.value = true;
      similarRestaurantData.addAll(res);
      currentPage.value++;
    } else {
      isNextPage.value = false;
      currentPage.value = 0;
    }
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.arguments['bookRestaurantId'] != null) {
        restaurantIdList.add(Get.arguments['bookRestaurantId']);
        bookmarkRestaurantDetailApi(Get.arguments['bookRestaurantId']);
        similarResScrollController.value.addListener(() {
          if (similarResScrollController.value.position.pixels == similarResScrollController.value.position.maxScrollExtent) {
            getSimilarRestaurants(restaurantId: restaurantId.value, cuisineId: regionId.value);
          }
        });
      }
    });

    super.onInit();
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

      if (scrollController.position.pixels >= 200.sp) {
        if (showVerifiedOpen.value) {
          showVerifiedOpen.value = false;
        }
      } else {
        if (!showVerifiedOpen.value) {
          showVerifiedOpen.value = true;
        }
      }
    });
  }

  /// ADD BOOKMARK API
  addBookMarkAPI({required String id}) async {
    AddBookMarkPayLoad payLoad = AddBookMarkPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
      bookmarkId: id,
      bookmarkType: "restaurant",
    );

    var addBookMarkResponse = await ApiRepository.addBookMarkApi(payLoad);
    if (addBookMarkResponse != null) {
      bookmarkRestaurantDetailApi(restaurantId.toString());
      Get.put<FavouritesScreenController>(FavouritesScreenController());
      final cnt = Get.find<FavouritesScreenController>();
      await cnt.getBookMarksList();
    } else {
      if (kDebugMode) {
        print("Fail implementation");
      }
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    similarResScrollController.value.dispose();
    super.onClose();
  }
}
