import 'dart:convert';

class CoinMyHistoryResponse {
  String? coinData;
  int? spentCoin;
  int? accumulatedCoin;
  String? label;
  String? totalAvailableCoin;
  CoinHistory? coinHistory;
  String? aedCoin;

  CoinMyHistoryResponse({
    this.coinData,
    this.spentCoin,
    this.accumulatedCoin,
    this.label,
    this.totalAvailableCoin,
    this.coinHistory,
    this.aedCoin,
  });

  CoinMyHistoryResponse copyWith({
    String? coinData,
    int? spentCoin,
    int? accumulatedCoin,
    String? label,
    String? totalAvailableCoin,
    CoinHistory? coinHistory,
    String? aedCoin,
  }) =>
      CoinMyHistoryResponse(
        coinData: coinData ?? this.coinData,
        spentCoin: spentCoin ?? this.spentCoin,
        accumulatedCoin: accumulatedCoin ?? this.accumulatedCoin,
        label: label ?? this.label,
        totalAvailableCoin: totalAvailableCoin ?? this.totalAvailableCoin,
        coinHistory: coinHistory ?? this.coinHistory,
        aedCoin: aedCoin ?? this.aedCoin,
      );

  factory CoinMyHistoryResponse.fromRowJson(String str) => CoinMyHistoryResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory CoinMyHistoryResponse.fromJson(Map<String, dynamic> json) => CoinMyHistoryResponse(
        coinData: json["coin_data"],
        spentCoin: json["spentCoin"],
        accumulatedCoin: json["accumulatedCoin"],
        label: json["label"],
        totalAvailableCoin: json["total_available_coin"],
        coinHistory: json["coin_history"] == null ? null : CoinHistory.fromMap(json["coin_history"]),
        aedCoin: json["aed_coin"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "coin_data": coinData,
        "spentCoin": spentCoin,
        "accumulatedCoin": accumulatedCoin,
        "label": label,
        "total_available_coin": totalAvailableCoin,
        "coin_history": coinHistory?.toMap(),
        "aed_coin": aedCoin,
      };
}

class CoinHistory {
  int? from;
  List<Datum>? data;
  dynamic prevPageUrl;
  String? path;
  String? firstPageUrl;
  int? perPage;
  int? currentPage;
  dynamic nextPageUrl;
  int? to;
  String? lastPageUrl;
  int? total;
  int? lastPage;

  CoinHistory({
    this.from,
    this.data,
    this.prevPageUrl,
    this.path,
    this.firstPageUrl,
    this.perPage,
    this.currentPage,
    this.nextPageUrl,
    this.to,
    this.lastPageUrl,
    this.total,
    this.lastPage,
  });

  CoinHistory copyWith({
    int? from,
    List<Datum>? data,
    dynamic prevPageUrl,
    String? path,
    String? firstPageUrl,
    int? perPage,
    int? currentPage,
    dynamic nextPageUrl,
    int? to,
    String? lastPageUrl,
    int? total,
    int? lastPage,
  }) =>
      CoinHistory(
        from: from ?? this.from,
        data: data ?? this.data,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        path: path ?? this.path,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        to: to ?? this.to,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        total: total ?? this.total,
        lastPage: lastPage ?? this.lastPage,
      );

  factory CoinHistory.fromJson(String str) => CoinHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoinHistory.fromMap(Map<String, dynamic> json) => CoinHistory(
        from: json["from"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        prevPageUrl: json["prev_page_url"],
        path: json["path"],
        firstPageUrl: json["first_page_url"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        nextPageUrl: json["next_page_url"],
        to: json["to"],
        lastPageUrl: json["last_page_url"],
        total: json["total"],
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toMap() => {
        "from": from,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "prev_page_url": prevPageUrl,
        "path": path,
        "first_page_url": firstPageUrl,
        "per_page": perPage,
        "current_page": currentPage,
        "next_page_url": nextPageUrl,
        "to": to,
        "last_page_url": lastPageUrl,
        "total": total,
        "last_page": lastPage,
      };
}

class Datum {
  DateTime? updatedAt;
  int? bookingId;
  double? earn;
  dynamic refUserId;
  int? id;
  int? status;
  String? coinName;
  DateTime? createdAt;
  dynamic rateId;
  String? coin;
  int? userId;

  Datum({
    this.updatedAt,
    this.bookingId,
    this.earn,
    this.refUserId,
    this.id,
    this.status,
    this.coinName,
    this.createdAt,
    this.rateId,
    this.coin,
    this.userId,
  });

  Datum copyWith({
    DateTime? updatedAt,
    int? bookingId,
    double? earn,
    dynamic refUserId,
    int? id,
    int? status,
    String? coinName,
    DateTime? createdAt,
    dynamic rateId,
    String? coin,
    int? userId,
  }) =>
      Datum(
        updatedAt: updatedAt ?? this.updatedAt,
        bookingId: bookingId ?? this.bookingId,
        earn: earn ?? this.earn,
        refUserId: refUserId ?? this.refUserId,
        id: id ?? this.id,
        status: status ?? this.status,
        coinName: coinName ?? this.coinName,
        createdAt: createdAt ?? this.createdAt,
        rateId: rateId ?? this.rateId,
        coin: coin ?? this.coin,
        userId: userId ?? this.userId,
      );

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        bookingId: json["booking_id"],
        earn: json["earn"]?.toDouble(),
        refUserId: json["ref_user_id"],
        id: json["id"],
        status: json["status"],
        coinName: json["coin_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        rateId: json["rate_id"],
        coin: json["coin"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "updated_at": updatedAt?.toIso8601String(),
        "booking_id": bookingId,
        "earn": earn,
        "ref_user_id": refUserId,
        "id": id,
        "status": status,
        "coin_name": coinName,
        "created_at": createdAt?.toIso8601String(),
        "rate_id": rateId,
        "coin": coin,
        "user_id": userId,
      };
}
