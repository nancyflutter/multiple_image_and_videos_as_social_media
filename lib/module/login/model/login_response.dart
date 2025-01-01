import 'dart:convert';

class LoginResponse {
  String? authToken;
  int? coin;
  String? deviceToken;
  String? email;
  String? facebookId;
  String? fullName;
  String? image;
  String? mobile;
  String? mobileCode;
  String? userId;

  LoginResponse({
    this.authToken,
    this.coin,
    this.deviceToken,
    this.email,
    this.facebookId,
    this.fullName,
    this.image,
    this.mobile,
    this.mobileCode,
    this.userId,
  });

  LoginResponse copyWith({
    String? authToken,
    int? coin,
    String? deviceToken,
    String? email,
    String? facebookId,
    String? fullName,
    String? image,
    String? mobile,
    String? mobileCode,
    String? userId,
  }) =>
      LoginResponse(
        authToken: authToken ?? this.authToken,
        coin: coin ?? this.coin,
        deviceToken: deviceToken ?? this.deviceToken,
        email: email ?? this.email,
        facebookId: facebookId ?? this.facebookId,
        fullName: fullName ?? this.fullName,
        image: image ?? this.image,
        mobile: mobile ?? this.mobile,
        mobileCode: mobileCode ?? this.mobileCode,
        userId: userId ?? this.userId,
      );

  factory LoginResponse.fromRawJson(String str) => LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    authToken: json["auth_token"],
    coin: json["coin"],
    deviceToken: json["device_token"],
    email: json["email"],
    facebookId: json["facebook_id"],
    fullName: json["full_name"],
    image: json["image"],
    mobile: json["mobile"],
    mobileCode: json["mobile_code"],
    userId: json["user_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "auth_token": authToken,
    "coin": coin,
    "device_token": deviceToken,
    "email": email,
    "facebook_id": facebookId,
    "full_name": fullName,
    "image": image,
    "mobile": mobile,
    "mobile_code": mobileCode,
    "user_id": userId,
  };
}
