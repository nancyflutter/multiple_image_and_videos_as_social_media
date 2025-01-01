import 'dart:convert';

class ApiResponseModel<T> {
  String? responseCode;
  final int statusCode;
  final String? responseText;
  T? responseData;

  ApiResponseModel({
    this.responseCode,
    this.responseText,
    this.responseData,
    required this.statusCode,
  });

  ApiResponseModel copyWith({
    String? responseCode,
    int? statusCode,
    String? responseText,
    T? responseData,
  }) =>
      ApiResponseModel(
        responseCode: responseCode ?? this.responseCode,
        statusCode: statusCode ?? this.statusCode,
        responseText: responseText ?? this.responseText,
        responseData: responseData ?? this.responseData,
      );

  String toRawJson() => json.encode(toJson());

  factory ApiResponseModel.fromJson(Map<String, dynamic> json, int? statusCode) {
    var responseData = json["ResponseData"];

    return ApiResponseModel(
      statusCode: statusCode ?? 0,
      responseCode: json["ResponseCode"]?.toString(),
      responseText: json["ResponseText"] ?? "",
      responseData: responseData as T?,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": statusCode,
        "ResponseCode": responseCode,
        "ResponseText": responseText,
        "ResponseData": responseData,
      };
}
