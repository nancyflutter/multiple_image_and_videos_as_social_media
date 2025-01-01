import 'dart:convert';

class FollowerDataPayLoad {
  String? userId;
  String? otherUserId;

  FollowerDataPayLoad({
    this.userId,
    this.otherUserId,
  });

  FollowerDataPayLoad copyWith({
    String? userId,
    String? otherUserId,
  }) =>
      FollowerDataPayLoad(
        userId: userId ?? this.userId,
        otherUserId: otherUserId ?? this.otherUserId,
      );

  factory FollowerDataPayLoad.fromJson(String str) => FollowerDataPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FollowerDataPayLoad.fromMap(Map<String, dynamic> json) => FollowerDataPayLoad(
    userId: json["user_id"],
    otherUserId: json["other_user_id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "other_user_id": otherUserId,
  };
}
