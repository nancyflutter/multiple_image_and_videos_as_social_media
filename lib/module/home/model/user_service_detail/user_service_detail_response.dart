import 'dart:convert';

class GetUserServiceDetailResponse {
  Detail? detail;
  List<String>? image;
  List<Time>? time;
  List<Review>? review;
  List<Post>? posts;
  int? followers;
  int? follwing;
  int? noOfPosts;
  int? isBookmark;
  String? url;

  GetUserServiceDetailResponse({
    this.detail,
    this.image,
    this.time,
    this.review,
    this.posts,
    this.followers,
    this.follwing,
    this.noOfPosts,
    this.isBookmark,
    this.url,
  });

  GetUserServiceDetailResponse copyWith({
    Detail? detail,
    List<String>? image,
    List<Time>? time,
    List<Review>? review,
    List<Post>? posts,
    int? followers,
    int? follwing,
    int? noOfPosts,
    int? isBookmark,
    String? url,
  }) =>
      GetUserServiceDetailResponse(
        detail: detail ?? this.detail,
        image: image ?? this.image,
        time: time ?? this.time,
        review: review ?? this.review,
        posts: posts ?? this.posts,
        followers: followers ?? this.followers,
        follwing: follwing ?? this.follwing,
        noOfPosts: noOfPosts ?? this.noOfPosts,
        isBookmark: isBookmark ?? this.isBookmark,
        url: url ?? this.url,
      );

  factory GetUserServiceDetailResponse.fromRawJson(String str) => GetUserServiceDetailResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetUserServiceDetailResponse.fromJson(Map<String, dynamic> json) => GetUserServiceDetailResponse(
    detail: json["detail"] == null ? null : Detail.fromMap(json["detail"]),
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    time: json["time"] == null ? [] : List<Time>.from(json["time"]!.map((x) => Time.fromMap(x))),
    review: json["review"] == null ? [] : List<Review>.from(json["review"]!.map((x) => Review.fromMap(x))),
    posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromMap(x))),
    followers: json["followers"],
    follwing: json["follwing"],
    noOfPosts: json["no_of_posts"],
    isBookmark: json["is_bookmark"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "detail": detail?.toMap(),
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x.toMap())),
    "review": review == null ? [] : List<dynamic>.from(review!.map((x) => x.toMap())),
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toMap())),
    "followers": followers,
    "follwing": follwing,
    "no_of_posts": noOfPosts,
    "is_bookmark": isBookmark,
    "url": url,
  };
}

class Detail {
  int? id;
  String? supplierName;
  String? bio;
  String? serviceName;
  dynamic needToBring;
  String? image;
  String? supplierAddress;
  String? description;
  String? latitude;
  String? longitude;
  int? otherCharges;
  int? rating;
  int? status;

  Detail({
    this.id,
    this.supplierName,
    this.bio,
    this.serviceName,
    this.needToBring,
    this.image,
    this.supplierAddress,
    this.description,
    this.latitude,
    this.longitude,
    this.otherCharges,
    this.rating,
    this.status,
  });

  Detail copyWith({
    int? id,
    String? supplierName,
    String? bio,
    String? serviceName,
    dynamic needToBring,
    String? image,
    String? supplierAddress,
    String? description,
    String? latitude,
    String? longitude,
    int? otherCharges,
    int? rating,
    int? status,
  }) =>
      Detail(
        id: id ?? this.id,
        supplierName: supplierName ?? this.supplierName,
        bio: bio ?? this.bio,
        serviceName: serviceName ?? this.serviceName,
        needToBring: needToBring ?? this.needToBring,
        image: image ?? this.image,
        supplierAddress: supplierAddress ?? this.supplierAddress,
        description: description ?? this.description,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        otherCharges: otherCharges ?? this.otherCharges,
        rating: rating ?? this.rating,
        status: status ?? this.status,
      );

  factory Detail.fromJson(String str) => Detail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
    id: json["id"],
    supplierName: json["supplier_name"],
    bio: json["bio"],
    serviceName: json["service_name"],
    needToBring: json["need_to_bring"],
    image: json["image"],
    supplierAddress: json["supplier_address"],
    description: json["description"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    otherCharges: json["other_charges"],
    rating: json["rating"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "supplier_name": supplierName,
    "bio": bio,
    "service_name": serviceName,
    "need_to_bring": needToBring,
    "image": image,
    "supplier_address": supplierAddress,
    "description": description,
    "latitude": latitude,
    "longitude": longitude,
    "other_charges": otherCharges,
    "rating": rating,
    "status": status,
  };
}

class Review {
  String? rate;
  String? userName;
  DateTime? reviewDate;
  String? reviewText;
  String? image;

  Review({
    this.rate,
    this.userName,
    this.reviewDate,
    this.reviewText,
    this.image,
  });

  Review copyWith({
    // int? aa,
    String? rate,
    String? userName,
    DateTime? reviewDate,
    String? reviewText,
    String? image,
  }) =>
      Review(
        rate: rate ?? this.rate,
        userName: userName ?? this.userName,
        reviewDate: reviewDate ?? this.reviewDate,
        reviewText: reviewText ?? this.reviewText,
        image: image ?? this.image,
      );

  factory Review.fromJson(String str) => Review.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Review.fromMap(Map<String, dynamic> json) => Review(
    rate: json["rate"],
    userName: json["user_name"],
    reviewDate: json["review_date"] == null ? null : DateTime.parse(json["review_date"]),
    reviewText: json["review_text"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "rate": rate,
    "user_name": userName,
    "review_date": "${reviewDate!.year.toString().padLeft(4, '0')}-${reviewDate!.month.toString().padLeft(2, '0')}-${reviewDate!.day.toString().padLeft(2, '0')}",
    "review_text": reviewText,
    "image": image,
  };
}

class Post {
  int? id;
  int? publisherId;
  String? postBy;
  String? title;
  String? description;
  String? location;
  dynamic tag;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? likes;
  int? liked;
  int? comments;
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
    this.liked,
    this.comments,
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
    dynamic tag,
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
        liked: liked ?? this.liked,
        comments: comments ?? this.comments,
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

class Time {
  String? day;
  String? startTime;
  String? endTime;
  int? flag;

  Time({
    this.day,
    this.startTime,
    this.endTime,
    this.flag,
  });

  Time copyWith({
    String? day,
    String? startTime,
    String? endTime,
    int? flag,
  }) =>
      Time(
        day: day ?? this.day,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        flag: flag ?? this.flag,
      );

  factory Time.fromJson(String str) => Time.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Time.fromMap(Map<String, dynamic> json) => Time(
    day: json["day"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    flag: json["flag"],
  );

  Map<String, dynamic> toMap() => {
    "day": day,
    "start_time": startTime,
    "end_time": endTime,
    "flag": flag,
  };
}
