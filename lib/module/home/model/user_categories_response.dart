import 'dart:convert';

class UserCategoriesResponseData {
  List<Category>? category;
  Flag? flag;
  Config? config;
  Location? location;
  UserUnread? userUnread;

  UserCategoriesResponseData({
    this.category,
    this.flag,
    this.config,
    this.location,
    this.userUnread,
  });

  UserCategoriesResponseData copyWith({
    List<Category>? category,
    Flag? flag,
    Config? config,
    Location? location,
    UserUnread? userUnread,
  }) =>
      UserCategoriesResponseData(
        category: category ?? this.category,
        flag: flag ?? this.flag,
        config: config ?? this.config,
        location: location ?? this.location,
        userUnread: userUnread ?? this.userUnread,
      );

  factory UserCategoriesResponseData.fromRowJson(String str) => UserCategoriesResponseData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory UserCategoriesResponseData.fromJson(Map<String, dynamic> json) => UserCategoriesResponseData(
        category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromMap(x))),
        flag: json["flag"] == null ? null : Flag.fromMap(json["flag"]),
        config: json["config"] == null ? null : Config.fromMap(json["config"]),
        location: json["location"] == null ? null : Location.fromMap(json["location"]),
        userUnread: json["user_unread"] == null ? null : UserUnread.fromMap(json["user_unread"]),
      );

  Map<String, dynamic> toMap() => {
        "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toMap())),
        "flag": flag?.toMap(),
        "config": config?.toMap(),
        "location": location?.toMap(),
        "user_unread": userUnread?.toMap(),
      };
}

class Category {
  int? categoryId;
  String? categoryName;
  String? supplier;
  String? image;

  Category({
    this.categoryId,
    this.categoryName,
    this.supplier,
    this.image,
  });

  Category copyWith({
    int? categoryId,
    String? categoryName,
    String? supplier,
    String? image,
  }) =>
      Category(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        supplier: supplier ?? this.supplier,
        image: image ?? this.image,
      );

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        supplier: json["supplier"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "supplier": supplier,
        "image": image,
      };
}

class Config {
  String? pickupLocationToProviderLimit;
  String? providerLocationToDropLimit;
  String? googleCountryFilter;

  Config({
    this.pickupLocationToProviderLimit,
    this.providerLocationToDropLimit,
    this.googleCountryFilter,
  });

  Config copyWith({
    String? pickupLocationToProviderLimit,
    String? providerLocationToDropLimit,
    String? googleCountryFilter,
  }) =>
      Config(
        pickupLocationToProviderLimit: pickupLocationToProviderLimit ?? this.pickupLocationToProviderLimit,
        providerLocationToDropLimit: providerLocationToDropLimit ?? this.providerLocationToDropLimit,
        googleCountryFilter: googleCountryFilter ?? this.googleCountryFilter,
      );

  factory Config.fromJson(String str) => Config.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Config.fromMap(Map<String, dynamic> json) => Config(
        pickupLocationToProviderLimit: json["pickup_location_to_provider_limit"],
        providerLocationToDropLimit: json["provider_location_to_drop_limit"],
        googleCountryFilter: json["google_country_filter"],
      );

  Map<String, dynamic> toMap() => {
        "pickup_location_to_provider_limit": pickupLocationToProviderLimit,
        "provider_location_to_drop_limit": providerLocationToDropLimit,
        "google_country_filter": googleCountryFilter,
      };
}

class Flag {
  int? id;
  int? serviceId;
  String? feedback;
  String? review;

  Flag({
    this.id,
    this.serviceId,
    this.feedback,
    this.review,
  });

  Flag copyWith({
    int? id,
    int? serviceId,
    String? feedback,
    String? review,
  }) =>
      Flag(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        feedback: feedback ?? this.feedback,
        review: review ?? this.review,
      );

  factory Flag.fromJson(String str) => Flag.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Flag.fromMap(Map<String, dynamic> json) => Flag(
        id: json["id"],
        serviceId: json["service_id"],
        feedback: json["feedback"],
        review: json["review"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "service_id": serviceId,
        "feedback": feedback,
        "review": review,
      };
}

class Location {
  int? type;
  int? bookId;

  Location({
    this.type,
    this.bookId,
  });

  Location copyWith({
    int? type,
    int? bookId,
  }) =>
      Location(
        type: type ?? this.type,
        bookId: bookId ?? this.bookId,
      );

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        type: json["type"],
        bookId: json["book_id"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "book_id": bookId,
      };
}

class UserUnread {
  int? msgCount;

  UserUnread({
    this.msgCount,
  });

  UserUnread copyWith({
    int? msgCount,
  }) =>
      UserUnread(
        msgCount: msgCount ?? this.msgCount,
      );

  factory UserUnread.fromJson(String str) => UserUnread.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserUnread.fromMap(Map<String, dynamic> json) => UserUnread(
        msgCount: json["msg_count"],
      );

