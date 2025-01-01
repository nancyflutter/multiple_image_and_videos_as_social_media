import 'dart:convert';

class AddLikePayLoad {
  String? postId;
  String? userId;
  String? like;
  String? type;
  String? postUserId;

  AddLikePayLoad({
    this.postId,
    this.userId,
    this.like,
    this.type,
    this.postUserId,
  });

  AddLikePayLoad copyWith({
    String? postId,
    String? userId,
    String? like,
    String? type,
    String? postUserId,
  }) =>
      AddLikePayLoad(
        postId: postId ?? this.postId,
        userId: userId ?? this.userId,
        like: like ?? this.like,
        type: type ?? this.type,
        postUserId: postUserId ?? this.postUserId,
      );

  factory AddLikePayLoad.fromJson(String str) => AddLikePayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddLikePayLoad.fromMap(Map<String, dynamic> json) => AddLikePayLoad(
    postId: json["post_id"],
    userId: json["user_id"],
    like: json["like"],
    type: json["type"],
    postUserId: json["post_user_id"],
  );

  Map<String, dynamic> toMap() => {
    "post_id": postId,
    "user_id": userId,
    "like": like,
    "type": type,
    "post_user_id": postUserId,
  };
}
