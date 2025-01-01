import 'dart:convert';

// List<ResponseDatum>? responseData;

class GetPostCommentResponse {
  int? id;
  int? postId;
  int? commentUserId;
  String? type;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  String? name;
  String? image;

  GetPostCommentResponse({
    this.id,
    this.postId,
    this.commentUserId,
    this.type,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.name,
    this.image,
  });

  GetPostCommentResponse copyWith({
    int? id,
    int? postId,
    int? commentUserId,
    String? type,
    String? comment,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userId,
    String? name,
    String? image,
  }) =>
      GetPostCommentResponse(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        commentUserId: commentUserId ?? this.commentUserId,
        type: type ?? this.type,
        comment: comment ?? this.comment,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        image: image ?? this.image,
      );

  factory GetPostCommentResponse.fromRowJson(String str) => GetPostCommentResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory GetPostCommentResponse.fromJson(Map<String, dynamic> json) => GetPostCommentResponse(
        id: json["id"],
        postId: json["post_id"],
        commentUserId: json["comment_user_id"],
        type: json["type"],
        comment: json["comment"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "post_id": postId,
        "comment_user_id": commentUserId,
        "type": type,
        "comment": comment,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
        "name": name,
        "image": image,
      };
}
