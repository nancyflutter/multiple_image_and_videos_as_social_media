import 'dart:convert';

class GetChatHistoryResponse {
  List<ChatListElement>? list;
  List<ChatImage>? images;
  String? imgPreUrl;

  GetChatHistoryResponse({
    this.list,
    this.images,
    this.imgPreUrl,
  });

  GetChatHistoryResponse copyWith({
    List<ChatListElement>? list,
    List<ChatImage>? images,
    String? imgPreUrl,
  }) =>
      GetChatHistoryResponse(
        list: list ?? this.list,
        images: images ?? this.images,
        imgPreUrl: imgPreUrl ?? this.imgPreUrl,
      );

  factory GetChatHistoryResponse.fromRawJson(String str) => GetChatHistoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetChatHistoryResponse.fromJson(Map<String, dynamic> json) => GetChatHistoryResponse(
        list: json["list"] == null ? [] : List<ChatListElement>.from(json["list"]!.map((x) => ChatListElement.fromMap(x))),
        images: json["images"] == null ? [] : List<ChatImage>.from(json["images"]!.map((x) => ChatImage.fromMap(x))),
        imgPreUrl: json["img_pre_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toMap())),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toMap())),
        "img_pre_url": imgPreUrl,
      };
}

class ChatImage {
  String? uImage;
  dynamic uSocialImage;
  String? sImage;

  ChatImage({
    this.uImage,
    this.uSocialImage,
    this.sImage,
  });

  ChatImage copyWith({
    String? uImage,
    dynamic uSocialImage,
    String? sImage,
  }) =>
      ChatImage(
        uImage: uImage ?? this.uImage,
        uSocialImage: uSocialImage ?? this.uSocialImage,
        sImage: sImage ?? this.sImage,
      );

  factory ChatImage.fromJson(String str) => ChatImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatImage.fromMap(Map<String, dynamic> json) => ChatImage(
        uImage: json["u_image"],
        uSocialImage: json["u_social_image"],
        sImage: json["s_image"],
      );

  Map<String, dynamic> toMap() => {
        "u_image": uImage,
        "u_social_image": uSocialImage,
        "s_image": sImage,
      };
}

class ChatListElement {
  String? message;
  String? type;
  int? isRead;
  String? msgType;
  String? image;
  DateTime? createdAt;
  bool isSent;

  ChatListElement({
    this.message,
    this.type,
    this.isRead,
    this.msgType,
    this.image,
    this.createdAt,
    this.isSent = false
  });

  ChatListElement copyWith({
    String? message,
    String? type,
    int? isRead,
    String? msgType,
    String? image,
    DateTime? createdAt,
  }) =>
      ChatListElement(
        message: message ?? this.message,
        type: type ?? this.type,
        isRead: isRead ?? this.isRead,
        msgType: msgType ?? this.msgType,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
      );

  factory ChatListElement.fromJson(String str) => ChatListElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatListElement.fromMap(Map<String, dynamic> json) => ChatListElement(
        message: json["message"],
        type: json["type"],
        isRead: json["is_read"],
        msgType: json["msg_type"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "type": type,
        "is_read": isRead,
        "msg_type": msgType,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
      };
}
