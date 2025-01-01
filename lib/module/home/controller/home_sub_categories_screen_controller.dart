import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/storage/storage_constants.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/storage/storage_service.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/cuisine_response_model.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/home_sub_eat_categories_filter_model.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurant_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurants_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/user_service_model_categories_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/user_service_model_response_categories_detail.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';

class HomeSubCategoriesScreenController extends GetxController {
  RxString abc = RxString('');
  Rx<TextEditingController> searchController = Rx<TextEditingController>(TextEditingController());
  RxBool isSearching = RxBool(false);
  RxBool isLoading = RxBool(false);
  RxString appBarTitle = RxString("Restaurants in Dubai");
  RxString title = RxString("");
  RxString id = RxString("");
  RxString supplier = RxString("");
  RxInt currentPage = RxInt(1);
  RxMap<String, bool> selectedCuisines = RxMap({});
  RxMap<String, bool> selectedLabels = RxMap({});
  RxMap<String, bool> selectedFoodTypes = RxMap({});
  RxMap<String, bool> selectedPrices = RxMap({});
  RxList<CuiSineResponse> cuisineData = RxList([]);
  RxBool showMoreCuisines = RxBool(false);
  RxBool showMoreLabels = RxBool(false);
  RxList<RestaurantDetails> getRestaurantList = RxList([]);
  Rx<GetRestaurantsResponse> getRestaurantData = Rx(GetRestaurantsResponse());
  Timer? _debounce;

  RxList<UserServiceResponse> userServiceData = RxList([]);

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.arguments['supplier'] != null && Get.arguments['id'] != null) {
        title.value = Get.arguments['title'];
        id.value = Get.arguments['id'].toString();
        supplier.value = Get.arguments['supplier'];
        userServiceAPI(supplier: supplier.value, id: id.value);
      }
      if (Get.arguments['cuisineID'] != null) {
        getRestaurantListApi(cuisineId: Get.arguments['cuisineID']);
      }
    });

    super.onInit();
  }

  /// Categories Detail
  userServiceAPI({String? supplier, String? id}) async {
    UserServicePayLoad payLoad = UserServicePayLoad(
      order: "DESC",
      sortBy: "rate",
      category: id,
      supplier: supplier,
    );

    var res = await ApiRepository.userServiceApi(bodyData: payLoad);

    if (res != null) {
      userServiceData.value = res;
    }
  }


  onSearchUser(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      getRestaurantListApi(searchText: value);
      // FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  getRestaurantListApi({String? cuisineId, String? goodFor, String? priceLevel, String? foodType, String? searchText, bool isBack = false}) async {
    isLoading.value = true;
    GetRestaurantsPayload? getRestaurantsPayload = GetRestaurantsPayload(
      latitude: await StorageService.getKey(key: StorageConstants.userPrefLat),
      longitude: await StorageService.getKey(key: StorageConstants.userPrefLng),
    );

    GetRestaurantsResponse? getRestaurantsResponse = await ApiRepository.getRestaurantList(
      bodyData: getRestaurantsPayload,
      cuisineId: cuisineId ?? '',
      goodFor: goodFor ?? '',
      priceLevel: priceLevel ?? '',
      foodType: foodType ?? '',
      page: currentPage.value.toString(),
      searchText: searchText ?? '',
    );

    if (getRestaurantsResponse != null) {
      getRestaurantData.value = getRestaurantsResponse;
      getRestaurantList.value = getRestaurantData.value.data ?? [];
      if(isBack){
        Get.back();
      }
    }
    isLoading.value = false;
  }

  RxList<FilterRestaurant> cuisine = RxList([]);
  RxList<FilterRestaurant> label = RxList([
    FilterRestaurant(
      id: "1",
      name: "Good for Groups",
    ),
    FilterRestaurant(
      id: "2",
      name: "Good for Family",
    ),
    FilterRestaurant(
      id: "3",
      name: "Good for Couple",
    ),
    FilterRestaurant(
      id: "4",
      name: "Romantic",
    ),
    FilterRestaurant(
      id: "5",
      name: "Fun",
    ),
    FilterRestaurant(
      id: "6",
      name: "Great Services",
    ),
    FilterRestaurant(
      id: "7",
      name: "Quick Bites",
    ),
    FilterRestaurant(
      id: "8",
      name: "Vegan Friendly",
    ),
    FilterRestaurant(
      id: "9",
      name: "Good for Birthdays",
    ),
    FilterRestaurant(
      id: "10",
      name: "Upscale",
    ),
    FilterRestaurant(
      id: "11",
      name: "Live Music",
    ),
    FilterRestaurant(
      id: "12",
      name: "Special Occasion",
    ),
  ]);
  RxList<FilterRestaurant> foodTypes = RxList([
    FilterRestaurant(
      id: "1",
      name: "Breakfast",
    ),
    FilterRestaurant(
      id: "2",
      name: "Lunch",
    ),
    FilterRestaurant(
      id: "3",
      name: "Brunch",
    ),
    FilterRestaurant(
      id: "4",
      name: "Dinner",
    ),
  ]);
  RxList<FilterRestaurant> prices = RxList([
    FilterRestaurant(
      id: "1",
      name: '\$',
    ),
    FilterRestaurant(
      id: "2",
      name: '\$\$',
    ),
    FilterRestaurant(
      id: "3",
      name: '\$\$\$',
    ),
  ]);

  getCuiSineCategoriesAPI() async {
    var cuiSineResponse = await ApiRepository.cuisineCategoriesApi();
    if (cuiSineResponse != null) {
      cuisineData.value = cuiSineResponse;
      for (int i = 0; i < cuisineData.length; i++) {
        cuisine.add(FilterRestaurant(
          id: cuisineData[i].cuisineId,
          name: cuisineData[i].cuisineName,
        ));
      }
    }
  }
}
