import 'dart:convert';

class CountRestaurantTaxResponse {
  int? id;
  String? tax;
  int? deliveryCharge;
  String? convenienceFee;
  String? pickupLocationToProviderLimit;
  String? providerLocationToDropLimit;
  String? deliveryKm;
  String? deliveryRate;
  String? pickupDistance;
  String? pickupDuration;
  String? dropDistance;
  String? dropDuration;
  String? availableCoins;
  String? priceCoin;

  CountRestaurantTaxResponse({
    this.id,
    this.tax,
    this.deliveryCharge,
    this.convenienceFee,
    this.pickupLocationToProviderLimit,
    this.providerLocationToDropLimit,
    this.deliveryKm,
    this.deliveryRate,
    this.pickupDistance,
    this.pickupDuration,
    this.dropDistance,
    this.dropDuration,
    this.availableCoins,
    this.priceCoin,
  });

  CountRestaurantTaxResponse copyWith({
    int? id,
    String? tax,
    int? deliveryCharge,
    String? convenienceFee,
    String? pickupLocationToProviderLimit,
    String? providerLocationToDropLimit,
    String? deliveryKm,
    String? deliveryRate,
    String? pickupDistance,
    String? pickupDuration,
    String? dropDistance,
    String? dropDuration,
    String? availableCoins,
    String? priceCoin,
  }) =>
      CountRestaurantTaxResponse(
        id: id ?? this.id,
        tax: tax ?? this.tax,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        convenienceFee: convenienceFee ?? this.convenienceFee,
        pickupLocationToProviderLimit: pickupLocationToProviderLimit ?? this.pickupLocationToProviderLimit,
        providerLocationToDropLimit: providerLocationToDropLimit ?? this.providerLocationToDropLimit,
        deliveryKm: deliveryKm ?? this.deliveryKm,
        deliveryRate: deliveryRate ?? this.deliveryRate,
        pickupDistance: pickupDistance ?? this.pickupDistance,
        pickupDuration: pickupDuration ?? this.pickupDuration,
        dropDistance: dropDistance ?? this.dropDistance,
        dropDuration: dropDuration ?? this.dropDuration,
        availableCoins: availableCoins ?? this.availableCoins,
        priceCoin: priceCoin ?? this.priceCoin,
      );

  factory CountRestaurantTaxResponse.fromRawJson(String str) => CountRestaurantTaxResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountRestaurantTaxResponse.fromJson(Map<String, dynamic> json) => CountRestaurantTaxResponse(
    id: json["id"],
    tax: json["tax"],
    deliveryCharge: json["delivery_charge"],
    convenienceFee: json["convenience_fee"],
    pickupLocationToProviderLimit: json["pickup_location_to_provider_limit"],
    providerLocationToDropLimit: json["provider_location_to_drop_limit"],
    deliveryKm: json["delivery_km"],
    deliveryRate: json["delivery_rate"],
    pickupDistance: json["pickup_distance"],
    pickupDuration: json["pickup_duration"],
    dropDistance: json["drop_distance"],
    dropDuration: json["drop_duration"],
    availableCoins: json["available_coins"],
    priceCoin: json["price_coin"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tax": tax,
    "delivery_charge": deliveryCharge,
    "convenience_fee": convenienceFee,
    "pickup_location_to_provider_limit": pickupLocationToProviderLimit,
    "provider_location_to_drop_limit": providerLocationToDropLimit,
    "delivery_km": deliveryKm,
    "delivery_rate": deliveryRate,
    "pickup_distance": pickupDistance,
    "pickup_duration": pickupDuration,
    "drop_distance": dropDistance,
    "drop_duration": dropDuration,
    "available_coins": availableCoins,
    "price_coin": priceCoin,
  };
}
