import 'dart:convert';

class EditProfilePayload {
  String? userId;
  String? fullName;
  String? gender;
  String? bio;
  String? image;

  EditProfilePayload({
    this.userId,
    this.fullName,
    this.gender,
    this.bio,
    this.image,
  });

  EditProfilePayload copyWith({
    String? userId,
    String? fullName,
    String? gender,
    String? bio,
    String? image,
  }) =>
      EditProfilePayload(
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        gender: gender ?? this.gender,
        bio: bio ?? this.bio,
        image: image ?? this.image,
      );

  factory EditProfilePayload.fromJson(String str) => EditProfilePayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditProfilePayload.fromMap(Map<String, dynamic> json) => EditProfilePayload(
    userId: json["user_id"],
    fullName: json["full_name"],
    gender: json["gender"],
    bio: json["bio"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "full_name": fullName,
    "gender": gender,
    "bio": bio,
    "image": image,
  };
}