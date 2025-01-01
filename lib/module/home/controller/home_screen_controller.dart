import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:multiple_image_and_videos_as_social_media/core/core.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/location_helper.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/cuisine_response_model.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/user_categories_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/user_categories_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/user_service_model_categories_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/user_service_model_response_categories_detail.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';

class HomeScreenController extends GetxController {
  RxInt typeIndex = RxInt(0);
  RxString address = RxString('');
  RxString? sessionToken;
  Rx<TextEditingController> searchLocationController = Rx(TextEditingController());
  RxList placeList = RxList([]);
  Rx<UserCategoriesResponseData> categoriesModel = Rx(UserCategoriesResponseData());
  RxList<Category> categoriesList = RxList([]);
  static const String PLACES_API_KEY = "AIzaSyDvWAIdS9qCIDYtDYkfzi9hFovmE8ENTss";
  RxDouble getLatitude = RxDouble(0.0);
  RxDouble getLongitude = RxDouble(0.0);
  RxString selectedEatIndex = RxString('');
  RxList<CuiSineResponse> cuiSineData = RxList([]);
  RxList<UserServiceResponse> userServiceData = RxList([]);

  final appController = Get.find<AppController>();

  @override
  void onInit() async {
    if (await StorageService.getKey(key: StorageConstants.userPrefAddress) != null) {
      address.value = await StorageService.getKey(key: StorageConstants.userPrefAddress) ?? '';
    }
    if (LocationHelper.lat.value == 0.0 && LocationHelper.lng.value == 0.0) {
      await LocationHelper().getCurrentPosition();
      await getAddressFromLatLng();
      await userCategoriesAPI();
    }
    searchLocationController.value.addListener(() {
      onChanged();
    });
    await getCuiSineCategoriesAPI();
    super.onInit();
  }

  Future<String?> getAddressFromLatLng() async {
    // await placemarkFromCoordinates(lat, long).then((placeMark) {
    //   Placemark place = placeMark[0];
    //   address.value = '${place.subLocality},${place.locality},${place.subAdministrativeArea},${place.administrativeArea},${place.postalCode},${place.country}';
    //   print("address ::::::: ${address.value}");
    // });
    print("LocationHelper.lat.value ::::::: ${LocationHelper.lat.value}, ${LocationHelper.lng.value}");
    List<Placemark> place = await placemarkFromCoordinates(LocationHelper.lat.value, LocationHelper.lng.value);

    address.value = '${place.reversed.last.subLocality},${place.reversed.last.locality},${place.reversed.last.administrativeArea},${place.reversed.last.postalCode},${place.reversed.last.country}';
    StorageService.setKey(key: StorageConstants.userPrefAddress, value: address.value);
    print("address ::::::: ${address.toString()}}");
    return address.value;
  }

  void getSearchLocation(String input) async {
    try {
      String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=$PLACES_API_KEY&sessiontoken=${sessionToken?.value}';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        placeList.value = data['predictions'];
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getLatLngFromPlaceId(String placeId) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$PLACES_API_KEY';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final location = data['result']['geometry']['location'];
      getLatitude.value = location['lat'];
      getLongitude.value = location['lng'];
      StorageService.setKey(key: StorageConstants.userPrefLat, value: getLatitude.value.toString());
      StorageService.setKey(key: StorageConstants.userPrefLng, value: getLongitude.value.toString());
    } else {
      throw Exception('Failed to load place details');
    }
  }

  onChanged() {
    if (sessionToken?.value == null) {
      sessionToken?.value = Uuid().v1();
    }
    getSearchLocation(searchLocationController.value.text);
  }

  userCategoriesAPI() async {
    UserCategoriesPayLoad payLoad = UserCategoriesPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
      currentLatitude: await StorageService.getKey(key: StorageConstants.userPrefLat),
      currentLongitude: await StorageService.getKey(key: StorageConstants.userPrefLng),
    );

    UserCategoriesResponseData? userCategoriesResponse = await ApiRepository.userCategoriesApi(bodyData: payLoad);
    if (userCategoriesResponse != null) {
      categoriesModel.value = userCategoriesResponse;
      categoriesList.value = userCategoriesResponse.category ?? [];
      print("userCategoriesResponse:::::::::: ${categoriesModel.value.userUnread}");
    } else {
      print("fail to fetch data");
    }
  }

  getCuiSineCategoriesAPI() async {
      var cuiSineResponse = await ApiRepository.cuisineCategoriesApi();
      if (cuiSineResponse != null) {
        cuiSineData.value = cuiSineResponse;
      } else {
        print("fail to fetch data");
      }
  }

  /// Categories Detail
  userServiceAPI({String? supplier, String? id}) async {
    UserServicePayLoad payLoad = UserServicePayLoad(
      order: "DESC",
      sortBy: "rate",
      category: id,
      supplier: supplier,
    );

    var userServiceResponse = await ApiRepository.userServiceApi(bodyData: payLoad);
    if (userServiceResponse != null) {
      userServiceData.value = userServiceResponse;
    } else {
      print("fail to fetch data");
    }
  }
}
