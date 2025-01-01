import 'dart:convert';

class LoginPayload {
  String? email;
  String? password;
  String? deviceToken;
  String? deviceId;
  String? deviceType;
  String? model;
  String? version;
  String? manufacturer;

  LoginPayload({
    this.email,
    this.password,
    this.deviceToken,
    this.deviceId,
    this.deviceType,
    this.model,
    this.version,
    this.manufacturer,
  });

  LoginPayload copyWith({
    String? email,
    String? password,
    String? deviceToken,
    String? deviceId,
    String? deviceType,
    String? model,
    String? version,
    String? manufacturer,
  }) =>
      LoginPayload(
        email: email ?? this.email,
        password: password ?? this.password,
        deviceToken: deviceToken ?? this.deviceToken,
        deviceId: deviceId ?? this.deviceId,
        deviceType: deviceType ?? this.deviceType,
        model: model ?? this.model,
        version: version ?? this.version,
        manufacturer: manufacturer ?? this.manufacturer,
      );

  factory LoginPayload.fromJson(String str) => LoginPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginPayload.fromMap(Map<String, dynamic> json) => LoginPayload(
        email: json["email"],
        password: json["password"],
        deviceToken: json["device_token"],
        deviceId: json["device_id"],
        deviceType: json["device_type"],
        model: json["model"],
        version: json["version"],
        manufacturer: json["manufacturer"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "device_token": deviceToken,
        "device_id": deviceId,
        "device_type": deviceType,
        "model": model,
        "version": version,
        "manufacturer": manufacturer,
      };
}
