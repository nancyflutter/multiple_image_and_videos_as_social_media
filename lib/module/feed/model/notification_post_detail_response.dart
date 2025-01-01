import 'dart:convert';

//   PostDetailResponse? responseData;

class PostDetailResponse {
  List<PostDetail>? post;
  String? url;

  PostDetailResponse({
    this.post,
    this.url,
  });

  PostDetailResponse copyWith({
    List<PostDetail>? post,
    String? url,
  }) =>
      PostDetailResponse(
        post: post ?? this.post,
        url: url ?? this.url,
      );

  factory PostDetailResponse.fromRowJson(String str) => PostDetailResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory PostDetailResponse.fromJson(Map<String, dynamic> json) => PostDetailResponse(
        post: json["post"] == null ? [] : List<PostDetail>.from(json["post"]!.map((x) => PostDetail.fromMap(x))),
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "post": post == null ? [] : List<dynamic>.from(post!.map((x) => x.toMap())),
        "url": url,
      };
}

class PostDetail {
  int? id;
  int? publisherId;
  String? postBy;
  String? title;
  String? description;
  String? location;
  String? tag;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? likes;
  int? liked;
  int? comments;
  int? isBookmark;
  List<Media>? media;

  PostDetail({
    this.id,
    this.publisherId,
    this.postBy,
    this.title,
    this.description,
    this.location,
    this.tag,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.likes,
    this.liked,
    this.comments,
    this.isBookmark,
    this.media,
  });

  PostDetail copyWith({
    int? id,
    int? publisherId,
    String? postBy,
    String? title,
    String? description,
    String? location,
    String? tag,
    String? type,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? likes,
    int? liked,
    int? comments,
    int? isBookmark,
    List<Media>? media,
  }) =>
      PostDetail(
        id: id ?? this.id,
        publisherId: publisherId ?? this.publisherId,
        postBy: postBy ?? this.postBy,
        title: title ?? this.title,
        description: description ?? this.description,
        location: location ?? this.location,
        tag: tag ?? this.tag,
        type: type ?? this.type,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        likes: likes ?? this.likes,
        liked: liked ?? this.liked,
        comments: comments ?? this.comments,
        isBookmark: isBookmark ?? this.isBookmark,
        media: media ?? this.media,
      );

  factory PostDetail.fromJson(String str) => PostDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostDetail.fromMap(Map<String, dynamic> json) => PostDetail(
        id: json["id"],
        publisherId: json["publisher_id"],
        postBy: json["post_by"],
        title: json["title"],
        description: json["description"],
        location: json["location"],
        tag: json["tag"],
        type: json["type"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        likes: json["likes"],
        liked: json["liked"],
        comments: json["comments"],
        isBookmark: json["is_bookmark"],
        media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "publisher_id": publisherId,
        "post_by": postBy,
        "title": title,
        "description": description,
        "location": location,
        "tag": tag,
        "type": type,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "likes": likes,
        "liked": liked,
        "comments": comments,
        "is_bookmark": isBookmark,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}

class Media {
  int? id;
  int? postId;
  String? media;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  Media({
    this.id,
    this.postId,
    this.media,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  Media copyWith({
    int? id,
    int? postId,
    String? media,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Media(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        media: media ?? this.media,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Media.fromJson(String str) => Media.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        id: json["id"],
        postId: json["post_id"],
        media: json["media"],
        type: json["type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "post_id": postId,
        "media": media,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
