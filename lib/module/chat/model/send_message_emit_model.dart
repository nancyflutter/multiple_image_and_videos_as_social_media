import 'dart:convert';

class SendMessageEmitModel {
  String? bookId;
  String? userId;
  String? serviceId;
  String? to;
  String? from;
  String? message;
  String? type;
  String? userName;
  String? img;
  int? page;

  SendMessageEmitModel({this.bookId, this.userId, this.serviceId, this.to, this.from, this.message, this.type, this.userName, this.img, this.page});

  SendMessageEmitModel copyWith({
    String? bookId,
    String? userId,
    String? serviceId,
    String? to,
    String? from,
    String? message,
    String? type,
    String? userName,
    String? img,
    int? page,
  }) =>
      SendMessageEmitModel(
        bookId: bookId ?? this.bookId,
        userId: userId ?? this.userId,
        serviceId: serviceId ?? this.serviceId,
        to: to ?? this.to,
        from: from ?? this.from,
        message: message ?? this.message,
        type: type ?? this.type,
        userName: userName ?? this.userName,
        img: img ?? this.img,
        page: page ?? this.page,
      );

  factory SendMessageEmitModel.fromJson(String str) => SendMessageEmitModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SendMessageEmitModel.fromMap(Map<String, dynamic> json) => SendMessageEmitModel(
        bookId: json["book_id"],
        userId: json["user_id"],
        serviceId: json["service_id"],
        to: json["to"],
        from: json["from"],
        message: json["message"],
        type: json["type"],
        userName: json["user_name"],
        img: json["img"],
        page: json["page"],
      );

  Map<String, dynamic> toMap() => {
        if (bookId != null) "book_id": bookId,
        if (userId != null) "user_id": userId,
        if (serviceId != null) "service_id": serviceId,
        if (to != null) "to": to,
        if (from != null) "from": from,
        if (message != null) "message": message,
        if (type != null) "type": type,
        if (userName != null) "user_name": userName,
        if (img != null) "img": img,
        if (page != null) "page": page,
      };
}
