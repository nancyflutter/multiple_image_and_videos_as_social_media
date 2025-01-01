import 'package:flutter/foundation.dart';
import '../../core/core.dart';

class ApiEndPoints extends GetxService {
  ApiEndPoints({required ReleaseMode releaseMode}) {
    setBaseUrl(releaseMode);
  }

  static String baseUrl = "http://178.62.125.124/test/api/"; // Wander
  static String baseUrl2 = "http://178.62.125.124:8081/api/"; // Wander
  static String postBaseUrl = "http://178.62.125.124:4002/api/post/"; // Wander
  static String apiBaseUrl = "http://178.62.125.124:4002/api/"; // Wander

  static String imageBaseUrl = "http://178.62.125.124"; //Wander
  static String secureImageBaseUrl = "https://www.staging.appwander.com/test/social_media/public/media/"; //Wander

  static const String proImageBase = "http://www.staging.appwander.com/upload/supplier/"; // Wander

  void setBaseUrl(ReleaseMode releaseMode) {
    if (releaseMode == ReleaseMode.local) {
      baseUrl = "http://178.62.125.124/test/api/"; // Wander
      //baseUrl = "https://staging.appwander.com/test/api/"; // Wander
    } else if (releaseMode == ReleaseMode.live) {
      baseUrl = "http://178.62.125.124/test/api/"; // Wander
      //baseUrl = "https://staging.appwander.com/test/api/"; // Wander
    }
    if (kDebugMode) {
      print("BaseUrl : $baseUrl");
    }
  }

  static const String loginUrl = "user_account/Login";
  static const String signUpUrl = "user_account/Signup";
  static const String userProfileUrl = "user_account/GetProfile";
  static const String forgotPasswordUrl = "user_account/Forgot-password";
  static const String editProfileUrl = "user_account/EditProfile";
  static const String getCuisineListUrl = "http://178.62.125.124:8081/api/cusions/list";
  static const String getBadgeListUrl = "badge/list";
  static const String userCategoriesUrl = "user/category";
  static const String userServiceUrl = "user/service";
  static const String getBookMarkList = "bookmark/list";
  static const String userServiceDetailUrl = "user/service-detail";
  static const String coinMyHistoryUrl = "coin/myhistory";
  static const String addBookMarkUrl = "bookmark/add";
  static const String userAccountGetProfileUrl = "user_account/GetProfile";
  static const String commentSupplierServiceProfileUrl = "user/service-profile/";
  static const String getPostsUrl = "get_posts";
  static const String getPostCommentUrl = "get_comments";
  static const String addCommentUrl = "comment";
  static const String addLikeUrl = "like";
  static const String postDeleteUrl = "delete_post";
  static const String reportPostUrl = "report";
  static const String userSearchUrl = "users/search";
  static const String userActivityListUrl = "user/activity/list";
  static const String bookmarkServiceDetailUrl = "user/service-profile/";
  static const String usersFollowerUrl = "users/get_followers";
  static const String usersFollowingUrl = "users/get_following";
  static const String getBookingServiceUrl = "user/get_front_image_service";
  static const String followAddSupplierUrl = "user/follow/add_supplier_follow";
  static const String followAddUserUrl = "user/follow/add_user_follow";
  static const String bookmarkRestaurantsDetailUrl = "restaurants/restaurent-details/";
  static const String getSimilarRestaurants = "restaurants/get-similar-restaurant";
  static const String usersTagSearchUrl = "users/tag_search";
  static const String postDetailsUrl = "post/details";
  static const String checkAvailabilityStatus = "restaurants/check-availability-status";
  static const String countRestaurantTax = "user/count-restaurant-tax";
  static const String createReservation = "restaurants/create-reservation";
  static const String getRestaurantBookingDetail = "https://staging.appwander.com/test/api/user/booking-detail";
  static const String getRestaurantsList = "restaurants/new/list";
  static const String defaultPage = "?page=1";
  //static const String getBooking = "https://staging.appwander.com/test/api/user/booking-history";
  static const String getBooking = "user/booking-history";
  //static const String bookingDetails = "https://staging.appwander.com/test/api/user/booking-detail";
  static const String bookingDetails = "user/booking-detail";
  static const String getSupplierFollowersByUserUrl = "users/get_supplier_followers_by_user";
  static const String cancelReservation = "restaurants/cancel-reservation/";
}
