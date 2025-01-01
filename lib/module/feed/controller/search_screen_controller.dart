import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_image_and_videos_as_social_media/app_controller/controller.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/user_search_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/user_search_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/follow-unfollow/follow_add_user_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/follow-unfollow/user_follow_add_supplier_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';

class SearchScreenController extends GetxController {
  final appController = Get.find<AppController>();
  Rx<TextEditingController> searchController = Rx<TextEditingController>(TextEditingController());
  RxList<UserSearchResponse> userList = RxList([]);
  Timer? _debounce;

  /// search user
  onSearchUser(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      userSearchListAPI(value: value);
    });
  }

  userSearchListAPI({required String value}) async {
    UserSearchPayLoad payLoad = UserSearchPayLoad(
      userId: appController.loginResponse.value.userId.toString(),
      search: value,
    );

    var searchResponse = await ApiRepository.userSearchApi(bodyData: payLoad);
    if (searchResponse != null) {
      userList.value = searchResponse;
      userList.refresh();
    } else {
      if (kDebugMode) {
        print("fail to get user activity data list");
      }
    }
  }

  /// ADD FOLLOW SUPPLIER API
  addFollowSupplierAPI(int index) async {
    UserFollowAddSupplierPayLoad payLoad = UserFollowAddSupplierPayLoad(
      follow: userList[index].isFollow == 0 ? 1 : 0,
      followingId: "${appController.loginResponse.value.userId}",
      supplierId: "${userList[index].userId}",
    );

    var addFollowingResponse = await ApiRepository.addFollowSupplierApi(payLoad);

    if (addFollowingResponse?.responseData != null) {
      await userSearchListAPI(value: searchController.value.text);
      print("Success:::::::::::: ${addFollowingResponse?.responseData}");
    } else {
      print("Failed to follow/unfollow supplier.");
    }
  }

  /// ADD FOLLOW USER CONSUMER API
  addFollowUserAPI({required int index}) async {
    UserFollowAddUserPayLoad payLoad = UserFollowAddUserPayLoad(
      follow: "${userList[index].isFollow}" == "0" ? "1" : "0",
      followerId: "${appController.loginResponse.value.userId}",
      followingId: "${userList[index].userId}",
    );

    var addFollowingResponse = await ApiRepository.addFollowUserApi(payLoad);
    if (addFollowingResponse?.responseData != null) {
      await userSearchListAPI(value: searchController.value.text);
      print("SUCCESS@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    }
  }

  @override
  void onClose() {
    _debounce?.cancel();
    searchController.value.dispose();
    super.onClose();
  }
}
