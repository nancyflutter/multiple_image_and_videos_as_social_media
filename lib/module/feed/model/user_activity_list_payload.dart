import 'dart:convert';

class UserActivityListPayLoad {
  String? userId;
  String? type;

  UserActivityListPayLoad({
    this.userId,
    this.type,
  });

  UserActivityListPayLoad copyWith({
    String? userId,
    String? type,
  }) =>
      UserActivityListPayLoad(
        userId: userId ?? this.userId,
        type: type ?? this.type,
      );

  factory UserActivityListPayLoad.fromJson(String str) => UserActivityListPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserActivityListPayLoad.fromMap(Map<String, dynamic> json) => UserActivityListPayLoad(
    userId: json["user_id"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "type": type,
  };
}
