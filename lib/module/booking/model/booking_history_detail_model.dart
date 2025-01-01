import 'dart:convert';

class BookingHistoryDetailsPayload {
  String? userId;
  String? timeZone;
  String? bookId;

  BookingHistoryDetailsPayload({
    this.userId,
    this.timeZone,
    this.bookId,
  });

  BookingHistoryDetailsPayload copyWith({
    String? userId,
    String? timeZone,
    String? bookId,
  }) =>
      BookingHistoryDetailsPayload(
        userId: userId ?? this.userId,
        timeZone: timeZone ?? this.timeZone,
        bookId: bookId ?? this.bookId,
      );

  factory BookingHistoryDetailsPayload.fromJson(String str) => BookingHistoryDetailsPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingHistoryDetailsPayload.fromMap(Map<String, dynamic> json) => BookingHistoryDetailsPayload(
    userId: json["user_id"],
    timeZone: json["timeZone"],
    bookId: json["book_id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "timeZone": timeZone,
    "book_id": bookId,
  };
}




class BookingHistoryDetailsResponse {
  // BookingHistoryResponse properties
  int? id;
  String? bookNumber;
  String? bookingType;
  String? serviceId;
  dynamic categoryId;
  int? userId;
  String? fullName;
  String? mobileNumber;
  String? emailId;
  String? numberOfPerson;
  String? chargePerPerson;
  int? cab;
  String? pickupAddress;
  String? pickupLat;
  String? pickupLng;
  int? returnCab;
  String? returnAddress;
  String? returnLat;
  String? returnLng;
  String? distance;
  String? distanceTime;
  String? pickupCharge;
  int? driverId;
  String? returnDriverId;
  String? returnDistance;
  String? returnTime;
  String? returnCharge;
  int? rideType;
  String? isPromoUsed;
  int? promoId;
  String? discount;
  String? discountAmount;
  String? taxPer;
  String? taxAmount;
  String? deliveryRate;
  String? deliveryCharge;
  String? otherCharges;
  String? subTotal;
  String? totalAmount;
  String? coinDiscount;
  String? usedCoin;
  String? cardNumber;
  String? cvv;
  String? expDate;
  DateTime? date;
  String? time;
  int? isCod;
  int? status;
  String? flag;
  String? cancelReason;
  dynamic? cancellationCharges;
  int? isPopupOpen;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? earnedCoin;
  String? reservationId;
  String? restaurantId;
  String? eatStatus;
  DateTime? eatStartTime;
  DateTime? eatEndTime;
  int? allUnread;
  int? driverUnread;
  int? returnDriverUnread;
  int? supplierUnread;
  SupplierDetails? supplierDetails;
  String? statusString;
  List<History>? history;
  bool? isReturn;
  bool? requestPickupSend;
  bool? requestPickup;
  RestaurantsdDetail? restaurantsdDetail;
  ReservationDetail? reservationDetail;
  Supplier? supplier;
  dynamic startTime;
  List<BookingDetailService>? service;
  String? serviceName;

  // BookingHistoryDetailsResponse properties
  int? historyStatus;
  String? historyStatusString;
  int? historyFlag;

  BookingHistoryDetailsResponse({
    // BookingHistoryResponse properties
    this.id,
    this.bookNumber,
    this.bookingType,
    this.serviceId,
    this.categoryId,
    this.userId,
    this.fullName,
    this.mobileNumber,
    this.emailId,
    this.numberOfPerson,
    this.chargePerPerson,
    this.cab,
    this.pickupAddress,
    this.pickupLat,
    this.pickupLng,
    this.returnCab,
    this.returnAddress,
    this.returnLat,
    this.returnLng,
    this.distance,
    this.distanceTime,
    this.pickupCharge,
    this.driverId,
    this.returnDriverId,
    this.returnDistance,
    this.returnTime,
    this.returnCharge,
    this.rideType,
    this.isPromoUsed,
    this.promoId,
    this.discount,
    this.discountAmount,
    this.taxPer,
    this.taxAmount,
    this.deliveryRate,
    this.deliveryCharge,
    this.otherCharges,
    this.subTotal,
    this.totalAmount,
    this.coinDiscount,
    this.usedCoin,
    this.cardNumber,
    this.cvv,
    this.expDate,
    this.date,
    this.time,
    this.isCod,
    this.status,
    this.flag,
    this.cancelReason,
    this.cancellationCharges,
    this.isPopupOpen,
    this.createdAt,
    this.updatedAt,
    this.earnedCoin,
    this.reservationId,
    this.restaurantId,
    this.eatStatus,
    this.eatStartTime,
    this.eatEndTime,
    this.allUnread,
    this.driverUnread,
    this.returnDriverUnread,
    this.supplierUnread,
    this.supplierDetails,
    this.statusString,
    this.history,
    this.isReturn,
    this.requestPickupSend,
    this.requestPickup,
    this.restaurantsdDetail,
    this.reservationDetail,
    this.supplier,
    this.startTime,
    this.service,
    this.serviceName,

    // BookingHistoryDetailsResponse properties
    this.historyStatus,
    this.historyStatusString,
    this.historyFlag,
  });

