import 'dart:convert';

class FollowingDataResponse {
  String? responseCode;
  int? status;
  dynamic error;
  List<ResponseDatum>? responseData;
  int? followingCount;

  FollowingDataResponse({
    this.responseCode,
    this.status,
    this.error,
    this.responseData,
    this.followingCount,
  });

  FollowingDataResponse copyWith({
    String? responseCode,
    int? status,
    dynamic error,
    List<ResponseDatum>? responseData,
    int? followingCount,
  }) =>
      FollowingDataResponse(
        responseCode: responseCode ?? this.responseCode,
        status: status ?? this.status,
        error: error ?? this.error,
        responseData: responseData ?? this.responseData,
        followingCount: followingCount ?? this.followingCount,
      );

  factory FollowingDataResponse.fromJson(String str) => FollowingDataResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FollowingDataResponse.fromMap(Map<String, dynamic> json) => FollowingDataResponse(
    responseCode: json["ResponseCode"].toString(),
    status: json["status"],
    error: json["error"],
    responseData: json["ResponseData"] == null ? [] : List<ResponseDatum>.from(json["ResponseData"]!.map((x) => ResponseDatum.fromMap(x))),
    followingCount: json["following_count"],
  );

  Map<String, dynamic> toMap() => {
    "ResponseCode": responseCode,
    "status": status,
    "error": error,
    "ResponseData": responseData == null ? [] : List<dynamic>.from(responseData!.map((x) => x.toMap())),
    "following_count": followingCount,
  };
}

class ResponseDatum {
  int? id;
  int? followingUserId;
  int? followerUserId;
  int? allow;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  String? name;
  String? image;
  int? follow;
  String? type;

  ResponseDatum({
    this.id,
    this.followingUserId,
    this.followerUserId,
    this.allow,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.name,
    this.image,
    this.follow,
    this.type,
  });

  ResponseDatum copyWith({
    int? id,
    int? followingUserId,
    int? followerUserId,
    int? allow,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userId,
    String? name,
    String? image,
    int? follow,
    String? type,
  }) =>
      ResponseDatum(
        id: id ?? this.id,
        followingUserId: followingUserId ?? this.followingUserId,
        followerUserId: followerUserId ?? this.followerUserId,
        allow: allow ?? this.allow,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        image: image ?? this.image,
        follow: follow ?? this.follow,
        type: type ?? this.type,
      );

  factory ResponseDatum.fromJson(String str) => ResponseDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDatum.fromMap(Map<String, dynamic> json) => ResponseDatum(
    id: json["id"],
    followingUserId: json["following_user_id"],
    followerUserId: json["follower_user_id"],
    allow: json["allow"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    name: json["name"],
    image: json["image"],
    follow: json["follow"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "following_user_id": followingUserId,
    "follower_user_id": followerUserId,
    "allow": allow,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_id": userId,
    "name": name,
    "image": image,
    "follow": follow,
    "type": type,
  };
}
