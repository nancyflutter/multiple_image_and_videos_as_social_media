import 'dart:convert';

class UserFollowAddUserPayLoad {
  String? followerId;
  String? followingId;
  String? follow;

  UserFollowAddUserPayLoad({
    this.followerId,
    this.followingId,
    this.follow,
  });

  UserFollowAddUserPayLoad copyWith({
    String? followerId,
    String? followingId,
    String? follow,
  }) =>
      UserFollowAddUserPayLoad(
        followerId: followerId ?? this.followerId,
        followingId: followingId ?? this.followingId,
        follow: follow ?? this.follow,
      );

  factory UserFollowAddUserPayLoad.fromJson(String str) => UserFollowAddUserPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserFollowAddUserPayLoad.fromMap(Map<String, dynamic> json) => UserFollowAddUserPayLoad(
    followerId: json["follower_id"],
    followingId: json["following_id"],
    follow: json["follow"],
  );

  Map<String, dynamic> toMap() => {
    "follower_id": followerId,
    "following_id": followingId,
    "follow": follow,
  };
}
