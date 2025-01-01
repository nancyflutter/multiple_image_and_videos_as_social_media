import 'dart:convert';

class AddLikeResponse {
  int? responseCode;
  int? status;
  dynamic error;
  String? responseData;

  AddLikeResponse({
    this.responseCode,
    this.status,
    this.error,
    this.responseData,
  });

  AddLikeResponse copyWith({
    int? responseCode,
    int? status,
    dynamic error,
    String? responseData,
  }) =>
      AddLikeResponse(
        responseCode: responseCode ?? this.responseCode,
        status: status ?? this.status,
        error: error ?? this.error,
        responseData: responseData ?? this.responseData,
      );

  factory AddLikeResponse.fromJson(String str) => AddLikeResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddLikeResponse.fromMap(Map<String, dynamic> json) => AddLikeResponse(
    responseCode: json["ResponseCode"],
    status: json["status"],
    error: json["error"],
    responseData: json["ResponseData"],
  );

  Map<String, dynamic> toMap() => {
    "ResponseCode": responseCode,
    "status": status,
    "error": error,
    "ResponseData": responseData,
  };
}
