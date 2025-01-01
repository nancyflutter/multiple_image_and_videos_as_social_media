import 'dart:convert';

class UserProfilePayLoad {
  String? userId;
  // String?  loginUserId;

  UserProfilePayLoad({
    this.userId,
    // this.loginUserId,
  });

  UserProfilePayLoad copyWith({
    String? userId,
    // String? loginUserId,
  }) =>
      UserProfilePayLoad(
        userId: userId ?? this.userId,
        // loginUserId: loginUserId ?? this.loginUserId,
      );

  factory UserProfilePayLoad.fromJson(String str) => UserProfilePayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserProfilePayLoad.fromMap(Map<String, dynamic> json) => UserProfilePayLoad(
    userId: json["user_id"],
    // loginUserId: json["login_user_id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    // "login_user_id": loginUserId,
  };
}

/// https://staging.appwander.com/test/api/user_account/GetProfile
///
/// {"user_id":"353"}
///
/// {"ResponseCode":1,"ResponseText":"Success",
/// "ResponseData": {"full_name":"Pracha Agrawal","email":"pracha@yopmail.com","bio":"Hello Everyone","gender":"1","address":null,"lat":null,"lng":null,"image":"https://staging.appwander.com//upload//user//0e33f565d54b68cede2ea0ec33f6c19256671489bd201d.jpg","thumb_image":"http://staging.appwander.com/upload/user/thumbs/0e33f565d54b68cede2ea0ec33f6c19256671489bd201d.jpg","media_url":"http://staging.appwander.com/test/social_media/public/media/","followers":2,"follwing":3,"follow":0,"trips":36,"posts":[{"id":465,"publisher_id":353,"post_by":"u","title":"Explore with Us","description":"","location":"Parvat Patiya, Surat, Gujarat, India","tag":"91","type":"undefined","status":"1","created_at":"2024-07-01 07:11:43","updated_at":"2024-07-01 07:11:43","likes":2,"comments":0,"liked":1,"is_bookmark":0,"media":[{"id":550,"post_id":465,"media":"media-1719817901634.jpeg","type":"image","created_at":"2024-07-01 07:11:43","updated_at":"2024-07-01 07:11:43"}]}],"totalAvailableCoin":"0"}}





///{"password":"Pracha@2003","device_id":"2e7aa27adbee1328","device_token":"dXFIsacHQ72F1yuA93lWKv:APA91bEzAwVGcpxUku-NV29oGb6Ki-RTIBzquMHs84mWVyZ9nUrgH4Jd15IIU0GJ4f_lYMVPLEa3qyQIJdZFgFnpZMv_pjs2XIvySXsooDOY5ThqQx4anDS3-PTX7KGaHEupRNKZxL0s","device_type":"2","model":"sdk_gphone_x86_arm","version":"10","email":"pracha@yopmail.com","manufacturer":"Google"}
