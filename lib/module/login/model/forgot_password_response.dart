import 'dart:convert';

class ForgotPasswordResponse {
  final String? responseText;
  final int? responseData;

  ForgotPasswordResponse({this.responseText, this.responseData});

  ForgotPasswordResponse copyWith({
    String? responseText,
    int? responseData,
  }) =>
      ForgotPasswordResponse(
        responseText: responseText ?? this.responseText,
        responseData: responseData ?? this.responseData,
      );

  factory ForgotPasswordResponse.fromRawJson(String str) => ForgotPasswordResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => ForgotPasswordResponse(
        responseText: json["ResponseText"],
        responseData: json["ResponseData"],
      );

  Map<String, dynamic> toJson() => {
        "ResponseText": responseText,
        "ResponseData": responseData,
      };
}
