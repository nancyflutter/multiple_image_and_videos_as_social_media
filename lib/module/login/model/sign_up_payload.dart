import 'dart:convert';

class SignUpPayload {
  String? mobileCode;
  String? deviceId;
  String? gender;
  String? loginType;
  String? userRefferal;
  String? mobile;
  String? deviceType;
  String? version;
  String? confirmPassword;
  String? manufacturer;
  String? password;
  String? fullName;
  String? deviceToken;
  String? model;
  String? email;

  SignUpPayload({
    this.mobileCode,
    this.deviceId,
    this.gender,
    this.loginType,
    this.userRefferal,
    this.mobile,
    this.deviceType,
    this.version,
    this.confirmPassword,
    this.manufacturer,
    this.password,
    this.fullName,
    this.deviceToken,
    this.model,
    this.email,
  });

  SignUpPayload copyWith({
    String? mobileCode,
    String? deviceId,
    String? gender,
    String? loginType,
    String? userRefferal,
    String? mobile,
    String? deviceType,
    String? version,
    String? confirmPassword,
    String? manufacturer,
    String? password,
    String? fullName,
    String? deviceToken,
    String? model,
    String? email,
  }) =>
      SignUpPayload(
        mobileCode: mobileCode ?? this.mobileCode,
        deviceId: deviceId ?? this.deviceId,
        gender: gender ?? this.gender,
        loginType: loginType ?? this.loginType,
        userRefferal: userRefferal ?? this.userRefferal,
        mobile: mobile ?? this.mobile,
        deviceType: deviceType ?? this.deviceType,
        version: version ?? this.version,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        manufacturer: manufacturer ?? this.manufacturer,
        password: password ?? this.password,
        fullName: fullName ?? this.fullName,
        deviceToken: deviceToken ?? this.deviceToken,
        model: model ?? this.model,
        email: email ?? this.email,
      );

  factory SignUpPayload.fromJson(String str) => SignUpPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpPayload.fromMap(Map<String, dynamic> json) => SignUpPayload(
    mobileCode: json["mobile_code"],
    deviceId: json["device_id"],
    gender: json["gender"],
    loginType: json["login_type"],
    userRefferal: json["user_refferal"],
    mobile: json["mobile"],
    deviceType: json["device_type"],
    version: json["version"],
    confirmPassword: json["confirm_password"],
    manufacturer: json["manufacturer"],
    password: json["password"],
    fullName: json["full_name"],
    deviceToken: json["device_token"],
    model: json["model"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "mobile_code": mobileCode,
    "device_id": deviceId,
    "gender": gender,
    "login_type": loginType,
    "user_refferal": userRefferal,
    "mobile": mobile,
    "device_type": deviceType,
    "version": version,
    "confirm_password": confirmPassword,
    "manufacturer": manufacturer,
    "password": password,
    "full_name": fullName,
    "device_token": deviceToken,
    "model": model,
    "email": email,
  };
}
