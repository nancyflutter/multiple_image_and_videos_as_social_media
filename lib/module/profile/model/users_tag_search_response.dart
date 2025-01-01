import 'dart:convert';
// List<UsersTagSearchResponse>? responseData;

class UsersTagSearchResponse {
  int? id;
  String? serviceName;
  String? supplierAddress;
  String? image;

  UsersTagSearchResponse({
    this.id,
    this.serviceName,
    this.supplierAddress,
    this.image,
  });

  UsersTagSearchResponse copyWith({
    int? id,
    String? serviceName,
    String? supplierAddress,
    String? image,
  }) =>
      UsersTagSearchResponse(
        id: id ?? this.id,
        serviceName: serviceName ?? this.serviceName,
        supplierAddress: supplierAddress ?? this.supplierAddress,
        image: image ?? this.image,
      );

  factory UsersTagSearchResponse.fromRowJson(String str) => UsersTagSearchResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory UsersTagSearchResponse.fromJson(Map<String, dynamic> json) => UsersTagSearchResponse(
        id: json["id"],
        serviceName: json["service_name"],
        supplierAddress: json["supplier_address"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "service_name": serviceName,
        "supplier_address": supplierAddress,
        "image": image,
      };
}
