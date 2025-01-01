// import 'dart:convert';
//
// class EditProfileResponse {
//   int? responseCode;
//   String? responseText;
//
//   EditProfileResponse({
//     this.responseCode,
//     this.responseText,
//   });
//
//   EditProfileResponse copyWith({
//     int? responseCode,
//     String? responseText,
//   }) =>
//       EditProfileResponse(
//         responseCode: responseCode ?? this.responseCode,
//         responseText: responseText ?? this.responseText,
//       );
//
//   factory EditProfileResponse.fromJson(String str) => EditProfileResponse.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory EditProfileResponse.fromMap(Map<String, dynamic> json) => EditProfileResponse(
//     responseCode: json["ResponseCode"],
//     responseText: json["ResponseText"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "ResponseCode": responseCode,
//     "ResponseText": responseText,
//   };
// }
