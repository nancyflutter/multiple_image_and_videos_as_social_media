import 'dart:convert';

class PostPayLoad {
  String? userId;

  PostPayLoad({
    this.userId,
  });

  PostPayLoad copyWith({
    String? userId,
  }) =>
      PostPayLoad(
        userId: userId ?? this.userId,
      );

  factory PostPayLoad.fromJson(String str) => PostPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostPayLoad.fromMap(Map<String, dynamic> json) => PostPayLoad(
    userId: json["user_id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
  };
}