  factory BookingHistoryDetailsResponse.fromJson(String str) => BookingHistoryDetailsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingHistoryDetailsResponse.fromMap(Map<String, dynamic> json) => BookingHistoryDetailsResponse(
    // BookingHistoryResponse properties
    id: json["id"],
    bookNumber: json["book_number"],
    bookingType: json["booking_type"],
    serviceId: json["service_id"].toString(),
    categoryId: json["category_id"],
    userId: json["user_id"],
    fullName: json["full_name"],
    mobileNumber: json["mobile_number"],
    emailId: json["email_id"],
    numberOfPerson: json["number_of_person"],
    chargePerPerson: json["charge_per_person"],
    cab: json["cab"],
    pickupAddress: json["pickup_address"],
    pickupLat: json["pickup_lat"],
    pickupLng: json["pickup_lng"],
    returnCab: json["return_cab"],
    returnAddress: json["return_address"],
    returnLat: json["return_lat"],
    returnLng: json["return_lng"],
    distance: json["distance"],
    distanceTime: json["distance_time"],
    pickupCharge: json["pickup_charge"],
    driverId: json["driver_id"],
    returnDriverId: json["return_driver_id"],
    returnDistance: json["return_distance"],
    returnTime: json["return_time"],
    returnCharge: json["return_charge"],
    rideType: json["ride_type"],
    isPromoUsed: json["is_promo_used"].toString(),
    promoId: json["promo_id"],
    discount: json["discount"],
    discountAmount: json["discount_amount"],
    taxPer: json["tax_per"],
    taxAmount: json["tax_amount"],
    deliveryRate: json["delivery_rate"],
    deliveryCharge: json["delivery_charge"],
    otherCharges: json["other_charges"].toString(),
    subTotal: json["sub_total"],
    totalAmount: json["total_amount"].toString(),
    coinDiscount: json["coin_discount"],
    usedCoin: json["used_coin"],
    cardNumber: json["card_number"],
    cvv: json["cvv"],
    expDate: json["exp_date"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    isCod: json["is_cod"],
    status: json["status"],
    flag: json["flag"],
    cancelReason: json["cancel_reason"],
    cancellationCharges: json["cancellation_charges"],
    isPopupOpen: json["is_popup_open"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    earnedCoin: json["earned_coin"],
    reservationId: json["reservation_id"],
    restaurantId: json["restaurant_id"],
    eatStatus: json["eat_status"],
    eatStartTime: json["eat_start_time"] == null ||  json["eat_start_time"] ==""  ? null : DateTime.parse(json["eat_start_time"]),
    eatEndTime: json["eat_end_time"] == null || json["eat_end_time"] == "" ? null : DateTime.parse(json["eat_end_time"]),
    allUnread: json["all_unread"],
    driverUnread: json["driver_unread"],
    returnDriverUnread: json["return_driver_unread"],
    supplierUnread: json["supplier_unread"],
    supplierDetails: json["supplier_details"] == "" ? null : SupplierDetails.fromMap(json["supplier_details"]),
    statusString: json["status_string"],
    history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromMap(x))),
    isReturn: json["is_return"],
    requestPickupSend: json["request_pickup_send"],
    requestPickup: json["request_pickup"],
    restaurantsdDetail: json["restaurantsd_detail"] == null ? null : RestaurantsdDetail.fromMap(json["restaurantsd_detail"]),
    reservationDetail: json["reservation_detail"] == null ? null : ReservationDetail.fromMap(json["reservation_detail"]),
    supplier: json["supplier"] == null ? null : Supplier.fromMap(json["supplier"]),
    startTime: json["start_time"] == null ? null : (json["start_time"]),//DateTime.parse(json["start_time"]),
    service: json["service"] == null ? [] : List<BookingDetailService>.from(json["service"]!.map((x) => BookingDetailService.fromJson(x))),
    serviceName: json["service_name"],

    // BookingHistoryDetailsResponse properties
    historyStatus: json["history_status"],
    historyStatusString: json["history_status_string"],
    historyFlag: json["history_flag"],
  );

