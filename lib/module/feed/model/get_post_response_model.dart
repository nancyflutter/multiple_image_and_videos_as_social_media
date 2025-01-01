import 'dart:convert';
//   List<ResponseDatum>? responseData;

class GetPostResponse {
  int? id;
  int? publisherId;
  String? postBy;
  String? title;
  String? tag;
  String? description;
  String? location;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? likes;
  int? comments;
  int? liked;
  int? isBookmark;
  List<Media>? media;
  User? user;
  Supplier? supplier;

  GetPostResponse({
    this.id,
    this.publisherId,
    this.postBy,
    this.title,
    this.tag,
    this.description,
    this.location,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.likes,
    this.comments,
    this.liked,
    this.isBookmark,
    this.media,
    this.user,
    this.supplier,
  });

  GetPostResponse copyWith({
    int? id,
    int? publisherId,
    String? postBy,
    String? title,
    String? tag,
    String? description,
    String? location,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? likes,
    int? comments,
    int? liked,
    int? isBookmark,
    List<Media>? media,
    User? user,
    Supplier? supplier,
  }) =>
      GetPostResponse(
        id: id ?? this.id,
        publisherId: publisherId ?? this.publisherId,
        postBy: postBy ?? this.postBy,
        title: title ?? this.title,
        tag: tag ?? this.tag,
        description: description ?? this.description,
        location: location ?? this.location,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        likes: likes ?? this.likes,
        comments: comments ?? this.comments,
        liked: liked ?? this.liked,
        isBookmark: isBookmark ?? this.isBookmark,
        media: media ?? this.media,
        user: user ?? this.user,
        supplier: supplier ?? this.supplier,
      );

  factory GetPostResponse.fromRowJson(String str) => GetPostResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory GetPostResponse.fromJson(Map<String, dynamic> json) => GetPostResponse(
        id: json["id"],
        publisherId: json["publisher_id"],
        postBy: json["post_by"],
        title: json["title"],
        tag: json["tag"],
        description: json["description"],
        location: json["location"],
        type: json["type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        likes: json["likes"],
        comments: json["comments"],
        liked: json["liked"],
        isBookmark: json["is_bookmark"],
        media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromMap(x))),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        supplier: json["supplier"] == null ? null : Supplier.fromMap(json["supplier"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "publisher_id": publisherId,
        "post_by": postBy,
        "title": title,
        "tag": tag,
        "description": description,
        "location": location,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "likes": likes,
        "comments": comments,
        "liked": liked,
        "is_bookmark": isBookmark,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toMap())),
        "user": user?.toMap(),
        "supplier": supplier?.toMap(),
      };
}

class Media {
  int? id;
  int? postId;
  String? media;
  String? type;

  Media({
    this.id,
    this.postId,
    this.media,
    this.type,
  });

  Media copyWith({
    int? id,
    int? postId,
    String? media,
    String? type,
  }) =>
      Media(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        media: media ?? this.media,
        type: type ?? this.type,
      );

  factory Media.fromJson(String str) => Media.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        id: json["id"],
        postId: json["post_id"],
        media: json["media"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "post_id": postId,
        "media": media,
        "type": type,
      };
}

class Supplier {
  int? id;
  String? serviceName;
  String? image;

  Supplier({
    this.id,
    this.serviceName,
    this.image,
  });

  Supplier copyWith({
    int? id,
    String? serviceName,
    String? image,
  }) =>
      Supplier(
        id: id ?? this.id,
        serviceName: serviceName ?? this.serviceName,
        image: image ?? this.image,
      );

  factory Supplier.fromJson(String str) => Supplier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Supplier.fromMap(Map<String, dynamic> json) => Supplier(
        id: json["id"],
        serviceName: json["service_name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "service_name": serviceName,
        "image": image,
      };
}

class User {
  int? id;
  String? fullName;
  String? image;

  User({
    this.id,
    this.fullName,
    this.image,
  });

  User copyWith({
    int? id,
    String? fullName,
    String? image,
  }) =>
      User(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        image: image ?? this.image,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "full_name": fullName,
        "image": image,
      };
}

class GetPostDataResponse {
  final List<GetPostResponse>? postData;
  final int? unreadCount;

  GetPostDataResponse({this.postData, this.unreadCount});
}
