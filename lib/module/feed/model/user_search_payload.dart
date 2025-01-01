import 'dart:convert';

class UserSearchPayLoad {
  String? search;
  String? userId;

  UserSearchPayLoad({
    this.search,
    this.userId,
  });

  UserSearchPayLoad copyWith({
    String? search,
    String? userId,
  }) =>
      UserSearchPayLoad(
        search: search ?? this.search,
        userId: userId ?? this.userId,
      );

  factory UserSearchPayLoad.fromJson(String str) => UserSearchPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserSearchPayLoad.fromMap(Map<String, dynamic> json) => UserSearchPayLoad(
    search: json["search"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toMap() => {
    "search": search,
    "user_id": userId,
  };
}
