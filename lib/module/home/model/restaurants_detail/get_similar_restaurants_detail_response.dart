import 'dart:convert';

class GetSimilarRestaurantsDetailResponse {
  String? id;
  String? type;
  Attributes? attributes;
  Relationships? relationships;

  GetSimilarRestaurantsDetailResponse({
    this.id,
    this.type,
    this.attributes,
    this.relationships,
  });

  GetSimilarRestaurantsDetailResponse copyWith({
    String? id,
    String? type,
    Attributes? attributes,
    Relationships? relationships,
  }) =>
      GetSimilarRestaurantsDetailResponse(
        id: id ?? this.id,
        type: type ?? this.type,
        attributes: attributes ?? this.attributes,
        relationships: relationships ?? this.relationships,
      );

  factory GetSimilarRestaurantsDetailResponse.fromRawJson(String str) => GetSimilarRestaurantsDetailResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetSimilarRestaurantsDetailResponse.fromJson(Map<String, dynamic> json) => GetSimilarRestaurantsDetailResponse(
    id: json["id"],
    type: json["type"],
    attributes: json["attributes"] == null ? null : Attributes.fromMap(json["attributes"]),
    relationships: json["relationships"] == null ? null : Relationships.fromMap(json["relationships"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "attributes": attributes?.toMap(),
    "relationships": relationships?.toMap(),
  };
}

class Attributes {
  String? name;
  String? description;
  String? timeZoneName;
  String? contactEmail;
  String? phone;
  String? countryCode;
  int? reservationNoticeDuration;
  dynamic notice;
  int? priceLevel;
  String? operatingHours;
  String? establishmentType;
  String? attire;
  bool? valet;
  bool? alcohol;
  bool? outdoorSeating;
  bool? smoking;
  dynamic deal;
  List<String>? labels;
  List<String>? goodFor;
  List<String>? payments;
  String? termsAndConditions;
  int? minCovers;
  int? maxCovers;
  bool? availableOnline;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? province;
  String? postalCode;
  String? slug;
  String? customConfirmationComments;
  dynamic currency;
  String? regionId;
  String? cuisineId;
  String? neighborhoodId;
  double? latitude;
  double? longitude;
  String? imageUrl;
  List<String>? imageUrls;
  String? menuUrl;
  String? region;
  String? cuisine;
  String? neighborhood;
  String? ratingsImg;
  String? ratingsAverage;
  int? ratingsCount;
  String? externalRatingsUrl;
  String? website;
  String? partnerBookingWidgetUrl;
  String? externalRa172548990DTingsUrl;
  dynamic menuU172548991DRl;
  String? web172548991DSite;

  Attributes({
    this.name,
    this.description,
    this.timeZoneName,
    this.contactEmail,
    this.phone,
    this.countryCode,
    this.reservationNoticeDuration,
    this.notice,
    this.priceLevel,
    this.operatingHours,
    this.establishmentType,
    this.attire,
    this.valet,
    this.alcohol,
    this.outdoorSeating,
    this.smoking,
    this.deal,
    this.labels,
    this.goodFor,
    this.payments,
    this.termsAndConditions,
    this.minCovers,
    this.maxCovers,
    this.availableOnline,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.province,
    this.postalCode,
    this.slug,
    this.customConfirmationComments,
    this.currency,
    this.regionId,
    this.cuisineId,
    this.neighborhoodId,
    this.latitude,
    this.longitude,
    this.imageUrl,
    this.imageUrls,
    this.menuUrl,
    this.region,
    this.cuisine,
    this.neighborhood,
    this.ratingsImg,
    this.ratingsAverage,
    this.ratingsCount,
    this.externalRatingsUrl,
    this.website,
    this.partnerBookingWidgetUrl,
    this.externalRa172548990DTingsUrl,
    this.menuU172548991DRl,
    this.web172548991DSite,
  });

  Attributes copyWith({
    String? name,
    String? description,
    String? timeZoneName,
    String? contactEmail,
    String? phone,
    String? countryCode,
    int? reservationNoticeDuration,
    dynamic notice,
    int? priceLevel,
    String? operatingHours,
    String? establishmentType,
    String? attire,
    bool? valet,
    bool? alcohol,
    bool? outdoorSeating,
    bool? smoking,
    dynamic deal,
    List<String>? labels,
    List<String>? goodFor,
    List<String>? payments,
    String? termsAndConditions,
    int? minCovers,
    int? maxCovers,
    bool? availableOnline,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? province,
    String? postalCode,
    String? slug,
    String? customConfirmationComments,
    dynamic currency,
    String? regionId,
    String? cuisineId,
    String? neighborhoodId,
    double? latitude,
    double? longitude,
    String? imageUrl,
    List<String>? imageUrls,
    String? menuUrl,
    String? region,
    String? cuisine,
    String? neighborhood,
    String? ratingsImg,
    String? ratingsAverage,
    int? ratingsCount,
    String? externalRatingsUrl,
    String? website,
    String? partnerBookingWidgetUrl,
    String? externalRa172548990DTingsUrl,
    dynamic menuU172548991DRl,
    String? web172548991DSite,
  }) =>
      Attributes(
        name: name ?? this.name,
        description: description ?? this.description,
        timeZoneName: timeZoneName ?? this.timeZoneName,
        contactEmail: contactEmail ?? this.contactEmail,
        phone: phone ?? this.phone,
        countryCode: countryCode ?? this.countryCode,
        reservationNoticeDuration: reservationNoticeDuration ?? this.reservationNoticeDuration,
        notice: notice ?? this.notice,
        priceLevel: priceLevel ?? this.priceLevel,
        operatingHours: operatingHours ?? this.operatingHours,
        establishmentType: establishmentType ?? this.establishmentType,
        attire: attire ?? this.attire,
        valet: valet ?? this.valet,
        alcohol: alcohol ?? this.alcohol,
        outdoorSeating: outdoorSeating ?? this.outdoorSeating,
        smoking: smoking ?? this.smoking,
        deal: deal ?? this.deal,
        labels: labels ?? this.labels,
        goodFor: goodFor ?? this.goodFor,
        payments: payments ?? this.payments,
        termsAndConditions: termsAndConditions ?? this.termsAndConditions,
        minCovers: minCovers ?? this.minCovers,
        maxCovers: maxCovers ?? this.maxCovers,
        availableOnline: availableOnline ?? this.availableOnline,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        city: city ?? this.city,
        province: province ?? this.province,
        postalCode: postalCode ?? this.postalCode,
        slug: slug ?? this.slug,
        customConfirmationComments: customConfirmationComments ?? this.customConfirmationComments,
        currency: currency ?? this.currency,
        regionId: regionId ?? this.regionId,
        cuisineId: cuisineId ?? this.cuisineId,
        neighborhoodId: neighborhoodId ?? this.neighborhoodId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        imageUrl: imageUrl ?? this.imageUrl,
        imageUrls: imageUrls ?? this.imageUrls,
        menuUrl: menuUrl ?? this.menuUrl,
        region: region ?? this.region,
        cuisine: cuisine ?? this.cuisine,
        neighborhood: neighborhood ?? this.neighborhood,
        ratingsImg: ratingsImg ?? this.ratingsImg,
        ratingsAverage: ratingsAverage ?? this.ratingsAverage,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        externalRatingsUrl: externalRatingsUrl ?? this.externalRatingsUrl,
        website: website ?? this.website,
        partnerBookingWidgetUrl: partnerBookingWidgetUrl ?? this.partnerBookingWidgetUrl,
        externalRa172548990DTingsUrl: externalRa172548990DTingsUrl ?? this.externalRa172548990DTingsUrl,
        menuU172548991DRl: menuU172548991DRl ?? this.menuU172548991DRl,
        web172548991DSite: web172548991DSite ?? this.web172548991DSite,
      );

  factory Attributes.fromJson(String str) => Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
    name: json["name"],
    description: json["description"],
    timeZoneName: json["time_zone_name"],
    contactEmail: json["contact_email"],
    phone: json["phone"],
    countryCode: json["country_code"],
    reservationNoticeDuration: json["reservation_notice_duration"],
    notice: json["notice"],
    priceLevel: json["price_level"],
    operatingHours: json["operating_hours"],
    establishmentType: json["establishment_type"],
    attire: json["attire"],
    valet: json["valet"],
    alcohol: json["alcohol"],
    outdoorSeating: json["outdoor_seating"],
    smoking: json["smoking"],
    deal: json["deal"],
    labels: json["labels"] == null ? [] : List<String>.from(json["labels"]!.map((x) => x)),
    goodFor: json["good_for"] == null ? [] : List<String>.from(json["good_for"]!.map((x) => x)),
    payments: json["payments"] == null ? [] : List<String>.from(json["payments"]!.map((x) => x)),
    termsAndConditions: json["terms_and_conditions"],
    minCovers: json["min_covers"],
    maxCovers: json["max_covers"],
    availableOnline: json["available_online"],
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    city: json["city"],
    province: json["province"],
    postalCode: json["postal_code"],
    slug: json["slug"],
    customConfirmationComments: json["custom_confirmation_comments"],
    currency: json["currency"],
    regionId: json["region_id"],
    cuisineId: json["cuisine_id"],
    neighborhoodId: json["neighborhood_id"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    imageUrl: json["image_url"],
    imageUrls: json["image_urls"] == null ? [] : List<String>.from(json["image_urls"]!.map((x) => x)),
    menuUrl: json["menu_url"],
    region: json["region"],
    cuisine: json["cuisine"],
    neighborhood: json["neighborhood"],
    ratingsImg: json["ratings_img"],
    ratingsAverage: json["ratings_average"],
    ratingsCount: json["ratings_count"],
    externalRatingsUrl: json["external_ratings_url"],
    website: json["website"],
    partnerBookingWidgetUrl: json["partner_booking_widget_url"],
    externalRa172548990DTingsUrl: json["external_ra\n17:25:48.990  D  tings_url"],
    menuU172548991DRl: json["menu_u\n17:25:48.991  D  rl"],
    web172548991DSite: json["web\n17:25:48.991  D  site"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "description": description,
    "time_zone_name": timeZoneName,
    "contact_email": contactEmail,
    "phone": phone,
    "country_code": countryCode,
    "reservation_notice_duration": reservationNoticeDuration,
    "notice": notice,
    "price_level": priceLevel,
    "operating_hours": operatingHours,
    "establishment_type": establishmentType,
    "attire": attire,
    "valet": valet,
    "alcohol": alcohol,
    "outdoor_seating": outdoorSeating,
    "smoking": smoking,
    "deal": deal,
    "labels": labels == null ? [] : List<dynamic>.from(labels!.map((x) => x)),
    "good_for": goodFor == null ? [] : List<dynamic>.from(goodFor!.map((x) => x)),
    "payments": payments == null ? [] : List<dynamic>.from(payments!.map((x) => x)),
    "terms_and_conditions": termsAndConditions,
    "min_covers": minCovers,
    "max_covers": maxCovers,
    "available_online": availableOnline,
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "city": city,
    "province": province,
    "postal_code": postalCode,
    "slug": slug,
    "custom_confirmation_comments": customConfirmationComments,
    "currency": currency,
    "region_id": regionId,
    "cuisine_id": cuisineId,
    "neighborhood_id": neighborhoodId,
    "latitude": latitude,
    "longitude": longitude,
    "image_url": imageUrl,
    "image_urls": imageUrls == null ? [] : List<dynamic>.from(imageUrls!.map((x) => x)),
    "menu_url": menuUrl,
    "region": region,
    "cuisine": cuisine,
    "neighborhood": neighborhood,
    "ratings_img": ratingsImg,
    "ratings_average": ratingsAverage,
    "ratings_count": ratingsCount,
    "external_ratings_url": externalRatingsUrl,
    "website": website,
    "partner_booking_widget_url": partnerBookingWidgetUrl,
    "external_ra\n17:25:48.990  D  tings_url": externalRa172548990DTingsUrl,
    "menu_u\n17:25:48.991  D  rl": menuU172548991DRl,
    "web\n17:25:48.991  D  site": web172548991DSite,
  };
}

class Relationships {
  Relationships();

  factory Relationships.fromJson(String str) => Relationships.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Relationships.fromMap(Map<String, dynamic> json) => Relationships();

  Map<String, dynamic> toMap() => {};
}

