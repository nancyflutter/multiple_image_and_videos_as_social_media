import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:multiple_image_and_videos_as_social_media/services/service.dart';

class ApiClient {
  var appController = Get.find<AppController>();

  Future<ApiResponseModel> get({required String url}) async {
    if (await ConnectivityChecker().checkConnectivity()) {
      try {
        http.Response response = await http.get(Uri.parse(url), headers: appController.getHeader());
        final responseBody = json.decode(response.body) as Map<String, dynamic>;
        Console.debug("====================================== GET ======================================");
        Console.debug("Api : $url");
        Console.debug("Header : ${appController.getHeader()}");
        Console.debug("------------------------RESPONSE--------------------------");
        Console.debug("statusCode :::::: ${response.statusCode}");
        if (responseBody.containsKey('status')) {
          Console.debug("Custom Status ::::::::::::: ${responseBody['status']}");
        }
        // Console.debug("body :::::: ${response.body}");
        Console.debugLog("body :::::: ${response.body}");
        Console.debug("===================================================================================");
        return ApiResponseModel.fromJson(json.decode(response.body) as Map<String, dynamic>, response.statusCode);
      } on SocketException {
        throw ErrorDescription('Something went wrong please try after some time');
      }
    } else {
      throw ErrorDescription('Device not connected to internet');
    }
  }

  Future<ApiResponseModel> post({required String url, String? filename, required Map<String, dynamic>? body}) async {
    if (await ConnectivityChecker().checkConnectivity()) {
      try {
        http.Response response = await http.post(Uri.parse(url), headers: appController.getHeader(), body: jsonEncode(body));
        final responseBody = json.decode(response.body) as Map<String, dynamic>;
        Console.debug("====================================== POST ======================================");
        Console.debug("Api : $url");
        Console.debug("Header : ${appController.getHeader()}");
        Console.debug("PayLoad : ${jsonEncode(body)}");
        Console.debug("------------------------RESPONSE--------------------------");
        Console.debug("HTTP StatusCode :::::: ${response.statusCode}");
        if (responseBody.containsKey('status')) {
          Console.debug("Custom Status ::::::::::::: ${responseBody['status']}");
        }
        // Console.debugLog("body :::::: ${response.body}");
        Console.debug("body :::::: ${response.body}");
        Console.debug("headers :::::: ${response.headers}");
        Console.debug("===================================================================================");
        return ApiResponseModel.fromJson(json.decode(response.body) as Map<String, dynamic>, response.statusCode);
      } on SocketException {
        throw ErrorDescription('Something went wrong please try after some time');
      }
    } else {
      throw ErrorDescription('Device not connected to internet');
    }
  }

  Future<ApiResponseModel> multiPart({required String url, String? filename, String? name, String? bio, required Map<String, dynamic>? body}) async {
    Console.debug("======================= MULTIPART =====================");
    Console.debug("Api : $url");
    Console.debug("Headers : ${appController.getHeader()}");
    Console.debug("Body : ${jsonEncode(body)}");
    Console.debug("=======================================================");

    if (await ConnectivityChecker().checkConnectivity()) {
      try {
        var request = http.MultipartRequest("POST", Uri.parse(url));

        if (name != null) {
          request.fields['name'] = name;
        }
        if (bio != null) {
          request.fields['bio'] = bio;
        }
        if (filename != null) {
          request.files.add(
            await http.MultipartFile.fromPath('image', filename),
          );
        }

        body?.forEach((key, value) {
          request.fields[key] = value.toString();
        });

        request.headers.addAll(appController.getHeader());

        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        Console.debug("====================================== POST ======================================");
        Console.debug("Api : $url");
        Console.debug("Header : ${appController.getHeader()}");
        Console.debug("PayLoad : ${jsonEncode(body)}");
        Console.debug("------------------------RESPONSE--------------------------");
        Console.debug("statusCode ::: ${response.statusCode}");
        Console.debug("body :::::: ${response.body}");
        Console.debug("headers :::::: ${response.headers}");
        Console.debug("===================================================================================");

        if (response.statusCode == 200) {
          return ApiResponseModel.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
            response.statusCode,
          );
        } else {
          throw ErrorDescription('Error: ${response.statusCode} ${response.reasonPhrase}');
        }
      } on SocketException {
        throw ErrorDescription('Something went wrong, please try again later.');
      } catch (e) {
        throw ErrorDescription('Unexpected error: $e');
      }
    } else {
      throw ErrorDescription('Device not connected to the internet.');
    }
  }

  Future<ApiResponseModel> put({required String url, String? filename, required Map<String, dynamic>? body}) async {
    if (await ConnectivityChecker().checkConnectivity()) {
      try {
        http.Response response = await http.put(Uri.parse(url), headers: appController.getHeader(), body: jsonEncode(body));
        final responseBody = json.decode(response.body) as Map<String, dynamic>;
        Console.debug("====================================== POST ======================================");
        Console.debug("Api : $url");
        Console.debug("Header : ${appController.getHeader()}");
        Console.debug("PayLoad : ${jsonEncode(body)}");
        Console.debug("------------------------RESPONSE--------------------------");
        Console.debug("HTTP StatusCode :::::: ${response.statusCode}");
        if (responseBody.containsKey('status')) {
          Console.debug("Custom Status ::::::::::::: ${responseBody['status']}");
        }
        Console.debugLog("body :::::: ${response.body}");
        Console.debug("headers :::::: ${response.headers}");
        Console.debug("===================================================================================");
        return ApiResponseModel.fromJson(json.decode(response.body) as Map<String, dynamic>, response.statusCode);
      } on SocketException {
        throw ErrorDescription('Something went wrong please try after some time');
      }
    } else {
      throw ErrorDescription('Device not connected to internet');
    }
  }
}


// Future<http.Response> get({required String url}) async {
//   String? authToken = await StorageService.getKey(key: StorageConstants.authToken);
//   Console.debug("======================= GET =====================");
//   Console.debug("Api : $url");
//   Console.debug("authToken : $authToken");
//   Console.debug("==================================================");
//   if (await ConnectivityChecker().checkConnectivity()) {
//     try {
//       return http.get(
//         Uri.parse(url),
//         headers: {
//           "Content-Type": "application/json",
//           if (authToken != null) "Authorization": "Bearer $authToken",
//         },
//       ).timeout(const Duration(seconds: 30), onTimeout: () {
//         return http.Response("Gateway Time-out", 504);
//       }).then((http.Response response) {
//         Console.debugLog("=================== RESPONSE =====================\n");
//         Console.debugLog("Api : $url\n");
//         Console.debugLog("Status Code : ${response.statusCode}\n");
//         Console.debugLog("response : \n\n${response.body}\n");
//         Console.debugLog("==================================================");
//         return response;
//       });
//     } on SocketException {
//       return http.Response("", 500);
//     }
//   } else {
//     throw Exception('Device not connected to internet');
//   }
// }
