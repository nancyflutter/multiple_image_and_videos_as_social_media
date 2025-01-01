import 'dart:convert';

class CoinMyHistoryPayLoad {
  String? userId;

  CoinMyHistoryPayLoad({
    this.userId,
  });

  CoinMyHistoryPayLoad copyWith({
    String? userId,
  }) =>
      CoinMyHistoryPayLoad(
        userId: userId ?? this.userId,
      );

  factory CoinMyHistoryPayLoad.fromJson(String str) => CoinMyHistoryPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoinMyHistoryPayLoad.fromMap(Map<String, dynamic> json) => CoinMyHistoryPayLoad(
    userId: json["user_id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
  };
}
