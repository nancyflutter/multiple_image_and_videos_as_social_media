import 'dart:convert';

class RestaurantBookingPayload {
  String? userId;
  String? timeZone;
  String? bookId;

  RestaurantBookingPayload({
    this.userId,
    this.timeZone,
    this.bookId,
  });

  RestaurantBookingPayload copyWith({
    String? userId,
    String? timeZone,
    String? bookId,
  }) =>
      RestaurantBookingPayload(
        userId: userId ?? this.userId,
        timeZone: timeZone ?? this.timeZone,
        bookId: bookId ?? this.bookId,
      );

  factory RestaurantBookingPayload.fromJson(String str) => RestaurantBookingPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantBookingPayload.fromMap(Map<String, dynamic> json) => RestaurantBookingPayload(
    userId: json["user_id"],
    timeZone: json["timeZone"],
    bookId: json["book_id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "timeZone": timeZone,
    "book_id": bookId,
  };
}