  Map<String, dynamic> toMap() => {
    // BookingHistoryResponse properties
    "id": id,
    "book_number": bookNumber,
    "booking_type": bookingType,
    "service_id": serviceId,
    "category_id": categoryId,
    "user_id": userId,
    "full_name": fullName,
    "mobile_number": mobileNumber,
    "email_id": emailId,
    "number_of_person": numberOfPerson,
    "charge_per_person": chargePerPerson,
    "cab": cab,
    "pickup_address": pickupAddress,
    "pickup_lat": pickupLat,
    "pickup_lng": pickupLng,
    "return_cab": returnCab,
    "return_address": returnAddress,
    "return_lat": returnLat,
    "return_lng": returnLng,
    "distance": distance,
    "distance_time": distanceTime,
    "pickup_charge": pickupCharge,
    "driver_id": driverId,
    "return_driver_id": returnDriverId,
    "return_distance": returnDistance,
    "return_time": returnTime,
    "return_charge": returnCharge,
    "ride_type": rideType,
    "is_promo_used": isPromoUsed,
    "promo_id": promoId,
    "discount": discount,
    "discount_amount": discountAmount,
    "tax_per": taxPer,
    "tax_amount": taxAmount,
    "delivery_rate": deliveryRate,
    "delivery_charge": deliveryCharge,
    "other_charges": otherCharges,
    "sub_total": subTotal,
    "total_amount": totalAmount,
    "coin_discount": coinDiscount,
    "used_coin": usedCoin,
    "card_number": cardNumber,
    "cvv": cvv,
    "exp_date": expDate,
    "date": date?.toIso8601String(),
    "time": time,
    "is_cod": isCod,
    "status": status,
    "flag": flag,
    "cancel_reason": cancelReason,
    "cancellation_charges": cancellationCharges,
    "is_popup_open": isPopupOpen,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "earned_coin": earnedCoin,
    "reservation_id": reservationId,
    "restaurant_id": restaurantId,
    "eat_status": eatStatus,
    "eat_start_time": eatStartTime?.toIso8601String(),
    "eat_end_time": eatEndTime?.toIso8601String(),
    "all_unread": allUnread,
    "driver_unread": driverUnread,
    "return_driver_unread": returnDriverUnread,
    "supplier_unread": supplierUnread,
    "supplier_details": supplierDetails?.toMap(),
    "status_string": statusString,
    "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toMap())),
    "is_return": isReturn,
    "request_pickup_send": requestPickupSend,
    "request_pickup": requestPickup,
    "restaurantsd_detail": restaurantsdDetail?.toMap(),
    "reservation_detail": reservationDetail?.toMap(),
    "supplier": supplier?.toMap(),
    "start_time": startTime,
    "service": service == null ? [] : List<BookingDetailService>.from(service!.map((x) => x.toJson())),
    "service_name": serviceName,

    // BookingHistoryDetailsResponse properties
    "history_status": historyStatus,
    "history_status_string": historyStatusString,
    "history_flag": historyFlag,
  };
}

class History {
  int? status;
  String? statusString;
  int? flag;

  History({
    this.status,
    this.statusString,
    this.flag,
  });

  factory History.fromJson(String str) => History.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory History.fromMap(Map<String, dynamic> json) => History(
    status: json["status"],
    statusString: json["status_string"],
    flag: json["flag"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "status_string": statusString,
    "flag": flag,
  };
}

class ReservationDetail {
  String? id;
  String? type;
  ReservationDetailAttributes? attributes;
  ReservationDetailRelationships? relationships;

