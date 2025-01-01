// import 'dart:convert';
//
// class DeletePostResponse {
//   int? responseCode;
//   int? status;
//   dynamic error;
//   String? responseData;
//
//   DeletePostResponse({
//     this.responseCode,
//     this.status,
//     this.error,
//     this.responseData,
//   });
//
//   DeletePostResponse copyWith({
//     int? responseCode,
//     int? status,
//     dynamic error,
//     String? responseData,
//   }) =>
//       DeletePostResponse(
//         responseCode: responseCode ?? this.responseCode,
//         status: status ?? this.status,
//         error: error ?? this.error,
//         responseData: responseData ?? this.responseData,
//       );
//
//   factory DeletePostResponse.fromJson(String str) => DeletePostResponse.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory DeletePostResponse.fromMap(Map<String, dynamic> json) => DeletePostResponse(
//     responseCode: json["ResponseCode"],
//     status: json["status"],
//     error: json["error"],
//     responseData: json["ResponseData"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "ResponseCode": responseCode,
//     "status": status,
//     "error": error,
//     "ResponseData": responseData,
//   };
// }
