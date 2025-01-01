import 'dart:convert';

class GetSimilarRestaurantsPayload {
  String? restaurantId;
  String? cuisineId;

  GetSimilarRestaurantsPayload({
    this.restaurantId,
    this.cuisineId,
  });

  GetSimilarRestaurantsPayload copyWith({
    String? restaurantId,
    String? cuisineId,
  }) =>
      GetSimilarRestaurantsPayload(
        restaurantId: restaurantId ?? this.restaurantId,
        cuisineId: cuisineId ?? this.cuisineId,
      );

  factory GetSimilarRestaurantsPayload.fromJson(String str) => GetSimilarRestaurantsPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetSimilarRestaurantsPayload.fromMap(Map<String, dynamic> json) => GetSimilarRestaurantsPayload(
    restaurantId: json["restaurant_id"],
    cuisineId: json["cuisine_id"],
  );

  Map<String, dynamic> toMap() => {
    "restaurant_id": restaurantId,
    "cuisine_id": cuisineId,
  };
}
