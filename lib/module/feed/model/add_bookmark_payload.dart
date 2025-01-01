import 'dart:convert';

class AddBookMarkPayLoad {
  String? bookmarkId;
  String? userId;
  String? bookmarkType;

  AddBookMarkPayLoad({
    this.bookmarkId,
    this.userId,
    this.bookmarkType,
  });

  AddBookMarkPayLoad copyWith({
    String? bookmarkId,
    String? userId,
    String? bookmarkType,
  }) =>
      AddBookMarkPayLoad(
        bookmarkId: bookmarkId ?? this.bookmarkId,
        userId: userId ?? this.userId,
        bookmarkType: bookmarkType ?? this.bookmarkType,
      );

  factory AddBookMarkPayLoad.fromJson(String str) => AddBookMarkPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddBookMarkPayLoad.fromMap(Map<String, dynamic> json) => AddBookMarkPayLoad(
    bookmarkId: json["bookmark_id"],
    userId: json["user_id"],
    bookmarkType: json["bookmark_type"],
  );

  Map<String, dynamic> toMap() => {
    "bookmark_id": bookmarkId,
    "user_id": userId,
    "bookmark_type": bookmarkType,
  };
}
