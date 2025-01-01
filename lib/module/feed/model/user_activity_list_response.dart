import 'dart:convert';
// List<UserActivityListResponse>? responseData;

class UserActivityListResponse {
  int? id;
  int? userId;
  dynamic supplierId;
  int? postId;
  int? actionId;
  String? type;
  String? userType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isRead;
  dynamic media;
  dynamic tagId;
  String? fullName;
  String? image;
  dynamic title;
  dynamic postBy;
  dynamic postTag;
  dynamic postType;
  dynamic publisherId;
  String? string;

  UserActivityListResponse({
    this.id,
    this.userId,
    this.supplierId,
    this.postId,
    this.actionId,
    this.type,
    this.userType,
    this.createdAt,
    this.updatedAt,
    this.isRead,
    this.media,
    this.tagId,
    this.fullName,
    this.image,
    this.title,
    this.postBy,
    this.postTag,
    this.postType,
    this.publisherId,
    this.string,
  });

  UserActivityListResponse copyWith({
    int? id,
    int? userId,
    dynamic supplierId,
    int? postId,
    int? actionId,
    String? type,
    String? userType,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? isRead,
    dynamic media,
    dynamic tagId,
    String? fullName,
    String? image,
    dynamic title,
    dynamic postBy,
    dynamic postTag,
    dynamic postType,
    dynamic publisherId,
    String? string,
  }) =>
      UserActivityListResponse(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        supplierId: supplierId ?? this.supplierId,
        postId: postId ?? this.postId,
        actionId: actionId ?? this.actionId,
        type: type ?? this.type,
        userType: userType ?? this.userType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isRead: isRead ?? this.isRead,
        media: media ?? this.media,
        tagId: tagId ?? this.tagId,
        fullName: fullName ?? this.fullName,
        image: image ?? this.image,
        title: title ?? this.title,
        postBy: postBy ?? this.postBy,
        postTag: postTag ?? this.postTag,
        postType: postType ?? this.postType,
        publisherId: publisherId ?? this.publisherId,
        string: string ?? this.string,
      );

  factory UserActivityListResponse.fromRowJson(String str) => UserActivityListResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory UserActivityListResponse.fromJson(Map<String, dynamic> json) => UserActivityListResponse(
        id: json["id"],
        userId: json["user_id"],
        supplierId: json["supplier_id"],
        postId: json["post_id"],
        actionId: json["action_id"],
        type: json["type"],
        userType: json["user_type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        isRead: json["is_read"],
        media: json["media"],
        tagId: json["tag_id"],
        fullName: json["full_name"],
        image: json["image"],
        title: json["title"],
        postBy: json["post_by"],
        postTag: json["post_tag"],
        postType: json["post_type"],
        publisherId: json["publisher_id"],
        string: json["string"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "supplier_id": supplierId,
        "post_id": postId,
        "action_id": actionId,
        "type": type,
        "user_type": userType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_read": isRead,
        "media": media,
        "tag_id": tagId,
        "full_name": fullName,
        "image": image,
        "title": title,
        "post_by": postBy,
        "post_tag": postTag,
        "post_type": postType,
        "publisher_id": publisherId,
        "string": string,
      };
}
