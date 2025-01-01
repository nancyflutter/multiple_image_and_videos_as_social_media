import 'dart:convert';

class BookmarkPayload {
  String? userId;
  String? bookmarkType;

  BookmarkPayload({
    this.userId,
    this.bookmarkType,
  });

  BookmarkPayload copyWith({
    String? userId,
    String? bookmarkType,
  }) =>
      BookmarkPayload(
        userId: userId ?? this.userId,
        bookmarkType: bookmarkType ?? this.bookmarkType,
      );

  factory BookmarkPayload.fromJson(String str) => BookmarkPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookmarkPayload.fromMap(Map<String, dynamic> json) => BookmarkPayload(
    userId: json["user_id"],
    bookmarkType: json["bookmark_type"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "bookmark_type": bookmarkType,
  };
}
