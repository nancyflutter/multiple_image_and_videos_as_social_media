import 'dart:convert';
// List<UserServiceResponse>? responseData;

class UserServiceResponse {
  int? id;
  String? serviceName;
  String? image;
  String? supplierAddress;
  String? chargePerPerson;
  String? latitude;
  String? longitude;
  int? otherCharges;
  dynamic rating;
  List<Time>? time;

  UserServiceResponse({
    this.id,
    this.serviceName,
    this.image,
    this.supplierAddress,
    this.chargePerPerson,
    this.latitude,
    this.longitude,
    this.otherCharges,
    this.rating,
    this.time,
  });

  UserServiceResponse copyWith({
    int? id,
    String? serviceName,
    String? image,
    String? supplierAddress,
    String? chargePerPerson,
    String? latitude,
    String? longitude,
    int? otherCharges,
    dynamic rating,
    List<Time>? time,
  }) =>
      UserServiceResponse(
        id: id ?? this.id,
        serviceName: serviceName ?? this.serviceName,
        image: image ?? this.image,
        supplierAddress: supplierAddress ?? this.supplierAddress,
        chargePerPerson: chargePerPerson ?? this.chargePerPerson,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        otherCharges: otherCharges ?? this.otherCharges,
        rating: rating ?? this.rating,
        time: time ?? this.time,
      );

  factory UserServiceResponse.fromRowJson(String str) => UserServiceResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory UserServiceResponse.fromJson(Map<String, dynamic> json) => UserServiceResponse(
    id: json["id"],
    serviceName: json["service_name"],
    image: json["image"],
    supplierAddress: json["supplier_address"],
    chargePerPerson: json["charge_per_person"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    otherCharges: json["other_charges"],
    rating: json["rating"],
    time: json["time"] == null ? [] : List<Time>.from(json["time"]!.map((x) => Time.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "service_name": serviceName,
    "image": image,
    "supplier_address": supplierAddress,
    "charge_per_person": chargePerPerson,
    "latitude": latitude,
    "longitude": longitude,
    "other_charges": otherCharges,
    "rating": rating,
    "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x.toMap())),
  };
}

class Time {
  String? day;
  String? startTime;
  String? endTime;
  int? flag;

  Time({
    this.day,
    this.startTime,
    this.endTime,
    this.flag,
  });

  Time copyWith({
    String? day,
    String? startTime,
    String? endTime,
    int? flag,
  }) =>
      Time(
        day: day ?? this.day,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        flag: flag ?? this.flag,
      );

  factory Time.fromJson(String str) => Time.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Time.fromMap(Map<String, dynamic> json) => Time(
    day: json["day"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    flag: json["flag"],
  );

  Map<String, dynamic> toMap() => {
    "day": day,
    "start_time": startTime,
    "end_time": endTime,
    "flag": flag,
  };
}
