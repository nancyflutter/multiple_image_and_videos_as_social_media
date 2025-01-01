import 'dart:convert';

class UserFollowAddSupplierPayLoad {
  String? followingId;
  int? follow;
  String? supplierId;

  UserFollowAddSupplierPayLoad({
    this.followingId,
    this.follow,
    this.supplierId,
  });

  UserFollowAddSupplierPayLoad copyWith({
    String? followingId,
    int? follow,
    String? supplierId,
  }) =>
      UserFollowAddSupplierPayLoad(
        followingId: followingId ?? this.followingId,
        follow: follow ?? this.follow,
        supplierId: supplierId ?? this.supplierId,
      );

  factory UserFollowAddSupplierPayLoad.fromJson(String str) => UserFollowAddSupplierPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserFollowAddSupplierPayLoad.fromMap(Map<String, dynamic> json) => UserFollowAddSupplierPayLoad(
    followingId: json["following_id"],
    follow: json["follow"],
    supplierId: json["supplier_id"],
  );

  Map<String, dynamic> toMap() => {
    "following_id": followingId,
    "follow": follow,
    "supplier_id": supplierId,
  };
}
