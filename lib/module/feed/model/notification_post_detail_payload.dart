import 'dart:convert';

class PostDetailPayLoad {
  String? postId;
  String? userId;

  PostDetailPayLoad({
    this.postId,
    this.userId,
  });

  PostDetailPayLoad copyWith({
    String? postId,
    String? userId,
  }) =>
      PostDetailPayLoad(
        postId: postId ?? this.postId,
        userId: userId ?? this.userId,
      );

  factory PostDetailPayLoad.fromJson(String str) => PostDetailPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostDetailPayLoad.fromMap(Map<String, dynamic> json) => PostDetailPayLoad(
        postId: json["post_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "post_id": postId,
        "user_id": userId,
      };
}
