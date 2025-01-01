import 'dart:convert';

class GetPostCommentPayLoad {
  String? postId;

  GetPostCommentPayLoad({
    this.postId,
  });

  GetPostCommentPayLoad copyWith({
    String? postId,
  }) =>
      GetPostCommentPayLoad(
        postId: postId ?? this.postId,
      );

  factory GetPostCommentPayLoad.fromJson(String str) => GetPostCommentPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetPostCommentPayLoad.fromMap(Map<String, dynamic> json) => GetPostCommentPayLoad(
    postId: json["post_id"],
  );

  Map<String, dynamic> toMap() => {
    "post_id": postId,
  };
}
