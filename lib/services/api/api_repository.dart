import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/comment_detail_get_profile/comment_supplier_profile_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/comment_detail_get_profile/user_account_get_profile_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/comment_detail_get_profile/user_account_get_profile_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/notification_post_detail_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/notification_post_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/supplier_profile_follower_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/supplier_profile_follower_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/user_search_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/model/user_search_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/check_availability_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/count_restaurant_tax_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/count_restaurant_tax_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/create_reservation_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/create_reservation_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_availability_status_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurant_booking_detail_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurant_booking_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurant_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurants_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_restaurants_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_similar_restaurants_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/restaurants_detail/get_similar_restaurants_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/model/user_service_detail/user_service_detail_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/login/model/forgot_password_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/login/model/login_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/login/model/sign_up_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/bookmarks_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/following_data_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/profile_response.dart';
import '../../module/booking/model/booking_history_detail_model.dart';
import '../../module/booking/model/booking_history_response.dart';
import '../service.dart';

class ApiRepository extends GetxService {
  static final ApiClient _apiClient = ApiClient();

  static String getBaseUrl(String endPoint) => ApiEndPoints.baseUrl + endPoint;

  static String getBaseUrl2(String endPoint) => ApiEndPoints.baseUrl2 + endPoint;

  static String getPostBaseUrl(String endPoint) => ApiEndPoints.postBaseUrl + endPoint;

  static String getApiBaseUrl(String endPoint) => ApiEndPoints.apiBaseUrl + endPoint;

