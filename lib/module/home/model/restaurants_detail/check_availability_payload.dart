import 'dart:convert';

class CheckAvailabilityPayload {
  String? latestStartTime;
  String? restaurantId;
  String? earliestStartTime;
  String? covers;

  CheckAvailabilityPayload({
    this.latestStartTime,
    this.restaurantId,
    this.earliestStartTime,
    this.covers,
  });

  CheckAvailabilityPayload copyWith({
    String? latestStartTime,
    String? restaurantId,
    String? earliestStartTime,
    String? covers,
  }) =>
      CheckAvailabilityPayload(
        latestStartTime: latestStartTime ?? this.latestStartTime,
        restaurantId: restaurantId ?? this.restaurantId,
        earliestStartTime: earliestStartTime ?? this.earliestStartTime,
        covers: covers ?? this.covers,
      );

  factory CheckAvailabilityPayload.fromJson(String str) => CheckAvailabilityPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckAvailabilityPayload.fromMap(Map<String, dynamic> json) => CheckAvailabilityPayload(
    latestStartTime: json["latest_start_time"],
    restaurantId: json["restaurant_id"],
    earliestStartTime: json["earliest_start_time"],
    covers: json["covers"],
  );

  Map<String, dynamic> toMap() => {
    "latest_start_time": latestStartTime,
    "restaurant_id": restaurantId,
    "earliest_start_time": earliestStartTime,
    "covers": covers,
  };
}
