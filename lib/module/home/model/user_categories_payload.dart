import 'dart:convert';

class UserCategoriesPayLoad {
  String? currentLatitude;
  String? currentLongitude;
  String? userId;

  UserCategoriesPayLoad({
    this.currentLatitude,
    this.currentLongitude,
    this.userId,
  });

  UserCategoriesPayLoad copyWith({
    String? currentLatitude,
    String? currentLongitude,
    String? userId,
  }) =>
      UserCategoriesPayLoad(
        currentLatitude: currentLatitude ?? this.currentLatitude,
        currentLongitude: currentLongitude ?? this.currentLongitude,
        userId: userId ?? this.userId,
      );

  factory UserCategoriesPayLoad.fromJson(String str) => UserCategoriesPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCategoriesPayLoad.fromMap(Map<String, dynamic> json) => UserCategoriesPayLoad(
        currentLatitude: json["current_latitude"],
        currentLongitude: json["current_longitude"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "current_latitude": currentLatitude,
        "current_longitude": currentLongitude,
        "user_id": userId,
      };
}


///POST https://staging.appwander.com/test/api/user/category
// Content-Type: application/json
// Content-Length: 76
// Authorization: eyJpdiI6IlM2Q2l3SG5YN1YyN0ZXc2xqaHZrVlE9PSIsInZhbHVlIjoiMTYwZ2RRY2JOTTA4K0xhc3pcL0I4bFE9PSIsIm1hYyI6ImI2MzJlZWJjMGE2NmNjYjU4YzQ3YjBhMmNhZjUzYmZhMzkxYWU4YjAxYzQwMDA2ZmU0ODNjMmRlZjgxNjk3MzkifQ==
//  App: u
//  timezone: Asia/Calcutta
// GPS enabled, listening for updates
// {"current_latitude":"37.422","current_longitude":"-122.084","user_id":"353"}
//
//
// {"ResponseCode":1,"ResponseText":"Data fetched successfully.","ResponseData":{"category":[{"category_id":2,"category_name":"Water Parks","supplier":"26,71,76,75,80,81,85,84,86,83,88,91","image":"\/upload\/category\/667a55726cfd0.png"},{"category_id":3,"category_name":"Dune Buggy","supplier":"32,33,71,76,75,84,89,90,88,91","image":"\/upload\/category\/dune-buggy.jpeg"},{"category_id":4,"category_name":"Car Hire","supplier":"32,26,35,33,71,76,75,85,84,89,90,88,91,93","image":"\/upload\/category\/5d75bf17dede2.png"},{"category_id":5,"category_name":"Yatcht Hire","supplier":"26,35,71,75,85,84,89,90,88,91","image":"\/upload\/category\/5d79e31607af5.png"},{"category_id":6,"category_name":"Bungee Jumping","supplier":"36,71,75,84,89,90,91","image":"\/upload\/category\/bungee-jumping.jpg"},{"category_id":7,"category_name":"Moto Racing","supplier":"71,75,85,84,88,91","image":"\/upload\/category\/moto-racing.jpg"},{"category_id":9,"category_name":"Helicopter","supplier":"68,71,67,75,84,91","image":"\/upload\/category\/5e104364ece49.png"},{"category_id":10,"category_name":"safari","supplier":"68,69,71,67,75,84,91","image":"\/upload\/category\/5e147820a144e.png"},{"category_id":11,"category_name":"Speedboat","supplier":"68,69,71,75,84,88,91","image":"\/upload\/category\/5e157abde31f9.png"},{"category_id":12,"category_name":"Elephant Ride","supplier":"75,84,91,92","image":"\/upload\/category\/626fb74aa80d5.png"}],"flag":{"id":1223,"service_id":88,"feedback":"N","review":"N"},"config":{"pickup_location_to_provider_limit":"20000","provider_location_to_drop_limit":"20000","google_country_filter":"Global"},"location":{"type":0,"book_id":1243},"user_unread":{"msg_count":0}}}