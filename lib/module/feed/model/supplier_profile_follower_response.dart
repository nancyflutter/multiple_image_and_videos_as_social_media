import 'dart:convert';

class SupplierProfileFollowerResponse {
  String? responseCode;
  int? status;
  dynamic error;
  List<ResponseDatum>? responseData;
  int? followersCount;

  SupplierProfileFollowerResponse({
    this.responseCode,
    this.status,
    this.error,
    this.responseData,
    this.followersCount,
  });

  SupplierProfileFollowerResponse copyWith({
    String? responseCode,
    int? status,
    dynamic error,
    List<ResponseDatum>? responseData,
    int? followersCount,
  }) =>
      SupplierProfileFollowerResponse(
        responseCode: responseCode ?? this.responseCode,
        status: status ?? this.status,
        error: error ?? this.error,
        responseData: responseData ?? this.responseData,
        followersCount: followersCount ?? this.followersCount,
      );

  factory SupplierProfileFollowerResponse.fromJson(String str) => SupplierProfileFollowerResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SupplierProfileFollowerResponse.fromMap(Map<String, dynamic> json) => SupplierProfileFollowerResponse(
    responseCode: json["ResponseCode"].toString(),
    status: json["status"],
    error: json["error"],
    responseData: json["ResponseData"] == null ? [] : List<ResponseDatum>.from(json["ResponseData"]!.map((x) => ResponseDatum.fromMap(x))),
    followersCount: json["followers_count"],
  );

  Map<String, dynamic> toMap() => {
    "ResponseCode": responseCode,
    "status": status,
    "error": error,
    "ResponseData": responseData == null ? [] : List<dynamic>.from(responseData!.map((x) => x.toMap())),
    "followers_count": followersCount,
  };
}

class ResponseDatum {
  int? id;
  int? supplierId;
  int? followingUserId;
  int? allow;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  String? name;
  String? image;
  int? follow;

  ResponseDatum({
    this.id,
    this.supplierId,
    this.followingUserId,
    this.allow,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.name,
    this.image,
    this.follow,
  });

  ResponseDatum copyWith({
    int? id,
    int? supplierId,
    int? followingUserId,
    int? allow,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userId,
    String? name,
    String? image,
    int? follow,
  }) =>
      ResponseDatum(
        id: id ?? this.id,
        supplierId: supplierId ?? this.supplierId,
        followingUserId: followingUserId ?? this.followingUserId,
        allow: allow ?? this.allow,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        image: image ?? this.image,
        follow: follow ?? this.follow,
      );

  factory ResponseDatum.fromJson(String str) => ResponseDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDatum.fromMap(Map<String, dynamic> json) => ResponseDatum(
    id: json["id"],
    supplierId: json["supplier_id"],
    followingUserId: json["following_user_id"],
    allow: json["allow"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    name: json["name"],
    image: json["image"],
    follow: json["follow"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "supplier_id": supplierId,
    "following_user_id": followingUserId,
    "allow": allow,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_id": userId,
    "name": name,
    "image": image,
    "follow": follow,
  };
}