  Map<String, dynamic> toMap() => {
        "msg_count": msgCount,
      };
}


/*

import 'dart:convert';

class UserCategoriesResponseData {
  int? responseCode;
  String? responseText;
  ResponseData? responseData;

  UserCategoriesResponseData({
    this.responseCode,
    this.responseText,
    this.responseData,
  });

  UserCategoriesResponseData copyWith({
    int? responseCode,
    String? responseText,
    ResponseData? responseData,
  }) =>
      UserCategoriesResponseData(
        responseCode: responseCode ?? this.responseCode,
        responseText: responseText ?? this.responseText,
        responseData: responseData ?? this.responseData,
      );

  factory UserCategoriesResponseData.fromJson(String str) => UserCategoriesResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCategoriesResponseData.fromMap(Map<String, dynamic> json) => UserCategoriesResponseData(
    responseCode: json["ResponseCode"],
    responseText: json["ResponseText"],
    responseData: json["ResponseData"] == null ? null : ResponseData.fromMap(json["ResponseData"]),
  );

  Map<String, dynamic> toMap() => {
    "ResponseCode": responseCode,
    "ResponseText": responseText,
    "ResponseData": responseData?.toMap(),
  };
}

class ResponseData {
  List<Category>? category;
  Flag? flag;
  Config? config;
  Location? location;
  UserUnread? userUnread;

  ResponseData({
    this.category,
    this.flag,
    this.config,
    this.location,
    this.userUnread,
  });

  ResponseData copyWith({
    List<Category>? category,
    Flag? flag,
    Config? config,
    Location? location,
    UserUnread? userUnread,
  }) =>
      ResponseData(
        category: category ?? this.category,
        flag: flag ?? this.flag,
        config: config ?? this.config,
        location: location ?? this.location,
        userUnread: userUnread ?? this.userUnread,
      );

  factory ResponseData.fromJson(String str) => ResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseData.fromMap(Map<String, dynamic> json) => ResponseData(
    category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromMap(x))),
    flag: json["flag"] == null ? null : Flag.fromMap(json["flag"]),
    config: json["config"] == null ? null : Config.fromMap(json["config"]),
    location: json["location"] == null ? null : Location.fromMap(json["location"]),
    userUnread: json["user_unread"] == null ? null : UserUnread.fromMap(json["user_unread"]),
  );

  Map<String, dynamic> toMap() => {
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toMap())),
    "flag": flag?.toMap(),
    "config": config?.toMap(),
    "location": location?.toMap(),
    "user_unread": userUnread?.toMap(),
  };
}

class Category {
  int? categoryId;
  String? categoryName;
  String? supplier;
  String? image;

  Category({
    this.categoryId,
    this.categoryName,
    this.supplier,
    this.image,
  });

  Category copyWith({
    int? categoryId,
    String? categoryName,
    String? supplier,
    String? image,
  }) =>
      Category(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        supplier: supplier ?? this.supplier,
        image: image ?? this.image,
      );

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    supplier: json["supplier"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "supplier": supplier,
    "image": image,
  };
}

class Config {
  String? pickupLocationToProviderLimit;
  String? providerLocationToDropLimit;
  String? googleCountryFilter;

  Config({
    this.pickupLocationToProviderLimit,
    this.providerLocationToDropLimit,
    this.googleCountryFilter,
  });

  Config copyWith({
    String? pickupLocationToProviderLimit,
    String? providerLocationToDropLimit,
    String? googleCountryFilter,
  }) =>
      Config(
        pickupLocationToProviderLimit: pickupLocationToProviderLimit ?? this.pickupLocationToProviderLimit,
        providerLocationToDropLimit: providerLocationToDropLimit ?? this.providerLocationToDropLimit,
        googleCountryFilter: googleCountryFilter ?? this.googleCountryFilter,
      );

  factory Config.fromJson(String str) => Config.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Config.fromMap(Map<String, dynamic> json) => Config(
    pickupLocationToProviderLimit: json["pickup_location_to_provider_limit"],
    providerLocationToDropLimit: json["provider_location_to_drop_limit"],
    googleCountryFilter: json["google_country_filter"],
  );

  Map<String, dynamic> toMap() => {
    "pickup_location_to_provider_limit": pickupLocationToProviderLimit,
    "provider_location_to_drop_limit": providerLocationToDropLimit,
    "google_country_filter": googleCountryFilter,
  };
}

class Flag {
  int? id;
  int? serviceId;
  String? feedback;
  String? review;

  Flag({
    this.id,
    this.serviceId,
    this.feedback,
    this.review,
  });

  Flag copyWith({
    int? id,
    int? serviceId,
    String? feedback,
    String? review,
  }) =>
      Flag(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        feedback: feedback ?? this.feedback,
        review: review ?? this.review,
      );

  factory Flag.fromJson(String str) => Flag.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Flag.fromMap(Map<String, dynamic> json) => Flag(
    id: json["id"],
    serviceId: json["service_id"],
    feedback: json["feedback"],
    review: json["review"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "service_id": serviceId,
    "feedback": feedback,
    "review": review,
  };
}

class Location {
  int? type;
  int? bookId;

  Location({
    this.type,
    this.bookId,
  });

  Location copyWith({
    int? type,
    int? bookId,
  }) =>
      Location(
        type: type ?? this.type,
        bookId: bookId ?? this.bookId,
      );

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    type: json["type"],
    bookId: json["book_id"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "book_id": bookId,
  };
}

class UserUnread {
  int? msgCount;

  UserUnread({
    this.msgCount,
  });

  UserUnread copyWith({
    int? msgCount,
  }) =>
      UserUnread(
        msgCount: msgCount ?? this.msgCount,
      );

  factory UserUnread.fromJson(String str) => UserUnread.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserUnread.fromMap(Map<String, dynamic> json) => UserUnread(
    msgCount: json["msg_count"],
  );

  Map<String, dynamic> toMap() => {
    "msg_count": msgCount,
  };
}
*/
