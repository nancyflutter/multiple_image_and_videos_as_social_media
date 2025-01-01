import 'dart:convert';

class UserServicePayLoad {
  String? supplier;
  String? sortBy;
  String? category;
  String? order;

  UserServicePayLoad({
    this.supplier,
    this.sortBy,
    this.category,
    this.order,
  });

  UserServicePayLoad copyWith({
    String? supplier,
    String? sortBy,
    String? category,
    String? order,
  }) =>
      UserServicePayLoad(
        supplier: supplier ?? this.supplier,
        sortBy: sortBy ?? this.sortBy,
        category: category ?? this.category,
        order: order ?? this.order,
      );

  factory UserServicePayLoad.fromJson(String str) => UserServicePayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserServicePayLoad.fromMap(Map<String, dynamic> json) => UserServicePayLoad(
    supplier: json["supplier"],
    sortBy: json["sort_by"],
    category: json["category"],
    order: json["order"],
  );

  Map<String, dynamic> toMap() => {
    "supplier": supplier,
    "sort_by": sortBy,
    "category": category,
    "order": order,
  };
}
