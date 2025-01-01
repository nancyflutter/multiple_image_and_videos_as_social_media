import 'dart:convert';

class UsersTagSearchPayLoad {
  String? search;

  UsersTagSearchPayLoad({
    this.search,
  });

  UsersTagSearchPayLoad copyWith({
    String? search,
  }) =>
      UsersTagSearchPayLoad(
        search: search ?? this.search,
      );

  factory UsersTagSearchPayLoad.fromJson(String str) => UsersTagSearchPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersTagSearchPayLoad.fromMap(Map<String, dynamic> json) => UsersTagSearchPayLoad(
    search: json["search"],
  );

  Map<String, dynamic> toMap() => {
    "search": search,
  };
}
