import 'dart:convert';

class CountRestaurantTaxPayload {
  String? isCab;
  String? pickupLng;
  String? dropLat;
  String? userId;
  String? restaurantLng;
  String? restaurantLat;
  String? dropLng;
  String? pickupLat;

  CountRestaurantTaxPayload({
    this.isCab,
    this.pickupLng,
    this.dropLat,
    this.userId,
    this.restaurantLng,
    this.restaurantLat,
    this.dropLng,
    this.pickupLat,
  });

  CountRestaurantTaxPayload copyWith({
    String? isCab,
    String? pickupLng,
    String? dropLat,
    String? userId,
    String? restaurantLng,
    String? restaurantLat,
    String? dropLng,
    String? pickupLat,
  }) =>
      CountRestaurantTaxPayload(
        isCab: isCab ?? this.isCab,
        pickupLng: pickupLng ?? this.pickupLng,
        dropLat: dropLat ?? this.dropLat,
        userId: userId ?? this.userId,
        restaurantLng: restaurantLng ?? this.restaurantLng,
        restaurantLat: restaurantLat ?? this.restaurantLat,
        dropLng: dropLng ?? this.dropLng,
        pickupLat: pickupLat ?? this.pickupLat,
      );

  factory CountRestaurantTaxPayload.fromJson(String str) => CountRestaurantTaxPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountRestaurantTaxPayload.fromMap(Map<String, dynamic> json) => CountRestaurantTaxPayload(
    isCab: json["is_cab"],
    pickupLng: json["pickup_lng"],
    dropLat: json["drop_lat"],
    userId: json["user_id"],
    restaurantLng: json["restaurant_lng"],
    restaurantLat: json["restaurant_lat"],
    dropLng: json["drop_lng"],
    pickupLat: json["pickup_lat"],
  );

  Map<String, dynamic> toMap() => {
    "is_cab": isCab,
    "pickup_lng": pickupLng,
    "drop_lat": dropLat,
    "user_id": userId,
    "restaurant_lng": restaurantLng,
    "restaurant_lat": restaurantLat,
    "drop_lng": dropLng,
    "pickup_lat": pickupLat,
  };
}
