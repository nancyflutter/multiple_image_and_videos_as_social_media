import 'dart:convert';

class BookmarkResponse {
  List<Supplier>? supplier;
  List<Restaurant>? restaurant;
  List<Post>? post;
  String? url;

  BookmarkResponse({
    this.supplier,
    this.restaurant,
    this.post,
    this.url,
  });

  BookmarkResponse copyWith({
    List<Supplier>? supplier,
    List<Restaurant>? restaurant,
    List<Post>? post,
    String? url,
  }) =>
      BookmarkResponse(
        supplier: supplier ?? this.supplier,
        restaurant: restaurant ?? this.restaurant,
        post: post ?? this.post,
        url: url ?? this.url,
      );

  factory BookmarkResponse.fromRawJson(String str) => BookmarkResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookmarkResponse.fromJson(Map<String, dynamic> json) => BookmarkResponse(
        supplier: json["supplier"] == null ? [] : List<Supplier>.from(json["supplier"]!.map((x) => Supplier.fromMap(x))),
        restaurant: json["restaurant"] == null ? [] : List<Restaurant>.from(json["restaurant"]!.map((x) => Restaurant.fromMap(x))),
        post: json["post"] == null ? [] : List<Post>.from(json["post"]!.map((x) => Post.fromMap(x))),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "supplier": supplier == null ? [] : List<dynamic>.from(supplier!.map((x) => x.toMap())),
        "restaurant": restaurant == null ? [] : List<dynamic>.from(restaurant!.map((x) => x.toMap())),
        "post": post == null ? [] : List<dynamic>.from(post!.map((x) => x.toMap())),
      };
}

class Supplier {
  int? id;
  String? loginEmail;
  String? password;
  String? contactName;
  dynamic bio;
  String? phoneNumber;
  String? mobileCode;
  String? mobileNumber;
  String? contactEmail;
  String? website;
  String? contactAddress;
  int? contactCountry;
  int? contactState;
  int? contactCity;
  String? postalCode;
  dynamic entityName;
  String? image;
  String? licenceNumber;
  String? ownerName;
  int? gender;
  String? supplierAddress;
  String? supplierPostcode;
  String? latitude;
  String? longitude;
  String? description;
  dynamic needToBring;
  int? supplierCountry;
  int? supplierState;
  int? supplierCity;
  String? serviceName;
  dynamic deviceToken;
  dynamic deviceId;
  dynamic deviceType;
  int? status;
  String? autoAccept;
  dynamic otp;
  int? isOtpVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Rating>? rating;

  Supplier({
    this.id,
    this.loginEmail,
    this.password,
    this.contactName,
    this.bio,
    this.phoneNumber,
    this.mobileCode,
    this.mobileNumber,
    this.contactEmail,
    this.website,
    this.contactAddress,
    this.contactCountry,
    this.contactState,
    this.contactCity,
    this.postalCode,
    this.entityName,
    this.image,
    this.licenceNumber,
    this.ownerName,
    this.gender,
    this.supplierAddress,
    this.supplierPostcode,
    this.latitude,
    this.longitude,
    this.description,
    this.needToBring,
    this.supplierCountry,
    this.supplierState,
    this.supplierCity,
    this.serviceName,
    this.deviceToken,
    this.deviceId,
    this.deviceType,
    this.status,
    this.autoAccept,
    this.otp,
    this.isOtpVerified,
    this.createdAt,
    this.updatedAt,
    this.rating,
  });

