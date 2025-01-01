import 'dart:convert';

class UserProfileResponse {
  String? fullName;
  String? email;
  String? bio;
  String? gender;
  dynamic address;
  dynamic lat;
  dynamic lng;
  String? image;
  String? thumbImage;
  String? mediaUrl;
  int? followers;
  int? follwing;
  int? follow;
  int? trips;
  List<Post>? posts;
  String? totalAvailableCoin;

  UserProfileResponse({
    this.fullName,
    this.email,
    this.bio,
    this.gender,
    this.address,
    this.lat,
    this.lng,
    this.image,
    this.thumbImage,
    this.mediaUrl,
    this.followers,
    this.follwing,
    this.follow,
    this.trips,
    this.posts,
    this.totalAvailableCoin,
  });

  UserProfileResponse copyWith({
    String? fullName,
    String? email,
    String? bio,
    String? gender,
    dynamic address,
    dynamic lat,
    dynamic lng,
    String? image,
    String? thumbImage,
    String? mediaUrl,
    int? followers,
    int? following,
    int? follow,
    int? trips,
    List<Post>? posts,
    String? totalAvailableCoin,
  }) =>
      UserProfileResponse(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        bio: bio ?? this.bio,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        image: image ?? this.image,
        thumbImage: thumbImage ?? this.thumbImage,
        mediaUrl: mediaUrl ?? this.mediaUrl,
        followers: followers ?? this.followers,
        follwing: following ?? this.follwing,
        follow: follow ?? this.follow,
        trips: trips ?? this.trips,
        posts: posts ?? this.posts,
        totalAvailableCoin: totalAvailableCoin ?? this.totalAvailableCoin,
      );

  factory UserProfileResponse.fromRowJson(String str) => UserProfileResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => UserProfileResponse(
    fullName: json["full_name"],
    email: json["email"],
    bio: json["bio"],
    gender: json["gender"],
    address: json["address"],
    lat: json["lat"],
    lng: json["lng"],
    image: json["image"],
    thumbImage: json["thumb_image"],
    mediaUrl: json["media_url"],
    followers: json["followers"],
    follwing: json["follwing"],
    follow: json["follow"],
    trips: json["trips"],
    posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromMap(x))),
    totalAvailableCoin: json["totalAvailableCoin"],
  );

  Map<String, dynamic> toMap() => {
    "full_name": fullName,
    "email": email,
    "bio": bio,
    "gender": gender,
    "address": address,
    "lat": lat,
    "lng": lng,
    "image": image,
    "thumb_image": thumbImage,
    "media_url": mediaUrl,
    "followers": followers,
    "follwing": follwing,
    "follow": follow,
    "trips": trips,
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toMap())),
    "totalAvailableCoin": totalAvailableCoin,
  };
}

class Post {
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
  int? comments;
  int? liked;
  int? isBookmark;
  List<Media>? media;

  Post({
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
    this.comments,
    this.liked,
    this.isBookmark,
    this.media,
  });

  Post copyWith({
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
    int? comments,
    int? liked,
    int? isBookmark,
    List<Media>? media,
  }) =>
      Post(
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
        comments: comments ?? this.comments,
        liked: liked ?? this.liked,
        isBookmark: isBookmark ?? this.isBookmark,
        media: media ?? this.media,
      );

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
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
    comments: json["comments"],
    liked: json["liked"],
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
    "comments": comments,
    "liked": liked,
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
