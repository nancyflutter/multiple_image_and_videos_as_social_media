import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FilterRestaurant {
  String? id;
  String? name;
  RxBool isSelected = RxBool(false);

  FilterRestaurant({
    this.id,
    this.name,
  });

  FilterRestaurant copyWith({
    String? id,
    String? name,
  }) =>
      FilterRestaurant(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory FilterRestaurant.fromJson(String str) => FilterRestaurant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FilterRestaurant.fromMap(Map<String, dynamic> json) => FilterRestaurant(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