  Supplier copyWith({
    int? id,
    String? loginEmail,
    String? password,
    String? contactName,
    dynamic bio,
    String? phoneNumber,
    String? mobileCode,
    String? mobileNumber,
    String? contactEmail,
    String? website,
    String? contactAddress,
    int? contactCountry,
    int? contactState,
    int? contactCity,
    String? postalCode,
    dynamic entityName,
    String? image,
    String? licenceNumber,
    String? ownerName,
    int? gender,
    String? supplierAddress,
    String? supplierPostcode,
    String? latitude,
    String? longitude,
    String? description,
    dynamic needToBring,
    int? supplierCountry,
    int? supplierState,
    int? supplierCity,
    String? serviceName,
    dynamic deviceToken,
    dynamic deviceId,
    dynamic deviceType,
    int? status,
    String? autoAccept,
    dynamic otp,
    int? isOtpVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Rating>? rating,
  }) =>
      Supplier(
        id: id ?? this.id,
        loginEmail: loginEmail ?? this.loginEmail,
        password: password ?? this.password,
        contactName: contactName ?? this.contactName,
        bio: bio ?? this.bio,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mobileCode: mobileCode ?? this.mobileCode,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        contactEmail: contactEmail ?? this.contactEmail,
        website: website ?? this.website,
        contactAddress: contactAddress ?? this.contactAddress,
        contactCountry: contactCountry ?? this.contactCountry,
        contactState: contactState ?? this.contactState,
        contactCity: contactCity ?? this.contactCity,
        postalCode: postalCode ?? this.postalCode,
        entityName: entityName ?? this.entityName,
        image: image ?? this.image,
        licenceNumber: licenceNumber ?? this.licenceNumber,
        ownerName: ownerName ?? this.ownerName,
        gender: gender ?? this.gender,
        supplierAddress: supplierAddress ?? this.supplierAddress,
        supplierPostcode: supplierPostcode ?? this.supplierPostcode,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        description: description ?? this.description,
        needToBring: needToBring ?? this.needToBring,
        supplierCountry: supplierCountry ?? this.supplierCountry,
        supplierState: supplierState ?? this.supplierState,
        supplierCity: supplierCity ?? this.supplierCity,
        serviceName: serviceName ?? this.serviceName,
        deviceToken: deviceToken ?? this.deviceToken,
        deviceId: deviceId ?? this.deviceId,
        deviceType: deviceType ?? this.deviceType,
        status: status ?? this.status,
        autoAccept: autoAccept ?? this.autoAccept,
        otp: otp ?? this.otp,
        isOtpVerified: isOtpVerified ?? this.isOtpVerified,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        rating: rating ?? this.rating,
      );

