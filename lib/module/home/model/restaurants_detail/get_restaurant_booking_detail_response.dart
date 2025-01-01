import 'dart:convert';

class RestaurantBookingResponse {
  int? id;
  String? bookNumber;
  String? bookingType;
  String? serviceId;
  String? categoryId;
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
  int? isPromoUsed;
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
  String? cancellationCharges;
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
  String? supplierDetails;
  String? statusString;
  List<History>? history;
  bool? isReturn;
  bool? requestPickupSend;
  bool? requestPickup;
  RestaurantsdDetail? restaurantsdDetail;
  ReservationDetail? reservationDetail;
  Supplier? supplier;
  DateTime? startTime;
  List<dynamic>? service;
  String? serviceName;

  RestaurantBookingResponse({
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
  });

  RestaurantBookingResponse copyWith({
    int? id,
    String? bookNumber,
    String? bookingType,
    String? serviceId,
    String? categoryId,
    int? userId,
    String? fullName,
    String? mobileNumber,
    String? emailId,
    String? numberOfPerson,
    String? chargePerPerson,
    int? cab,
    String? pickupAddress,
    String? pickupLat,
    String? pickupLng,
    int? returnCab,
    String? returnAddress,
    String? returnLat,
    String? returnLng,
    String? distance,
    String? distanceTime,
    String? pickupCharge,
    int? driverId,
    String? returnDriverId,
    String? returnDistance,
    String? returnTime,
    String? returnCharge,
    int? rideType,
    int? isPromoUsed,
    int? promoId,
    String? discount,
    String? discountAmount,
    String? taxPer,
    String? taxAmount,
    String? deliveryRate,
    String? deliveryCharge,
    String? otherCharges,
    String? subTotal,
    String? totalAmount,
    String? coinDiscount,
    String? usedCoin,
    String? cardNumber,
    String? cvv,
    String? expDate,
    DateTime? date,
    String? time,
    int? isCod,
    int? status,
    String? flag,
    String? cancelReason,
    String? cancellationCharges,
    int? isPopupOpen,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? earnedCoin,
    String? reservationId,
    String? restaurantId,
    String? eatStatus,
    DateTime? eatStartTime,
    DateTime? eatEndTime,
    int? allUnread,
    int? driverUnread,
    int? returnDriverUnread,
    int? supplierUnread,
    String? supplierDetails,
    String? statusString,
    List<History>? history,
    bool? isReturn,
    bool? requestPickupSend,
    bool? requestPickup,
    RestaurantsdDetail? restaurantsdDetail,
    ReservationDetail? reservationDetail,
    Supplier? supplier,
    DateTime? startTime,
    List<dynamic>? service,
    String? serviceName,
  }) =>
      RestaurantBookingResponse(
        id: id ?? this.id,
        bookNumber: bookNumber ?? this.bookNumber,
        bookingType: bookingType ?? this.bookingType,
        serviceId: serviceId ?? this.serviceId,
        categoryId: categoryId ?? this.categoryId,
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        emailId: emailId ?? this.emailId,
        numberOfPerson: numberOfPerson ?? this.numberOfPerson,
        chargePerPerson: chargePerPerson ?? this.chargePerPerson,
        cab: cab ?? this.cab,
        pickupAddress: pickupAddress ?? this.pickupAddress,
        pickupLat: pickupLat ?? this.pickupLat,
        pickupLng: pickupLng ?? this.pickupLng,
        returnCab: returnCab ?? this.returnCab,
        returnAddress: returnAddress ?? this.returnAddress,
        returnLat: returnLat ?? this.returnLat,
        returnLng: returnLng ?? this.returnLng,
        distance: distance ?? this.distance,
        distanceTime: distanceTime ?? this.distanceTime,
        pickupCharge: pickupCharge ?? this.pickupCharge,
        driverId: driverId ?? this.driverId,
        returnDriverId: returnDriverId ?? this.returnDriverId,
        returnDistance: returnDistance ?? this.returnDistance,
        returnTime: returnTime ?? this.returnTime,
        returnCharge: returnCharge ?? this.returnCharge,
        rideType: rideType ?? this.rideType,
        isPromoUsed: isPromoUsed ?? this.isPromoUsed,
        promoId: promoId ?? this.promoId,
        discount: discount ?? this.discount,
        discountAmount: discountAmount ?? this.discountAmount,
        taxPer: taxPer ?? this.taxPer,
        taxAmount: taxAmount ?? this.taxAmount,
        deliveryRate: deliveryRate ?? this.deliveryRate,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        otherCharges: otherCharges ?? this.otherCharges,
        subTotal: subTotal ?? this.subTotal,
        totalAmount: totalAmount ?? this.totalAmount,
        coinDiscount: coinDiscount ?? this.coinDiscount,
        usedCoin: usedCoin ?? this.usedCoin,
        cardNumber: cardNumber ?? this.cardNumber,
        cvv: cvv ?? this.cvv,
        expDate: expDate ?? this.expDate,
        date: date ?? this.date,
        time: time ?? this.time,
        isCod: isCod ?? this.isCod,
        status: status ?? this.status,
        flag: flag ?? this.flag,
        cancelReason: cancelReason ?? this.cancelReason,
        cancellationCharges: cancellationCharges ?? this.cancellationCharges,
        isPopupOpen: isPopupOpen ?? this.isPopupOpen,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        earnedCoin: earnedCoin ?? this.earnedCoin,
        reservationId: reservationId ?? this.reservationId,
        restaurantId: restaurantId ?? this.restaurantId,
        eatStatus: eatStatus ?? this.eatStatus,
        eatStartTime: eatStartTime ?? this.eatStartTime,
        eatEndTime: eatEndTime ?? this.eatEndTime,
        allUnread: allUnread ?? this.allUnread,
        driverUnread: driverUnread ?? this.driverUnread,
        returnDriverUnread: returnDriverUnread ?? this.returnDriverUnread,
        supplierUnread: supplierUnread ?? this.supplierUnread,
        supplierDetails: supplierDetails ?? this.supplierDetails,
        statusString: statusString ?? this.statusString,
        history: history ?? this.history,
        isReturn: isReturn ?? this.isReturn,
        requestPickupSend: requestPickupSend ?? this.requestPickupSend,
        requestPickup: requestPickup ?? this.requestPickup,
        restaurantsdDetail: restaurantsdDetail ?? this.restaurantsdDetail,
        reservationDetail: reservationDetail ?? this.reservationDetail,
        supplier: supplier ?? this.supplier,
        startTime: startTime ?? this.startTime,
        service: service ?? this.service,
        serviceName: serviceName ?? this.serviceName,
      );

