import 'dart:convert';

class FollowingDataPayLoad {
  String? userId;
  String? loginUserId;

  FollowingDataPayLoad({
    this.userId,
    this.loginUserId,
  });

  FollowingDataPayLoad copyWith({
    String? userId,
    String? loginUserId,
  }) =>
      FollowingDataPayLoad(
        userId: userId ?? this.userId,
        loginUserId: loginUserId ?? this.loginUserId,
      );

  factory FollowingDataPayLoad.fromJson(String str) => FollowingDataPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FollowingDataPayLoad.fromMap(Map<String, dynamic> json) => FollowingDataPayLoad(
    userId: json["user_id"],
    loginUserId: json["login_user_id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "login_user_id": loginUserId,
  };
}