  factory Supplier.fromJson(String str) => Supplier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Supplier.fromMap(Map<String, dynamic> json) => Supplier(
        id: json["id"],
        loginEmail: json["login_email"],
        password: json["password"],
        contactName: json["contact_name"],
        bio: json["bio"],
        phoneNumber: json["phone_number"],
        mobileCode: json["mobile_code"],
        mobileNumber: json["mobile_number"],
        contactEmail: json["contact_email"],
        website: json["website"],
        contactAddress: json["contact_address"],
        contactCountry: json["contact_country"],
        contactState: json["contact_state"],
        contactCity: json["contact_city"],
        postalCode: json["postal_code"],
        entityName: json["entity_name"],
        image: json["image"],
        licenceNumber: json["licence_number"],
        ownerName: json["owner_name"],
        gender: json["gender"],
        supplierAddress: json["supplier_address"],
        supplierPostcode: json["supplier_postcode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        needToBring: json["need_to_bring"],
        supplierCountry: json["supplier_country"],
        supplierState: json["supplier_state"],
        supplierCity: json["supplier_city"],
        serviceName: json["service_name"],
        deviceToken: json["device_token"],
        deviceId: json["device_id"],
        deviceType: json["device_type"],
        status: json["status"],
        autoAccept: json["auto_accept"],
        otp: json["otp"],
        isOtpVerified: json["is_otp_verified"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        rating: json["rating"] == null ? [] : List<Rating>.from(json["rating"]!.map((x) => Rating.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "login_email": loginEmail,
        "password": password,
        "contact_name": contactName,
        "bio": bio,
        "phone_number": phoneNumber,
        "mobile_code": mobileCode,
        "mobile_number": mobileNumber,
        "contact_email": contactEmail,
        "website": website,
        "contact_address": contactAddress,
        "contact_country": contactCountry,
        "contact_state": contactState,
        "contact_city": contactCity,
        "postal_code": postalCode,
        "entity_name": entityName,
        "image": image,
        "licence_number": licenceNumber,
        "owner_name": ownerName,
        "gender": gender,
        "supplier_address": supplierAddress,
        "supplier_postcode": supplierPostcode,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "need_to_bring": needToBring,
        "supplier_country": supplierCountry,
        "supplier_state": supplierState,
        "supplier_city": supplierCity,
        "service_name": serviceName,
        "device_token": deviceToken,
        "device_id": deviceId,
        "device_type": deviceType,
        "status": status,
        "auto_accept": autoAccept,
        "otp": otp,
        "is_otp_verified": isOtpVerified,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "rating": rating == null ? [] : List<dynamic>.from(rating!.map((x) => x.toMap())),
      };
}

class Rating {
  int? rating;
  int? supplierId;

  Rating({
    this.rating,
    this.supplierId,
  });

  Rating copyWith({
    int? rating,
    int? supplierId,
  }) =>
      Rating(
        rating: rating ?? this.rating,
        supplierId: supplierId ?? this.supplierId,
      );

  factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        rating: json["rating"],
        supplierId: json["supplier_id"],
      );

  Map<String, dynamic> toMap() => {
        "rating": rating,
        "supplier_id": supplierId,
      };
}

class Restaurant {
  Relationships? relationships;
  Attributes? attributes;
  String? type;
  String? id;

  Restaurant({
    this.relationships,
    this.attributes,
    this.type,
    this.id,
  });

  Restaurant copyWith({
    Relationships? relationships,
    Attributes? attributes,
    String? type,
    String? id,
  }) =>
      Restaurant(
        relationships: relationships ?? this.relationships,
        attributes: attributes ?? this.attributes,
        type: type ?? this.type,
        id: id ?? this.id,
      );

  factory Restaurant.fromJson(String str) => Restaurant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        relationships: json["relationships"] == null ? null : Relationships.fromMap(json["relationships"]),
        attributes: json["attributes"] == null ? null : Attributes.fromMap(json["attributes"]),
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "relationships": relationships?.toMap(),
        "attributes": attributes?.toMap(),
        "type": type,
        "id": id,
      };
}

class Attributes {
  String? contactEmail;
  bool? valet;
  String? termsAndConditions;
  bool? smoking;
  bool? availableOnline;
  List<String>? labels;
  String? establishmentType;
  bool? outdoorSeating;
  String? postalCode;
  bool? alcohol;
  String? website;
  String? ratingsAverage;
  String? province;
  String? imageUrl;
  int? reservationNoticeDuration;
  String? timeZoneName;
  String? neighborhood;
  String? attire;
  List<String>? imageUrls;
  dynamic notice;
  int? priceLevel;
  String? name;
  String? menuUrl;
  String? countryCode;
  String? customConfirmationComments;
  String? currency;
  String? neighborhoodId;
  String? operatingHours;
  String? phone;
  String? addressLine2;
  String? description;
  String? city;
  double? latitude;
  String? cuisine;
  String? region;
  List<String>? goodFor;
  String? partnerBookingWidgetUrl;
  int? minCovers;
  dynamic deal;
  String? regionId;
  List<String>? payments;
  double? longitude;
  int? maxCovers;
  String? externalRatingsUrl;
  int? ratingsCount;
  String? ratingsImg;
  String? cuisineId;
  String? addressLine1;
  String? slug;

  Attributes({
    this.contactEmail,
    this.valet,
    this.termsAndConditions,
    this.smoking,
    this.availableOnline,
    this.labels,
    this.establishmentType,
    this.outdoorSeating,
    this.postalCode,
    this.alcohol,
    this.website,
    this.ratingsAverage,
    this.province,
    this.imageUrl,
    this.reservationNoticeDuration,
    this.timeZoneName,
    this.neighborhood,
    this.attire,
    this.imageUrls,
    this.notice,
    this.priceLevel,
    this.name,
    this.menuUrl,
    this.countryCode,
    this.customConfirmationComments,
    this.currency,
    this.neighborhoodId,
    this.operatingHours,
    this.phone,
    this.addressLine2,
    this.description,
    this.city,
    this.latitude,
    this.cuisine,
    this.region,
    this.goodFor,
    this.partnerBookingWidgetUrl,
    this.minCovers,
    this.deal,
    this.regionId,
    this.payments,
    this.longitude,
    this.maxCovers,
    this.externalRatingsUrl,
    this.ratingsCount,
    this.ratingsImg,
    this.cuisineId,
    this.addressLine1,
    this.slug,
  });

  Attributes copyWith({
    String? contactEmail,
    bool? valet,
    String? termsAndConditions,
    bool? smoking,
    bool? availableOnline,
    List<String>? labels,
    String? establishmentType,
    bool? outdoorSeating,
    String? postalCode,
    bool? alcohol,
    String? website,
    String? ratingsAverage,
    String? province,
    String? imageUrl,
    int? reservationNoticeDuration,
    String? timeZoneName,
    String? neighborhood,
    String? attire,
    List<String>? imageUrls,
    dynamic notice,
    int? priceLevel,
    String? name,
    String? menuUrl,
    String? countryCode,
    String? customConfirmationComments,
    String? currency,
    String? neighborhoodId,
    String? operatingHours,
    String? phone,
    String? addressLine2,
    String? description,
    String? city,
    double? latitude,
    String? cuisine,
    String? region,
    List<String>? goodFor,
    String? partnerBookingWidgetUrl,
    int? minCovers,
    dynamic deal,
    String? regionId,
    List<String>? payments,
    double? longitude,
    int? maxCovers,
    String? externalRatingsUrl,
    int? ratingsCount,
    String? ratingsImg,
    String? cuisineId,
    String? addressLine1,
    String? slug,
  }) =>
      Attributes(
        contactEmail: contactEmail ?? this.contactEmail,
        valet: valet ?? this.valet,
        termsAndConditions: termsAndConditions ?? this.termsAndConditions,
        smoking: smoking ?? this.smoking,
        availableOnline: availableOnline ?? this.availableOnline,
        labels: labels ?? this.labels,
        establishmentType: establishmentType ?? this.establishmentType,
        outdoorSeating: outdoorSeating ?? this.outdoorSeating,
        postalCode: postalCode ?? this.postalCode,
        alcohol: alcohol ?? this.alcohol,
        website: website ?? this.website,
        ratingsAverage: ratingsAverage ?? this.ratingsAverage,
        province: province ?? this.province,
        imageUrl: imageUrl ?? this.imageUrl,
        reservationNoticeDuration: reservationNoticeDuration ?? this.reservationNoticeDuration,
        timeZoneName: timeZoneName ?? this.timeZoneName,
        neighborhood: neighborhood ?? this.neighborhood,
        attire: attire ?? this.attire,
        imageUrls: imageUrls ?? this.imageUrls,
        notice: notice ?? this.notice,
        priceLevel: priceLevel ?? this.priceLevel,
        name: name ?? this.name,
        menuUrl: menuUrl ?? this.menuUrl,
        countryCode: countryCode ?? this.countryCode,
        customConfirmationComments: customConfirmationComments ?? this.customConfirmationComments,
        currency: currency ?? this.currency,
        neighborhoodId: neighborhoodId ?? this.neighborhoodId,
        operatingHours: operatingHours ?? this.operatingHours,
        phone: phone ?? this.phone,
        addressLine2: addressLine2 ?? this.addressLine2,
        description: description ?? this.description,
        city: city ?? this.city,
        latitude: latitude ?? this.latitude,
        cuisine: cuisine ?? this.cuisine,
        region: region ?? this.region,
        goodFor: goodFor ?? this.goodFor,
        partnerBookingWidgetUrl: partnerBookingWidgetUrl ?? this.partnerBookingWidgetUrl,
        minCovers: minCovers ?? this.minCovers,
        deal: deal ?? this.deal,
        regionId: regionId ?? this.regionId,
        payments: payments ?? this.payments,
        longitude: longitude ?? this.longitude,
        maxCovers: maxCovers ?? this.maxCovers,
        externalRatingsUrl: externalRatingsUrl ?? this.externalRatingsUrl,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        ratingsImg: ratingsImg ?? this.ratingsImg,
        cuisineId: cuisineId ?? this.cuisineId,
        addressLine1: addressLine1 ?? this.addressLine1,
        slug: slug ?? this.slug,
      );

  factory Attributes.fromJson(String str) => Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        contactEmail: json["contact_email"],
        valet: json["valet"],
        termsAndConditions: json["terms_and_conditions"],
        smoking: json["smoking"],
        availableOnline: json["available_online"],
        labels: json["labels"] == null ? [] : List<String>.from(json["labels"]!.map((x) => x)),
        establishmentType: json["establishment_type"],
        outdoorSeating: json["outdoor_seating"],
        postalCode: json["postal_code"],
        alcohol: json["alcohol"],
        website: json["website"],
        ratingsAverage: json["ratings_average"],
        province: json["province"],
        imageUrl: json["image_url"],
        reservationNoticeDuration: json["reservation_notice_duration"],
        timeZoneName: json["time_zone_name"],
        neighborhood: json["neighborhood"],
        attire: json["attire"],
        imageUrls: json["image_urls"] == null ? [] : List<String>.from(json["image_urls"]!.map((x) => x)),
        notice: json["notice"],
        priceLevel: json["price_level"],
        name: json["name"],
        menuUrl: json["menu_url"],
        countryCode: json["country_code"],
        customConfirmationComments: json["custom_confirmation_comments"],
        currency: json["currency"],
        neighborhoodId: json["neighborhood_id"],
        operatingHours: json["operating_hours"],
        phone: json["phone"],
        addressLine2: json["address_line_2"],
        description: json["description"],
        city: json["city"],
        latitude: json["latitude"]?.toDouble(),
        cuisine: json["cuisine"],
        region: json["region"],
        goodFor: json["good_for"] == null ? [] : List<String>.from(json["good_for"]!.map((x) => x)),
        partnerBookingWidgetUrl: json["partner_booking_widget_url"],
        minCovers: json["min_covers"],
        deal: json["deal"],
        regionId: json["region_id"],
        payments: json["payments"] == null ? [] : List<String>.from(json["payments"]!.map((x) => x)),
        longitude: json["longitude"]?.toDouble(),
        maxCovers: json["max_covers"],
        externalRatingsUrl: json["external_ratings_url"],
        ratingsCount: json["ratings_count"],
        ratingsImg: json["ratings_img"],
        cuisineId: json["cuisine_id"],
        addressLine1: json["address_line_1"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "contact_email": contactEmail,
        "valet": valet,
        "terms_and_conditions": termsAndConditions,
        "smoking": smoking,
        "available_online": availableOnline,
        "labels": labels == null ? [] : List<dynamic>.from(labels!.map((x) => x)),
        "establishment_type": establishmentType,
        "outdoor_seating": outdoorSeating,
        "postal_code": postalCode,
        "alcohol": alcohol,
        "website": website,
        "ratings_average": ratingsAverage,
        "province": province,
        "image_url": imageUrl,
        "reservation_notice_duration": reservationNoticeDuration,
        "time_zone_name": timeZoneName,
        "neighborhood": neighborhood,
        "attire": attire,
        "image_urls": imageUrls == null ? [] : List<dynamic>.from(imageUrls!.map((x) => x)),
        "notice": notice,
        "price_level": priceLevel,
        "name": name,
        "menu_url": menuUrl,
        "country_code": countryCode,
        "custom_confirmation_comments": customConfirmationComments,
        "currency": currency,
        "neighborhood_id": neighborhoodId,
        "operating_hours": operatingHours,
        "phone": phone,
        "address_line_2": addressLine2,
        "description": description,
        "city": city,
        "latitude": latitude,
        "cuisine": cuisine,
        "region": region,
        "good_for": goodFor == null ? [] : List<dynamic>.from(goodFor!.map((x) => x)),
        "partner_booking_widget_url": partnerBookingWidgetUrl,
        "min_covers": minCovers,
        "deal": deal,
        "region_id": regionId,
        "payments": payments == null ? [] : List<dynamic>.from(payments!.map((x) => x)),
        "longitude": longitude,
        "max_covers": maxCovers,
        "external_ratings_url": externalRatingsUrl,
        "ratings_count": ratingsCount,
        "ratings_img": ratingsImg,
        "cuisine_id": cuisineId,
        "address_line_1": addressLine1,
        "slug": slug,
      };
}

class Relationships {
  Relationships();

  factory Relationships.fromJson(String str) => Relationships.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Relationships.fromMap(Map<String, dynamic> json) => Relationships();

  Map<String, dynamic> toMap() => {};
}

class Post {
  int? id;
  int? publisherId;
  String? postBy;
  String? title;
  String? description;
  String? location;
  dynamic tag;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? likes;
  int? comments;
  int? liked;
  int? isBookmark;
  List<Media>? media;
  List<PostSupplier>? supplier;
  List<User>? user;

  Post({
    this.id,
    this.publisherId,
    this.postBy,
    this.title,
    this.description,
    this.location,
    this.tag,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.likes,
    this.comments,
    this.liked,
    this.isBookmark,
    this.media,
    this.supplier,
    this.user,
  });

  Post copyWith({
    int? id,
    int? publisherId,
    String? postBy,
    String? title,
    String? description,
    String? location,
    dynamic tag,
    String? type,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? likes,
    int? comments,
    int? liked,
    int? isBookmark,
    List<Media>? media,
    List<PostSupplier>? supplier,
    List<User>? user,
  }) =>
      Post(
        id: id ?? this.id,
        publisherId: publisherId ?? this.publisherId,
        postBy: postBy ?? this.postBy,
        title: title ?? this.title,
        description: description ?? this.description,
        location: location ?? this.location,
        tag: tag ?? this.tag,
        type: type ?? this.type,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        likes: likes ?? this.likes,
        comments: comments ?? this.comments,
        liked: liked ?? this.liked,
        isBookmark: isBookmark ?? this.isBookmark,
        media: media ?? this.media,
        supplier: supplier ?? this.supplier,
        user: user ?? this.user,
      );

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        publisherId: json["publisher_id"],
        postBy: json["post_by"],
        title: json["title"],
        description: json["description"],
        location: json["location"],
        tag: json["tag"],
        type: json["type"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        likes: json["likes"],
        comments: json["comments"],
        liked: json["liked"],
        isBookmark: json["is_bookmark"],
        media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromMap(x))),
        supplier: json["supplier"] == null ? [] : List<PostSupplier>.from(json["supplier"]!.map((x) => PostSupplier.fromMap(x))),
        user: json["user"] == null ? [] : List<User>.from(json["user"]!.map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "publisher_id": publisherId,
        "post_by": postBy,
        "title": title,
        "description": description,
        "location": location,
        "tag": tag,
        "type": type,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "likes": likes,
        "comments": comments,
        "liked": liked,
        "is_bookmark": isBookmark,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toMap())),
        "supplier": supplier == null ? [] : List<dynamic>.from(supplier!.map((x) => x.toMap())),
        "user": user == null ? [] : List<dynamic>.from(user!.map((x) => x)),
      };
}