  factory RestaurantBookingResponse.fromRawJson(String str) => RestaurantBookingResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RestaurantBookingResponse.fromJson(Map<String, dynamic> json) => RestaurantBookingResponse(
    id: json["id"],
    bookNumber: json["book_number"],
    bookingType: json["booking_type"],
    serviceId: json["service_id"],
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
    isPromoUsed: json["is_promo_used"],
    promoId: json["promo_id"],
    discount: json["discount"],
    discountAmount: json["discount_amount"],
    taxPer: json["tax_per"],
    taxAmount: json["tax_amount"],
    deliveryRate: json["delivery_rate"],
    deliveryCharge: json["delivery_charge"],
    otherCharges: json["other_charges"],
    subTotal: json["sub_total"],
    totalAmount: json["total_amount"],
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
    eatStartTime: json["eat_start_time"] == null ? null : DateTime.parse(json["eat_start_time"]),
    eatEndTime: json["eat_end_time"] == null ? null : DateTime.parse(json["eat_end_time"]),
    allUnread: json["all_unread"],
    driverUnread: json["driver_unread"],
    returnDriverUnread: json["return_driver_unread"],
    supplierUnread: json["supplier_unread"],
    supplierDetails: json["supplier_details"],
    statusString: json["status_string"],
    history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromMap(x))),
    isReturn: json["is_return"],
    requestPickupSend: json["request_pickup_send"],
    requestPickup: json["request_pickup"],
    restaurantsdDetail: json["restaurantsd_detail"] == null ? null : RestaurantsdDetail.fromMap(json["restaurantsd_detail"]),
    reservationDetail: json["reservation_detail"] == null ? null : ReservationDetail.fromMap(json["reservation_detail"]),
    supplier: json["supplier"] == null ? null : Supplier.fromMap(json["supplier"]),
    startTime: json["start_time"] == null ? null : DateTime.parse(json["start_time"]),
    service: json["service"] == null ? [] : List<dynamic>.from(json["service"]!.map((x) => x)),
    serviceName: json["service_name"],
  );

  Map<String, dynamic> toJson() => {
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
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
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
    "eat_start_time": "${eatStartTime!.year.toString().padLeft(4, '0')}-${eatStartTime!.month.toString().padLeft(2, '0')}-${eatStartTime!.day.toString().padLeft(2, '0')}",
    "eat_end_time": "${eatEndTime!.year.toString().padLeft(4, '0')}-${eatEndTime!.month.toString().padLeft(2, '0')}-${eatEndTime!.day.toString().padLeft(2, '0')}",
    "all_unread": allUnread,
    "driver_unread": driverUnread,
    "return_driver_unread": returnDriverUnread,
    "supplier_unread": supplierUnread,
    "supplier_details": supplierDetails,
    "status_string": statusString,
    "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toMap())),
    "is_return": isReturn,
    "request_pickup_send": requestPickupSend,
    "request_pickup": requestPickup,
    "restaurantsd_detail": restaurantsdDetail?.toMap(),
    "reservation_detail": reservationDetail?.toMap(),
    "supplier": supplier?.toMap(),
    "start_time": startTime?.toIso8601String(),
    "service": service == null ? [] : List<dynamic>.from(service!.map((x) => x)),
    "service_name": serviceName,
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

  History copyWith({
    int? status,
    String? statusString,
    int? flag,
  }) =>
      History(
        status: status ?? this.status,
        statusString: statusString ?? this.statusString,
        flag: flag ?? this.flag,
      );

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

  ReservationDetail copyWith({
    String? id,
    String? type,
    ReservationDetailAttributes? attributes,
    ReservationDetailRelationships? relationships,
  }) =>
      ReservationDetail(
        id: id ?? this.id,
        type: type ?? this.type,
        attributes: attributes ?? this.attributes,
        relationships: relationships ?? this.relationships,
      );

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

  ReservationDetailAttributes copyWith({
    String? key,
    String? restaurantId,
    int? covers,
    int? duration,
    String? status,
    dynamic notes,
    dynamic idempotencyToken,
    DateTime? startTime,
    DateTime? endTime,
    dynamic partnerReservationSid,
    String? guestId,
    dynamic partnerGuestSid,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ReservationDetailAttributes(
        key: key ?? this.key,
        restaurantId: restaurantId ?? this.restaurantId,
        covers: covers ?? this.covers,
        duration: duration ?? this.duration,
        status: status ?? this.status,
        notes: notes ?? this.notes,
        idempotencyToken: idempotencyToken ?? this.idempotencyToken,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        partnerReservationSid: partnerReservationSid ?? this.partnerReservationSid,
        guestId: guestId ?? this.guestId,
        partnerGuestSid: partnerGuestSid ?? this.partnerGuestSid,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

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

  ReservationDetailRelationships copyWith({
    Preference? preference,
  }) =>
      ReservationDetailRelationships(
        preference: preference ?? this.preference,
      );

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

  Preference copyWith({
    dynamic data,
  }) =>
      Preference(
        data: data ?? this.data,
      );

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
  RestaurantsDetailRelationships? relationships;

  RestaurantsdDetail({
    this.id,
    this.type,
    this.attributes,
    this.relationships,
  });

  RestaurantsdDetail copyWith({
    String? id,
    String? type,
    RestaurantsdDetailAttributes? attributes,
    RestaurantsDetailRelationships? relationships,
  }) =>
      RestaurantsdDetail(
        id: id ?? this.id,
        type: type ?? this.type,
        attributes: attributes ?? this.attributes,
        relationships: relationships ?? this.relationships,
      );

  factory RestaurantsdDetail.fromJson(String str) => RestaurantsdDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantsdDetail.fromMap(Map<String, dynamic> json) => RestaurantsdDetail(
    id: json["id"],
    type: json["type"],
    attributes: json["attributes"] == null ? null : RestaurantsdDetailAttributes.fromMap(json["attributes"]),
    relationships: json["relationships"] == null ? null : RestaurantsDetailRelationships.fromMap(json["relationships"]),
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
  String? addressLine2;
  String? city;
  String? province;
  String? postalCode;
  String? slug;
  dynamic customConfirmationComments;
  String? currency;
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
  String? par173221124DTnerBookingWidgetUrl;

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
    this.par173221124DTnerBookingWidgetUrl,
  });

  RestaurantsdDetailAttributes copyWith({
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
    dynamic termsAndConditions,
    int? minCovers,
    int? maxCovers,
    bool? availableOnline,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? province,
    String? postalCode,
    String? slug,
    dynamic customConfirmationComments,
    String? currency,
    String? regionId,
    String? cuisineId,
    String? neighborhoodId,
    double? latitude,
    double? longitude,
    String? imageUrl,
    List<String>? imageUrls,
    dynamic menuUrl,
    String? region,
    String? cuisine,
    String? neighborhood,
    String? ratingsImg,
    String? ratingsAverage,
    int? ratingsCount,
    String? externalRatingsUrl,
    String? website,
    String? par173221124DTnerBookingWidgetUrl,
  }) =>
      RestaurantsdDetailAttributes(
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
        par173221124DTnerBookingWidgetUrl: par173221124DTnerBookingWidgetUrl ?? this.par173221124DTnerBookingWidgetUrl,
      );

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
    par173221124DTnerBookingWidgetUrl: json["par\n17:32:21.124  D  tner_booking_widget_url"],
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
    "par\n17:32:21.124  D  tner_booking_widget_url": par173221124DTnerBookingWidgetUrl,
  };
}


class RestaurantsDetailRelationships {
  RestaurantsDetailRelationships();

factory RestaurantsDetailRelationships.fromJson(String str) => RestaurantsDetailRelationships.fromMap(json.decode(str));

String toJson() => json.encode(toMap());

factory RestaurantsDetailRelationships.fromMap(Map<String, dynamic> json) => RestaurantsDetailRelationships();

Map<String, dynamic> toMap() => {};
}


class Supplier {
String? supplierAddress;
double? latitude;
double? longitude;
String? serviceName;
String? image;

Supplier({
this.supplierAddress,
this.latitude,
this.longitude,
this.serviceName,
this.image,
});

Supplier copyWith({
String? supplierAddress,
double? latitude,
double? longitude,
String? serviceName,
String? image,
}) =>
Supplier(
supplierAddress: supplierAddress ?? this.supplierAddress,
latitude: latitude ?? this.latitude,
longitude: longitude ?? this.longitude,
serviceName: serviceName ?? this.serviceName,
image: image ?? this.image,
);

factory Supplier.fromJson(String str) => Supplier.fromMap(json.decode(str));

String toJson() => json.encode(toMap());

factory Supplier.fromMap(Map<String, dynamic> json) => Supplier(
supplierAddress: json["supplier_address"],
latitude: json["latitude"]?.toDouble(),
longitude: json["longitude"]?.toDouble(),
serviceName: json["service_name"],
image: json["image"],
);

Map<String, dynamic> toMap() => {
"supplier_address": supplierAddress,
"latitude": latitude,
"longitude": longitude,
"service_name": serviceName,
"image": image,
};
}