  static Future<LoginResponse?> loginApi(Map<String, dynamic> map) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.loginUrl), body: map).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return LoginResponse.fromJson(response.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  static Future<SignUpResponse?> signUpApi(Map<String, dynamic> map) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.signUpUrl), body: map).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return SignUpResponse.fromJson(response.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  static Future<UserProfileResponse?> userProfileApi({required UserProfilePayLoad bodyData}) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.userProfileUrl), body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return UserProfileResponse.fromJson(response.responseData);
        } else {
          return null;
        }
      },
    );
  }

  static Future<ForgotPasswordResponse?> forgotPasswordApi(Map<String, dynamic> map) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.forgotPasswordUrl), body: map).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return ForgotPasswordResponse.fromJson(response.toJson());
        } else {
          return null;
        }
      },
    ).catchError((err) => catchErr(err));
  }

  static Future<ApiResponseModel?> editProfileApiMultiPart({required EditProfilePayload bodyData, String? filename, String? name, String? bio}) async {
    AppLoader.showLoader();
    try {
      ApiResponseModel response = await _apiClient.multiPart(url: getBaseUrl(ApiEndPoints.editProfileUrl), filename: filename, name: name, bio: bio, body: bodyData.toMap());
      AppLoader.removeLoader();
      if (kDebugMode) {
        print("Full Response: ${response.toJson()}");
      }
      Fluttertoast.showToast(msg: "${response.responseText}", backgroundColor: MyColors.grey.withOpacity(0.8), textColor: MyColors.black);

      if (await ApiValidation.validateResponse(response) ?? false) {
        if (response.responseData != null) {
          return ApiResponseModel.fromJson(response.responseData as Map<String, dynamic>, response.statusCode);
        }
      } else {
        if (kDebugMode) {
          print(":::::::::::::::::::::::::::::::::::::::::::Response validation failed");
        }
        return null;
      }
    } catch (e) {
      AppLoader.removeLoader();
      if (kDebugMode) {
        print("Error in editProfileApiMultiPart: $e");
      }
      return null;
    }
    return null;
  }

  /// USER categories -- home play section
  static Future<UserCategoriesResponseData?> userCategoriesApi({required UserCategoriesPayLoad bodyData}) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.userCategoriesUrl), body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        print("UserCategoriesResponseData count ${response.responseData}");
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return UserCategoriesResponseData.fromJson(response.responseData);
        } else {
          return null;
        }
      },
    );
  }

  /// cuisineCategoriesApi - home eat section
  static Future<List<CuiSineResponse>?> cuisineCategoriesApi() async {
    AppLoader.showLoader();
    try {
      var response = await _apiClient.get(url: ApiEndPoints.getCuisineListUrl);
      if (await ApiValidation.validateResponse(response) ?? false) {
        var data = response.responseData as List<dynamic>;
        return data.map((e) => CuiSineResponse.fromJson(e)).toList();
      } else {
        if (kDebugMode) {
          print("Invalid response");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("CuiSineResponse====ERROR==========================$e");
      }
      return null;
    } finally {
      AppLoader.removeLoader();
    }
  }

  /// badgeListApi -- Profile screen
  static Future<List<BadgeResponse>?> badgeListApi() async {
    AppLoader.showLoader();
    try {
      return await _apiClient.get(url: getBaseUrl(ApiEndPoints.getBadgeListUrl)).then((ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          var data = response.responseData as List<dynamic>;
          return data.map((e) => BadgeResponse.fromJson(e)).toList();
        } else {
          return null;
        }
      });
    } catch (e) {
      AppLoader.removeLoader();
      if (kDebugMode) {
        print("BadgeResponse====ERROR==========================$e");
      }
    }
    return null;
  }

  /// USER SERVICES -- home play categories detail(service)
  static Future<List<UserServiceResponse>?> userServiceApi({required UserServicePayLoad bodyData}) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.userServiceUrl), body: bodyData.toMap()).then((ApiResponseModel response) async {
      if (await ApiValidation.validateResponse(response) ?? false) {
        AppLoader.removeLoader();
        if (response.responseData != null) {
          var data = response.responseData as List<dynamic>;
          return data.map((e) => UserServiceResponse.fromJson(e)).toList();
        } else {
          return null;
        }
      } else {
        return null;
      }
    });
  }

  /// COIN HISTORY API -- profile
  static Future<CoinMyHistoryResponse?> coinHistoryApi({required CoinMyHistoryPayLoad bodyData}) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.coinMyHistoryUrl), body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return CoinMyHistoryResponse.fromJson(response.responseData);
        } else {
          return null;
        }
      },
    );
  }

  static Future<BookmarkResponse?> getBookMarks(Map<String, dynamic> map) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.getBookMarkList), body: map).then(
      (ApiResponseModel response) async {
        log("getBookMarks dataaaaaa::::::::::::${response.responseData}");
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return BookmarkResponse.fromJson(response.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  /// user service detail
  static Future<GetUserServiceDetailResponse?> userServiceDetailApi({String? serviceId, String? categoryId}) async {
    AppLoader.showLoader();
    if (serviceId != null && categoryId != null) {
      return await _apiClient.get(url: "${getBaseUrl(ApiEndPoints.userServiceDetailUrl)}/$serviceId/$categoryId").then(
        (ApiResponseModel response) async {
          if (await ApiValidation.validateResponse(response) ?? false) {
            AppLoader.removeLoader();
            return GetUserServiceDetailResponse.fromJson(response.responseData);
          }
          return null;
        },
      );
    } else if (serviceId != null && categoryId == null) {
      return await _apiClient.get(url: "${getBaseUrl(ApiEndPoints.userServiceDetailUrl)}/$serviceId").then(
        (ApiResponseModel response) async {
          if (await ApiValidation.validateResponse(response) ?? false) {
            AppLoader.removeLoader();
            return GetUserServiceDetailResponse.fromJson(response.responseData);
          }
          return null;
        },
      );
    }
    return null;
  }

  /// Feed Screen - get post
  static Future<List<GetPostResponse>?> postDataApi({required PostPayLoad bodyData, bool isLoading = true}) async {
    if (isLoading == false) {
      AppLoader.removeLoader();
    } else {
      AppLoader.showLoader();
    }

    return await _apiClient.post(url: getPostBaseUrl(ApiEndPoints.getPostsUrl), body: bodyData.toMap()).then((ApiResponseModel response) async {
      if (await ApiValidation.validateResponse(response) ?? false) {
        AppLoader.removeLoader();
        var data = response.responseData as List<dynamic>;
        return data.map((e) => GetPostResponse.fromJson(e)).toList();
      } else {
        return null;
      }
    });
  }

  /// GetPostDataResponse   for try to got unread count
  // static Future<GetPostDataResponse?> postDataApi({required PostPayLoad bodyData, bool isLoading = true}) async {
  //   if (isLoading == false) {
  //     AppLoader.removeLoader();
  //   } else {
  //     AppLoader.showLoader();
  //   }
  //
  //   return await _apiClient.post(url: getPostBaseUrl(ApiEndPoints.getPostsUrl), body: bodyData.toMap()).then((ApiResponseModel response) async {
  //     if (await ApiValidation.validateResponse(response) ?? false) {
  //       AppLoader.removeLoader();
  //       var data = response.responseData as List<dynamic>;
  //       List<GetPostResponse> posts = data.map((e) => GetPostResponse.fromJson(e)).toList();
  //       return GetPostDataResponse(postData: posts, unreadCount: response.unreadCount);
  //     } else {
  //       return null;
  //     }
  //   });
  // }

  /// Feed Screen - get posts comment
  static Future<List<GetPostCommentResponse>?> postsCommentApi({required GetPostCommentPayLoad bodyData}) async {
    AppLoader.showLoader();
    try {
      return await _apiClient.post(url: getPostBaseUrl(ApiEndPoints.getPostCommentUrl), body: bodyData.toMap()).then((ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          var data = response.responseData as List<dynamic>;
          return data.map((e) => GetPostCommentResponse.fromJson(e)).toList();
        } else {
          return null;
        }
      });
    } catch (e) {
      AppLoader.removeLoader();
      if (kDebugMode) {
        print("postsCommentApi====E==========================$e");
      }
    }
    return null;
  }

  static Future<AddCommentResponse?> addCommentApi(Map<String, dynamic> map) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getPostBaseUrl(ApiEndPoints.addCommentUrl), body: map).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return AddCommentResponse.fromJson(response.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  /// ADD LIKE API
  static Future<ApiResponseModel?> addLikeApi(AddLikePayLoad bodyData) async {
    ApiResponseModel response = await _apiClient.post(url: getPostBaseUrl(ApiEndPoints.addLikeUrl), body: bodyData.toMap());

    if (await ApiValidation.validateResponse(response) ?? false) {
      if (response.responseData == 'Liked' || response.responseData == 'dislike') {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  /// ADD BOOK MARK API
  static Future<ApiResponseModel?> addBookMarkApi(AddBookMarkPayLoad bodyData) async {
    // AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.addBookMarkUrl), body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          // AppLoader.removeLoader();
          if (response.responseCode == "1") {
            Fluttertoast.showToast(msg: "${response.responseText}", backgroundColor: MyColors.grey.withOpacity(0.8), textColor: MyColors.black);
          }
          if (response.responseCode == "2") {
            Fluttertoast.showToast(msg: "${response.responseText}", backgroundColor: MyColors.grey.withOpacity(0.8), textColor: MyColors.black);
          }
          return ApiResponseModel.fromJson(response.responseData != null ? response.responseData as Map<String, dynamic> : {}, response.statusCode);
        } else {
          return null;
        }
      },
    );
  }

  /// DELETE POST
  static Future<ApiResponseModel?> deletePostApi(PostDeletePayLoad bodyData) async {
    AppLoader.showLoader();
    ApiResponseModel response = await _apiClient.post(url: getPostBaseUrl(ApiEndPoints.postDeleteUrl), body: bodyData.toMap());

    if (await ApiValidation.validateResponse(response) ?? false) {
      if (response.responseData is String) {
        AppLoader.removeLoader();
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  /// REPORT POST
  static Future<ReportPostResponse?> reportPostApi(ReportPostPayLoad bodyData) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getPostBaseUrl(ApiEndPoints.reportPostUrl), body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          if (response.responseCode == "1") {
            Fluttertoast.showToast(msg: "Post Reported Successfully.", backgroundColor: MyColors.grey.withOpacity(0.8), textColor: MyColors.black);
          }
          return ReportPostResponse.fromJson(response.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  /// USER ACTIVITY LIST API
  static Future<List<UserActivityListResponse>?> userActivityListApi({required UserActivityListPayLoad bodyData}) async {
    AppLoader.showLoader();
    try {
      return await _apiClient.post(url: getApiBaseUrl(ApiEndPoints.userActivityListUrl), body: bodyData.toMap()).then((ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          var data = response.responseData as List<dynamic>;
          return data.map((e) => UserActivityListResponse.fromJson(e)).toList();
        } else {
          return null;
        }
      });
    } catch (e) {
      AppLoader.removeLoader();
      if (kDebugMode) {
        print("userActivityListApi=========================$e");
      }
    }
    return null;
  }

  /// USER SEARCH API
  static Future<List<UserSearchResponse>?> userSearchApi({required UserSearchPayLoad bodyData}) async {
    AppLoader.showLoader();
    try {
      return await _apiClient.post(url: getApiBaseUrl(ApiEndPoints.userSearchUrl), body: bodyData.toMap()).then((ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          var data = response.responseData as List<dynamic>;
          return data.map((e) => UserSearchResponse.fromJson(e)).toList();
        } else {
          return null;
        }
      });
    } catch (e) {
      AppLoader.removeLoader();
      if (kDebugMode) {
        print("userSearchApi=========================$e");
      }
    }
    return null;
  }

  /// userAccountGetProfileAPI
  static Future<UserAccountGetProfileResponse?> userAccountGetProfileApi(UserAccountGetProfilePayLoad bodyData) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.userAccountGetProfileUrl), body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return UserAccountGetProfileResponse.fromJson(response.responseData != null ? response.responseData as Map<String, dynamic> : {});
        } else {
          return null;
        }
      },
    );
  }

  /// bookmarkServiceDetail API
  static Future<GetUserServiceDetailResponse?> bookmarkServiceDetailApi({required String bookmarkServiceId}) async {
    AppLoader.showLoader();
    return await _apiClient.get(url: "${getBaseUrl(ApiEndPoints.bookmarkServiceDetailUrl)}$bookmarkServiceId").then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return GetUserServiceDetailResponse.fromJson(response.responseData);
        } else {
          return null;
        }
      },
    );
  }

  /// bookmarkRestaurantsDetail API
  static Future<GetRestaurantsDetailResponse?> bookmarkRestaurantsDetailApi({required String bookmarkRestaurantsId, required String userId}) async {
    AppLoader.showLoader();
    return await _apiClient.get(url: "${getBaseUrl2(ApiEndPoints.bookmarkRestaurantsDetailUrl)}$bookmarkRestaurantsId/$userId").then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return GetRestaurantsDetailResponse.fromJson(response.responseData);
        } else {
          return null;
        }
      },
    );
  }

  /// comment Supplier Service Profile API
  static Future<CommentSupplierProfileResponse?> commentSupplierServiceProfileApi({required String serviceId}) async {
    AppLoader.showLoader();
    return await _apiClient.get(url: "${getBaseUrl(ApiEndPoints.commentSupplierServiceProfileUrl)}$serviceId").then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return CommentSupplierProfileResponse.fromJson(response.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  static Future<List<GetSimilarRestaurantsDetailResponse>?> getSimilarRestaurantsApi({required String page, required GetSimilarRestaurantsPayload bodyData}) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: '${getBaseUrl2(ApiEndPoints.getSimilarRestaurants)}?page=$page', body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          var data = response.responseData as List<dynamic>;
          return data.map((e) => GetSimilarRestaurantsDetailResponse.fromJson(e)).toList();
        } else {
          return null;
        }
      },
    );
  }

  /// Follower
  static Future<FollowerDataResponse?> getFollowerDataApi({required FollowerDataPayLoad bodyData}) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getApiBaseUrl(ApiEndPoints.usersFollowerUrl), body: bodyData.toMap()).then(
      (res) async {
        AppLoader.removeLoader();
        return FollowerDataResponse.fromMap(res.toJson());
      },
    );
  }

  /// Get Supplier Profile Follower Data
  static Future<SupplierProfileFollowerResponse?> getSupplierProfileFollowerDataApi({required SupplierProfileFollowerPayLoad bodyData}) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getApiBaseUrl(ApiEndPoints.getSupplierFollowersByUserUrl), body: bodyData.toMap()).then(
      (res) async {
        AppLoader.removeLoader();
        return SupplierProfileFollowerResponse.fromMap(res.toJson());
      },
    );
  }

  /// Following
  static Future<FollowingDataResponse?> getFollowingDataApi({required FollowingDataPayLoad bodyData}) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getApiBaseUrl(ApiEndPoints.usersFollowingUrl), body: bodyData.toMap()).then(
      (res) async {
        AppLoader.removeLoader();
        return FollowingDataResponse.fromMap(res.toJson());
      },
    );
  }

  static Future<ApiResponseModel?> getBookingServices({required Map<String, dynamic> bodyData}) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.getBookingServiceUrl), body: bodyData).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return ApiResponseModel.fromJson(response.responseData as Map<String, dynamic>, response.statusCode);
        } else {
          return null;
        }
      },
    );
  }

  /// User Follow Add Supplier
  static Future addFollowSupplierApi(UserFollowAddSupplierPayLoad bodyData) async {
    ApiResponseModel response = await _apiClient.post(url: getApiBaseUrl(ApiEndPoints.followAddSupplierUrl), body: bodyData.toMap());

    if (await ApiValidation.validateResponse(response) ?? false) {
      if (response.responseData is String) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  /// User Follow Add User
  static Future<ApiResponseModel?> addFollowUserApi(UserFollowAddUserPayLoad bodyData) async {
    ApiResponseModel response = await _apiClient.post(url: getApiBaseUrl(ApiEndPoints.followAddUserUrl), body: bodyData.toMap());

    if (await ApiValidation.validateResponse(response) ?? false) {
      if (response.responseData is String) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  /// getUsersTagSearchApi
  static Future<List<UsersTagSearchResponse>?> getUsersTagSearchApi(UsersTagSearchPayLoad bodyData) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getApiBaseUrl(ApiEndPoints.usersTagSearchUrl), body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          var data = response.responseData as List<dynamic>;
          return data.map((e) => UsersTagSearchResponse.fromJson(e)).toList();
        } else {
          return null;
        }
      },
    );
  }

  /// Post Detail Api at feed notification
  static Future<PostDetailResponse?> notificationPostDetailApi(PostDetailPayLoad bodyData) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.postDetailsUrl), body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return PostDetailResponse.fromJson(response.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  static Future<CheckAvailabilityStatus?> checkAvailabilityStatus(CheckAvailabilityPayload bodyData) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl2(ApiEndPoints.checkAvailabilityStatus), body: bodyData.toMap()).then(
      (ApiResponseModel res) async {
        if (await ApiValidation.validateResponse(res) ?? false) {
          AppLoader.removeLoader();
          return CheckAvailabilityStatus.fromJson(res.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  static Future<CountRestaurantTaxResponse?> countRestaurantTax(CountRestaurantTaxPayload bodyData) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl2(ApiEndPoints.countRestaurantTax), body: bodyData.toMap()).then(
      (ApiResponseModel res) async {
        if (await ApiValidation.validateResponse(res) ?? false) {
          AppLoader.removeLoader();
          return CountRestaurantTaxResponse.fromJson(res.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  static Future<CreateReservationResponse?> createReservation(CreateReservationPayload bodyData) async {
    AppLoader.showLoader2();
    return await _apiClient.post(url: getBaseUrl2(ApiEndPoints.createReservation), body: bodyData.toMap()).then(
      (ApiResponseModel res) async {
        if (await ApiValidation.validateResponse(res) ?? false) {
          AppLoader.removeLoader();
          return CreateReservationResponse.fromJson(res.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  static Future<RestaurantBookingResponse?> getRestaurantBookingDetails(RestaurantBookingPayload bodyData) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: ApiEndPoints.getRestaurantBookingDetail, body: bodyData.toMap()).then(
      (ApiResponseModel res) async {
        if (await ApiValidation.validateResponse(res) ?? false) {
          AppLoader.removeLoader();
          return RestaurantBookingResponse.fromJson(res.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  static Future<GetRestaurantsResponse?> getRestaurantList({
    required GetRestaurantsPayload bodyData,
    required String cuisineId,
    required String goodFor,
    required String priceLevel,
    required String foodType,
    required String page,
    required String searchText,
  }) async {
    AppLoader.showLoader();
    return await _apiClient
        .post(
      url: '${getBaseUrl2(ApiEndPoints.getRestaurantsList)}?cuisine_id=$cuisineId&good_for=$goodFor&price_level=$priceLevel&food_type=$foodType&page=$page&q=$searchText',
      body: bodyData.toMap(),
    )
        .then(
      (ApiResponseModel res) async {
        if (await ApiValidation.validateResponse(res) ?? false) {
          AppLoader.removeLoader();
          return GetRestaurantsResponse.fromJson(res.responseData as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );
  }

  static Future<BookingHistoryResponseData?> getBookingsApi(Map<String, dynamic> map, {String? page, bool showLoader = true}) async {
    if (showLoader) AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.getBooking + (page ?? ApiEndPoints.defaultPage)), body: map).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response, showLoader: showLoader) ?? false) {
          if (showLoader) AppLoader.removeLoader();
          return BookingHistoryResponseData.fromJson(response.responseData);
        } else {
          return null;
        }
      },
    );
    //.catchError((err) => catchErr(err));
  }

  static Future<BookingHistoryDetailsResponse?> bookingDetailsApi(BookingHistoryDetailsPayload bodyData) async {
    AppLoader.showLoader();
    return await _apiClient.post(url: getBaseUrl(ApiEndPoints.bookingDetails), body: bodyData.toMap()).then(
      (ApiResponseModel response) async {
        log("bookingDetailsApi ::::::: ${response.toJson()}");
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return BookingHistoryDetailsResponse.fromMap(response.responseData);
        } else {
          return null;
        }
      },
    );
    // .catchError((err) => catchErr(err));
  }

  static Future<bool?> bookingStatusApi(Map<String, dynamic> map, {reservationId}) async {
    AppLoader.showLoader2();
    return await _apiClient.put(url: "${getBaseUrl2(ApiEndPoints.cancelReservation)}$reservationId", body: map).then(
      (ApiResponseModel response) async {
        if (await ApiValidation.validateResponse(response) ?? false) {
          AppLoader.removeLoader();
          return response.statusCode == 200;
        } else {
          return null;
        }
      },
    ).catchError((err) => catchErr(err));
  }

  static catchErr(err) {
    AppLoader.removeLoader();
    ApiValidation.showDialogueAccordingResponse(err.toString());
    Console.debug(err);
    return null;
  }
}
