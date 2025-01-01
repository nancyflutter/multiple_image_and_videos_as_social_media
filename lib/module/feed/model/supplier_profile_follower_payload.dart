import 'dart:convert';

class SupplierProfileFollowerPayLoad {
  String? userId;
  String? supplierId;

  SupplierProfileFollowerPayLoad({
    this.userId,
    this.supplierId,
  });

  SupplierProfileFollowerPayLoad copyWith({
    String? userId,
    String? supplierId,
  }) =>
      SupplierProfileFollowerPayLoad(
        userId: userId ?? this.userId,
        supplierId: supplierId ?? this.supplierId,
      );

  factory SupplierProfileFollowerPayLoad.fromJson(String str) => SupplierProfileFollowerPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SupplierProfileFollowerPayLoad.fromMap(Map<String, dynamic> json) => SupplierProfileFollowerPayLoad(
    userId: json["user_id"],
    supplierId: json["supplier_id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "supplier_id": supplierId,
  };
}