class Media {
  int? id;
  int? postId;
  String? media;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  Media({
    this.id,
    this.postId,
    this.media,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  Media copyWith({
    int? id,
    int? postId,
    String? media,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Media(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        media: media ?? this.media,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Media.fromJson(String str) => Media.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        id: json["id"],
        postId: json["post_id"],
        media: json["media"],
        type: json["type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "post_id": postId,
        "media": media,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class User {
  int? id;
  String? fullName;
  String? image;

  User({
    this.id,
    this.fullName,
    this.image,
  });

  User copyWith({
    int? id,
    String? fullName,
    String? image,
  }) =>
      User(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        image: image ?? this.image,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "full_name": fullName,
        "image": image,
      };
}

class PostSupplier {
  int? id;
  String? serviceName;
  String? image;

  PostSupplier({
    this.id,
    this.serviceName,
    this.image,
  });

  PostSupplier copyWith({
    int? id,
    String? serviceName,
    String? image,
  }) =>
      PostSupplier(
        id: id ?? this.id,
        serviceName: serviceName ?? this.serviceName,
        image: image ?? this.image,
      );

  factory PostSupplier.fromJson(String str) => PostSupplier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostSupplier.fromMap(Map<String, dynamic> json) => PostSupplier(
        id: json["id"],
        serviceName: json["service_name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "service_name": serviceName,
        "image": image,
      };
}