  ReservationDetail({
    this.id,
    this.type,
    this.attributes,
    this.relationships,
  });

  factory ReservationDetail.fromJson(String str) => ReservationDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservationDetail.fromMap(Map<String, dynamic> json) => ReservationDetail(
    id: json["id"],
    type: json["type"],
    attributes: json["attributes"] == null ? null : ReservationDetailAttributes.fromMap(json["attributes"]),
    relationships: json["relationships"] == null ? null : ReservationDetailRelationships.fromMap(json["relationships"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "attributes": attributes?.toMap(),
    "relationships": relationships?.toMap(),
  };
}

class ReservationDetailAttributes {
  String? key;
  String? restaurantId;
  int? covers;
  int? duration;
  String? status;
  dynamic notes;
  dynamic idempotencyToken;
  DateTime? startTime;
  DateTime? endTime;
  dynamic partnerReservationSid;
  String? guestId;
  dynamic partnerGuestSid;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  ReservationDetailAttributes({
    this.key,
    this.restaurantId,
    this.covers,
    this.duration,
    this.status,
    this.notes,
    this.idempotencyToken,
    this.startTime,
    this.endTime,
    this.partnerReservationSid,
    this.guestId,
    this.partnerGuestSid,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory ReservationDetailAttributes.fromJson(String str) => ReservationDetailAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservationDetailAttributes.fromMap(Map<String, dynamic> json) => ReservationDetailAttributes(
    key: json["key"],
    restaurantId: json["restaurant_id"],
    covers: json["covers"],
    duration: json["duration"],
    status: json["status"],
    notes: json["notes"],
    idempotencyToken: json["idempotency_token"],
    startTime: json["start_time"] == null ? null : DateTime.parse(json["start_time"]),
    endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
    partnerReservationSid: json["partner_reservation_sid"],
    guestId: json["guest_id"],
    partnerGuestSid: json["partner_guest_sid"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    email: json["email"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "key": key,
    "restaurant_id": restaurantId,
    "covers": covers,
    "duration": duration,
    "status": status,
    "notes": notes,
    "idempotency_token": idempotencyToken,
    "start_time": startTime?.toIso8601String(),
    "end_time": endTime?.toIso8601String(),
    "partner_reservation_sid": partnerReservationSid,
    "guest_id": guestId,
    "partner_guest_sid": partnerGuestSid,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class ReservationDetailRelationships {
  Preference? preference;

  ReservationDetailRelationships({
    this.preference,
  });

  factory ReservationDetailRelationships.fromJson(String str) => ReservationDetailRelationships.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservationDetailRelationships.fromMap(Map<String, dynamic> json) => ReservationDetailRelationships(
    preference: json["preference"] == null ? null : Preference.fromMap(json["preference"]),
  );

  Map<String, dynamic> toMap() => {
    "preference": preference?.toMap(),
  };
}

class Preference {
  dynamic data;

  Preference({
    this.data,
  });

  factory Preference.fromJson(String str) => Preference.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Preference.fromMap(Map<String, dynamic> json) => Preference(
    data: json["data"],
  );

  Map<String, dynamic> toMap() => {
    "data": data,
  };
}

class RestaurantsdDetail {
  String? id;
  String? type;
  RestaurantsdDetailAttributes? attributes;
  RestaurantsdDetailRelationships? relationships;

  RestaurantsdDetail({
    this.id,
    this.type,
    this.attributes,
    this.relationships,
  });

  factory RestaurantsdDetail.fromJson(String str) => RestaurantsdDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantsdDetail.fromMap(Map<String, dynamic> json) => RestaurantsdDetail(
    id: json["id"],
    type: json["type"],
    attributes: json["attributes"] == null ? null : RestaurantsdDetailAttributes.fromMap(json["attributes"]),
    relationships: json["relationships"] == null ? null : RestaurantsdDetailRelationships.fromMap(json["relationships"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "attributes": attributes?.toMap(),
    "relationships": relationships?.toMap(),
  };
}

class RestaurantsdDetailAttributes {
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
  dynamic termsAndConditions;
  int? minCovers;
  int? maxCovers;
  bool? availableOnline;
  String? addressLine1;
  dynamic addressLine2;
  String? city;
  String? province;
  String? postalCode;
  String? slug;
  dynamic customConfirmationComments;
  dynamic currency;
  String? regionId;
  String? cuisineId;
  String? neighborhoodId;
  double? latitude;
  double? longitude;
  String? imageUrl;
  List<String>? imageUrls;
  dynamic menuUrl;
  String? region;
  String? cuisine;
  String? neighborhood;
  String? ratingsImg;
  String? ratingsAverage;
  int? ratingsCount;
  String? externalRatingsUrl;
  String? website;
  String? part165232570DNerBookingWidgetUrl;

  RestaurantsdDetailAttributes({
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
    this.part165232570DNerBookingWidgetUrl,
  });

  factory RestaurantsdDetailAttributes.fromJson(String str) => RestaurantsdDetailAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantsdDetailAttributes.fromMap(Map<String, dynamic> json) => RestaurantsdDetailAttributes(
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
    part165232570DNerBookingWidgetUrl: json["part 16:52:32.570  D  ner_booking_widget_url"],
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
    "part 16:52:32.570  D  ner_booking_widget_url": part165232570DNerBookingWidgetUrl,
  };
}

class RestaurantsdDetailRelationships {
  RestaurantsdDetailRelationships();

  factory RestaurantsdDetailRelationships.fromJson(String str) => RestaurantsdDetailRelationships.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantsdDetailRelationships.fromMap(Map<String, dynamic> json) => RestaurantsdDetailRelationships(
  );

  Map<String, dynamic> toMap() => {
  };
}

class Supplier {
  String? supplierAddress;
  String? latitude;
  String? longitude;
  String? serviceName;
  String? image;

  Supplier({
    this.supplierAddress,
    this.latitude,
    this.longitude,
    this.serviceName,
    this.image,
  });

  factory Supplier.fromJson(String str) => Supplier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Supplier.fromMap(Map<String, dynamic> json) =>
      Supplier(
        supplierAddress: json["supplier_address"],
        latitude: json["latitude"].toString(),
        longitude: json["longitude"].toString(),
        serviceName: json["service_name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() =>
      {
        "supplier_address": supplierAddress,
        "latitude": latitude,
        "longitude": longitude,
        "service_name": serviceName,
        "image": image,
      };
}

class BookingDetailService {
  String? bookingId;
  String? updatedAt;
  String? price;
  String? serviceId;
  String? noOfPerson;
  String? createdAt;
  String? description;
  String? id;
  String? time;
  String? title;
  String? supplierId;
  String? whatINeed;

  BookingDetailService({
    this.bookingId,
    this.updatedAt,
    this.price,
    this.serviceId,
    this.noOfPerson,
    this.createdAt,
    this.description,
    this.id,
    this.time,
    this.title,
    this.supplierId,
    this.whatINeed,
  });

  // Factory constructor to create a BookingDetailService object from a JSON map
  factory BookingDetailService.fromJson(Map<String, dynamic> json) {
    return BookingDetailService(
      bookingId: json['booking_id'].toString(),
      updatedAt: json['updated_at'].toString(),
      price: json['price'].toString(),
      serviceId: json['service_id'].toString(),
      noOfPerson: json['no_of_person'].toString(),
      createdAt: json['created_at'].toString(),
      description: json['description'].toString(),
      id: json['id'].toString(),
      time: json['time'].toString(),
      title: json['title'].toString(),
      supplierId: json['supplier_id'].toString(),
      whatINeed: json['what_i_need'].toString(),
    );
  }

  // Method to convert a BookingDetailService object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'updated_at': updatedAt,
      'price': price,
      'service_id': serviceId,
      'no_of_person': noOfPerson,
      'created_at': createdAt,
      'description': description,
      'id': id,
      'time': time,
      'title': title,
      'supplier_id': supplierId,
      'what_i_need': whatINeed,
    };
  }
}



class SupplierDetails {
  String? autoAccept;
  dynamic bio;
  String? contactAddress;
  int? contactCity;
  int? contactCountry;
  String? contactEmail;
  String? contactName;
  int? contactState;
  DateTime? createdAt;
  String? description;
  String? deviceId;
  String? deviceToken;
  int? deviceType;
  dynamic entityName;
  int? gender;
  int? id;
  String? image;
  int? isOtpVerified;
  String? latitude;
  String? licenceNumber;
  String? loginEmail;
  String? longitude;
  String? mobileCode;
  String? mobileNumber;
  String? needToBring;
  String? otp;
  String? ownerName;
  String? password;
  String? phoneNumber;
  String? postalCode;
  String? serviceName;
  int? status;
  String? supplierAddress;
  int? supplierCity;
  int? supplierCountry;
  String? supplierPostcode;
  int? supplierState;
  DateTime? updatedAt;
  dynamic website;

  SupplierDetails({
    this.autoAccept,
    this.bio,
    this.contactAddress,
    this.contactCity,
    this.contactCountry,
    this.contactEmail,
    this.contactName,
    this.contactState,
    this.createdAt,
    this.description,
    this.deviceId,
    this.deviceToken,
    this.deviceType,
    this.entityName,
    this.gender,
    this.id,
    this.image,
    this.isOtpVerified,
    this.latitude,
    this.licenceNumber,
    this.loginEmail,
    this.longitude,
    this.mobileCode,
    this.mobileNumber,
    this.needToBring,
    this.otp,
    this.ownerName,
    this.password,
    this.phoneNumber,
    this.postalCode,
    this.serviceName,
    this.status,
    this.supplierAddress,
    this.supplierCity,
    this.supplierCountry,
    this.supplierPostcode,
    this.supplierState,
    this.updatedAt,
    this.website,
  });

  factory SupplierDetails.fromJson(String str) => SupplierDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SupplierDetails.fromMap(Map<String, dynamic> json) => SupplierDetails(
    autoAccept: json["auto_accept"],
    bio: json["bio"],
    contactAddress: json["contact_address"],
    contactCity: json["contact_city"],
    contactCountry: json["contact_country"],
    contactEmail: json["contact_email"],
    contactName: json["contact_name"],
    contactState: json["contact_state"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    description: json["description"],
    deviceId: json["device_id"],
    deviceToken: json["device_token"],
    deviceType: json["device_type"],
    entityName: json["entity_name"],
    gender: json["gender"],
    id: json["id"],
    image: json["image"],
    isOtpVerified: json["is_otp_verified"],
    latitude: json["latitude"],
    licenceNumber: json["licence_number"],
    loginEmail: json["login_email"],
    longitude: json["longitude"],
    mobileCode: json["mobile_code"],
    mobileNumber: json["mobile_number"],
    needToBring: json["need_to_bring"],
    otp: json["otp"],
    ownerName: json["owner_name"],
    password: json["password"],
    phoneNumber: json["phone_number"],
    postalCode: json["postal_code"],
    serviceName: json["service_name"],
    status: json["status"],
    supplierAddress: json["supplier_address"],
    supplierCity: json["supplier_city"],
    supplierCountry: json["supplier_country"],
    supplierPostcode: json["supplier_postcode"],
    supplierState: json["supplier_state"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    website: json["website"],
  );

  Map<String, dynamic> toMap() => {
    "auto_accept": autoAccept,
    "bio": bio,
    "contact_address": contactAddress,
    "contact_city": contactCity,
    "contact_country": contactCountry,
    "contact_email": contactEmail,
    "contact_name": contactName,
    "contact_state": contactState,
    "created_at": createdAt?.toIso8601String(),
    "description": description,
    "device_id": deviceId,
    "device_token": deviceToken,
    "device_type": deviceType,
    "entity_name": entityName,
    "gender": gender,
    "id": id,
    "image": image,
    "is_otp_verified": isOtpVerified,
    "latitude": latitude,
    "licence_number": licenceNumber,
    "login_email": loginEmail,
    "longitude": longitude,
    "mobile_code": mobileCode,
    "mobile_number": mobileNumber,
    "need_to_bring": needToBring,
    "otp": otp,
    "owner_name": ownerName,
    "password": password,
    "phone_number": phoneNumber,
    "postal_code": postalCode,
    "service_name": serviceName,
    "status": status,
    "supplier_address": supplierAddress,
    "supplier_city": supplierCity,
    "supplier_country": supplierCountry,
    "supplier_postcode": supplierPostcode,
    "supplier_state": supplierState,
    "updated_at": updatedAt?.toIso8601String(),
    "website": website,
  };


}
