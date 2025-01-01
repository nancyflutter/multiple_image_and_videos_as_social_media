import 'dart:convert';

class PostDeletePayLoad {
  String? postId;

  PostDeletePayLoad({
    this.postId,
  });

  PostDeletePayLoad copyWith({
    String? postId,
  }) =>
      PostDeletePayLoad(
        postId: postId ?? this.postId,
      );

  factory PostDeletePayLoad.fromJson(String str) => PostDeletePayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostDeletePayLoad.fromMap(Map<String, dynamic> json) => PostDeletePayLoad(
    postId: json["post_id"],
  );

  Map<String, dynamic> toMap() => {
    "post_id": postId,
  };
}
