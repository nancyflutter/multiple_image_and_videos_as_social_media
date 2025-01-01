import "dart:convert";

import "package:flutter/material.dart";

class BottomNavigationItemModel {
  Color? selectedColor;
  String? icon;
  String? title;

  BottomNavigationItemModel({
    this.selectedColor,
    this.icon,
    this.title,
  });

  BottomNavigationItemModel copyWith({
    Color? selectedColor,
    String? icon,
    String? title,
  }) =>
      BottomNavigationItemModel(
        selectedColor: selectedColor ?? this.selectedColor,
        icon: icon ?? this.icon,
        title: title ?? this.title,
      );

  factory BottomNavigationItemModel.fromJson(String str) => BottomNavigationItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BottomNavigationItemModel.fromMap(Map<String, dynamic> json) => BottomNavigationItemModel(
    selectedColor: json["selectedColor"],
    icon: json["icon"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "selectedColor": selectedColor,
    "icon": icon,
    "title": title,
  };
}
