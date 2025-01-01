import 'dart:convert';

class CuiSineResponse {
  int? id;
  String? cuisineId;
  String? cuisineType;
  String? cuisineName;
  String? cuisineImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  CuiSineResponse({
    this.id,
    this.cuisineId,
    this.cuisineType,
    this.cuisineName,
    this.cuisineImage,
    this.createdAt,
    this.updatedAt,
  });

  CuiSineResponse copyWith({
    int? id,
    String? cuisineId,
    String? cuisineType,
    String? cuisineName,
    String? cuisineImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CuiSineResponse(
        id: id ?? this.id,
        cuisineId: cuisineId ?? this.cuisineId,
        cuisineType: cuisineType ?? this.cuisineType,
        cuisineName: cuisineName ?? this.cuisineName,
        cuisineImage: cuisineImage ?? this.cuisineImage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CuiSineResponse.fromRowJson(String str) => CuiSineResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory CuiSineResponse.fromJson(Map<String, dynamic> json) => CuiSineResponse(
        id: json["id"],
        cuisineId: json["cuisine_id"],
        cuisineType: json["cuisine_type"],
        cuisineName: json["cuisine_name"],
        cuisineImage: json["cuisine_image"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cuisine_id": cuisineId,
        "cuisine_type": cuisineType,
        "cuisine_name": cuisineName,
        "cuisine_image": cuisineImage,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
