import 'dart:convert';

class SignUpResponse {
  String? userId;
  String? fullName;
  String? signUpPayloadFullName;
  String? email;
  String? mobile;
  String? lat;
  String? lng;
  String? address;
  String? otp;
  String? deviceToken;
  String? deviceId;
  int? deviceType;
  String? referralCode;
  String? refferalLink;
  BadgeDetails? badgeDetails;
  String? authToken;
  int? coin;

  SignUpResponse({
    this.userId,
    this.fullName,
    this.signUpPayloadFullName,
    this.email,
    this.mobile,
    this.lat,
    this.lng,
    this.address,
    this.otp,
    this.deviceToken,
    this.deviceId,
    this.deviceType,
    this.referralCode,
    this.refferalLink,
    this.badgeDetails,
    this.authToken,
    this.coin,
  });

  SignUpResponse copyWith({
    String? userId,
    String? fullName,
    String? signUpPayloadFullName,
    String? email,
    String? mobile,
    String? lat,
    String? lng,
    String? address,
    String? otp,
    String? deviceToken,
    String? deviceId,
    int? deviceType,
    String? referralCode,
    String? refferalLink,
    BadgeDetails? badgeDetails,
    String? authToken,
    int? coin,
  }) =>
      SignUpResponse(
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        signUpPayloadFullName: signUpPayloadFullName ?? this.signUpPayloadFullName,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        address: address ?? this.address,
        otp: otp ?? this.otp,
        deviceToken: deviceToken ?? this.deviceToken,
        deviceId: deviceId ?? this.deviceId,
        deviceType: deviceType ?? this.deviceType,
        referralCode: referralCode ?? this.referralCode,
        refferalLink: refferalLink ?? this.refferalLink,
        badgeDetails: badgeDetails ?? this.badgeDetails,
        authToken: authToken ?? this.authToken,
        coin: coin ?? this.coin,
      );

  factory SignUpResponse.fromRawJson(String str) => SignUpResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    userId: json["user_id"].toString(),
    fullName: json["fullName"],
    signUpPayloadFullName: json["full_name"],
    email: json["email"],
    mobile: json["mobile"],
    lat: json["lat"],
    lng: json["lng"],
    address: json["address"],
    otp: json["otp"],
    deviceToken: json["device_token"],
    deviceId: json["device_id"],
    deviceType: json["device_type"],
    referralCode: json["referral_code"],
    refferalLink: json["refferal_link"],
    badgeDetails: json["badge_details"] == null ? null : BadgeDetails.fromMap(json["badge_details"]),
    authToken: json["auth_token"],
    coin: json["coin"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "fullName": fullName,
    "full_name": signUpPayloadFullName,
    "email": email,
    "mobile": mobile,
    "lat": lat,
    "lng": lng,
    "address": address,
    "otp": otp,
    "device_token": deviceToken,
    "device_id": deviceId,
    "device_type": deviceType,
    "referral_code": referralCode,
    "refferal_link": refferalLink,
    "badge_details": badgeDetails?.toMap(),
    "auth_token": authToken,
    "coin": coin,
  };
}

class BadgeDetails {
  int? id;
  String? name;
  int? coins;
  int? categoryId;
  int? subcategoryId;
  String? beforeDescription;
  String? afterDescription;
  DateTime? takenDate;
  String? subcategoryName;
  String? categoryName;
  String? beforeImage;
  String? afterImage;

  BadgeDetails({
    this.id,
    this.name,
    this.coins,
    this.categoryId,
    this.subcategoryId,
    this.beforeDescription,
    this.afterDescription,
    this.takenDate,
    this.subcategoryName,
    this.categoryName,
    this.beforeImage,
    this.afterImage,
  });

  BadgeDetails copyWith({
    int? id,
    String? name,
    int? coins,
    int? categoryId,
    int? subcategoryId,
    String? beforeDescription,
    String? afterDescription,
    DateTime? takenDate,
    String? subcategoryName,
    String? categoryName,
    String? beforeImage,
    String? afterImage,
  }) =>
      BadgeDetails(
        id: id ?? this.id,
        name: name ?? this.name,
        coins: coins ?? this.coins,
        categoryId: categoryId ?? this.categoryId,
        subcategoryId: subcategoryId ?? this.subcategoryId,
        beforeDescription: beforeDescription ?? this.beforeDescription,
        afterDescription: afterDescription ?? this.afterDescription,
        takenDate: takenDate ?? this.takenDate,
        subcategoryName: subcategoryName ?? this.subcategoryName,
        categoryName: categoryName ?? this.categoryName,
        beforeImage: beforeImage ?? this.beforeImage,
        afterImage: afterImage ?? this.afterImage,
      );

  factory BadgeDetails.fromJson(String str) => BadgeDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BadgeDetails.fromMap(Map<String, dynamic> json) => BadgeDetails(
    id: json["id"],
    name: json["name"],
    coins: json["coins"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    beforeDescription: json["before_description"],
    afterDescription: json["after_description"],
    takenDate: json["taken_date"] == null ? null : DateTime.parse(json["taken_date"]),
    subcategoryName: json["subcategory_name"],
    categoryName: json["category_name"],
    beforeImage: json["before_image"],
    afterImage: json["after_image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "coins": coins,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "before_description": beforeDescription,
    "after_description": afterDescription,
    "taken_date": "${takenDate!.year.toString().padLeft(4, '0')}-${takenDate!.month.toString().padLeft(2, '0')}-${takenDate!.day.toString().padLeft(2, '0')}",
    "subcategory_name": subcategoryName,
    "category_name": categoryName,
    "before_image": beforeImage,
    "after_image": afterImage,
  };
}
