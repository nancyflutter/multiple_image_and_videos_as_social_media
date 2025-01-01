import 'dart:convert';
// List<UserSearchResponse>? responseData;

class UserSearchResponse {
  int? userId;
  String? name;
  String? type;
  String? image;
  int? isFollow;

  UserSearchResponse({
    this.userId,
    this.name,
    this.type,
    this.image,
    this.isFollow,
  });

  UserSearchResponse copyWith({
    int? userId,
    String? name,
    String? type,
    String? image,
    int? isFollow,
  }) =>
      UserSearchResponse(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        type: type ?? this.type,
        image: image ?? this.image,
        isFollow: isFollow ?? this.isFollow,
      );

  factory UserSearchResponse.fromRowJson(String str) => UserSearchResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory UserSearchResponse.fromJson(Map<String, dynamic> json) => UserSearchResponse(
        userId: json["user_id"],
        name: json["name"],
        type: json["type"],
        image: json["image"],
        isFollow: json["is_follow"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "name": name,
        "type": type,
        "image": image,
        "is_follow": isFollow,
      };
}
