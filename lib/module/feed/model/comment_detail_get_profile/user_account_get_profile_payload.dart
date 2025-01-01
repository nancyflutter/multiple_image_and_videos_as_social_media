import 'dart:convert';

class UserAccountGetProfilePayLoad {
  String? userId;
  String? loginUserId;

  UserAccountGetProfilePayLoad({
    this.userId,
    this.loginUserId,
  });

  UserAccountGetProfilePayLoad copyWith({
    String? userId,
    String? loginUserId,
  }) =>
      UserAccountGetProfilePayLoad(
        userId: userId ?? this.userId,
        loginUserId: loginUserId ?? this.loginUserId,
      );

  factory UserAccountGetProfilePayLoad.fromJson(String str) => UserAccountGetProfilePayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAccountGetProfilePayLoad.fromMap(Map<String, dynamic> json) => UserAccountGetProfilePayLoad(
    userId: json["user_id"],
    loginUserId: json["login_user_id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "login_user_id": loginUserId,
  };
}
