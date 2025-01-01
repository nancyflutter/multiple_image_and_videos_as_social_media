import 'dart:convert';

class AddCommentPayLoad {
  String? postId;
  String? userId;
  String? comment;
  String? type;
  String? postUserId;

  AddCommentPayLoad({
    this.postId,
    this.userId,
    this.comment,
    this.type,
    this.postUserId,
  });

  AddCommentPayLoad copyWith({
    String? postId,
    String? userId,
    String? comment,
    String? type,
    String? postUserId,
  }) =>
      AddCommentPayLoad(
        postId: postId ?? this.postId,
        userId: userId ?? this.userId,
        comment: comment ?? this.comment,
        type: type ?? this.type,
        postUserId: postUserId ?? this.postUserId,
      );

  factory AddCommentPayLoad.fromJson(String str) => AddCommentPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddCommentPayLoad.fromMap(Map<String, dynamic> json) => AddCommentPayLoad(
    postId: json["post_id"],
    userId: json["user_id"],
    comment: json["comment"],
    type: json["type"],
    postUserId: json["post_user_id"],
  );

  Map<String, dynamic> toMap() => {
    "post_id": postId,
    "user_id": userId,
    "comment": comment,
    "type": type,
    "post_user_id": postUserId,
  };
}
