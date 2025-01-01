import 'dart:convert';

class GetRestaurantsPayload {
  String? latitude;
  String? longitude;

  GetRestaurantsPayload({
    this.latitude,
    this.longitude,
  });

  GetRestaurantsPayload copyWith({
    String? latitude,
    String? longitude,
  }) =>
      GetRestaurantsPayload(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory GetRestaurantsPayload.fromJson(String str) => GetRestaurantsPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetRestaurantsPayload.fromMap(Map<String, dynamic> json) => GetRestaurantsPayload(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
