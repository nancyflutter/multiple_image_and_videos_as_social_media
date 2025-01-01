import 'dart:convert';

class CreateReservationResponse {
  int? id;
  String? bookingType;
  String? reservationId;
  String? bookNumber;
  String? restaurantId;
  String? eatStatus;
  DateTime? eatStartTime;
  DateTime? eatEndTime;
  String? fullName;
  String? mobileNumber;
  String? emailId;
  String? userId;
  int? numberOfPerson;
  String? cab;
  String? pickupAddress;
  String? pickupLat;
  String? pickupLng;
  String? returnCab;
  String? returnAddress;
  String? returnLat;
  String? returnLng;
  String? distance;
  String? distanceTime;
  String? pickupCharge;
  String? returnDistance;
  String? returnTime;
  String? returnCharge;
  String? deliveryRate;
  String? deliveryCharge;
  dynamic otherCharges;
  dynamic totalAmount;
  String? cardNumber;
  String? cvv;
  String? expDate;
  DateTime? date;
  String? time;
  String? isCod;
  int? status;
  DateTime? updatedAt;
  DateTime? createdAt;

  CreateReservationResponse({
    this.id,
    this.bookingType,
    this.reservationId,
    this.bookNumber,
    this.restaurantId,
    this.eatStatus,
    this.eatStartTime,
    this.eatEndTime,
    this.fullName,
    this.mobileNumber,
    this.emailId,
    this.userId,
    this.numberOfPerson,
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
    this.returnDistance,
    this.returnTime,
    this.returnCharge,
    this.deliveryRate,
    this.deliveryCharge,
    this.otherCharges,
    this.totalAmount,
    this.cardNumber,
    this.cvv,
    this.expDate,
    this.date,
    this.time,
    this.isCod,
    this.status,
    this.updatedAt,
    this.createdAt,
  });

  CreateReservationResponse copyWith({
    int? id,
    String? bookingType,
    String? reservationId,
    String? bookNumber,
    String? restaurantId,
    String? eatStatus,
    DateTime? eatStartTime,
    DateTime? eatEndTime,
    String? fullName,
    String? mobileNumber,
    String? emailId,
    String? userId,
    int? numberOfPerson,
    String? cab,
    String? pickupAddress,
    String? pickupLat,
    String? pickupLng,
    String? returnCab,
    String? returnAddress,
    String? returnLat,
    String? returnLng,
    String? distance,
    String? distanceTime,
    String? pickupCharge,
    String? returnDistance,
    String? returnTime,
    String? returnCharge,
    String? deliveryRate,
    String? deliveryCharge,
    dynamic otherCharges,
    dynamic totalAmount,
    String? cardNumber,
    String? cvv,
    String? expDate,
    DateTime? date,
    String? time,
    String? isCod,
    int? status,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) =>
      CreateReservationResponse(
        id: id ?? this.id,
        bookingType: bookingType ?? this.bookingType,
        reservationId: reservationId ?? this.reservationId,
        bookNumber: bookNumber ?? this.bookNumber,
        restaurantId: restaurantId ?? this.restaurantId,
        eatStatus: eatStatus ?? this.eatStatus,
        eatStartTime: eatStartTime ?? this.eatStartTime,
        eatEndTime: eatEndTime ?? this.eatEndTime,
        fullName: fullName ?? this.fullName,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        emailId: emailId ?? this.emailId,
        userId: userId ?? this.userId,
        numberOfPerson: numberOfPerson ?? this.numberOfPerson,
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
        returnDistance: returnDistance ?? this.returnDistance,
        returnTime: returnTime ?? this.returnTime,
        returnCharge: returnCharge ?? this.returnCharge,
        deliveryRate: deliveryRate ?? this.deliveryRate,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        otherCharges: otherCharges ?? this.otherCharges,
        totalAmount: totalAmount ?? this.totalAmount,
        cardNumber: cardNumber ?? this.cardNumber,
        cvv: cvv ?? this.cvv,
        expDate: expDate ?? this.expDate,
        date: date ?? this.date,
        time: time ?? this.time,
        isCod: isCod ?? this.isCod,
        status: status ?? this.status,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
      );

  factory CreateReservationResponse.fromRawJson(String str) => CreateReservationResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateReservationResponse.fromJson(Map<String, dynamic> json) => CreateReservationResponse(
    id: json["id"],
    bookingType: json["booking_type"],
    reservationId: json["reservation_id"],
    bookNumber: json["book_number"],
    restaurantId: json["restaurant_id"],
    eatStatus: json["eat_status"],
    eatStartTime: json["eat_start_time"] == null ? null : DateTime.parse(json["eat_start_time"]),
    eatEndTime: json["eat_end_time"] == null ? null : DateTime.parse(json["eat_end_time"]),
    fullName: json["full_name"],
    mobileNumber: json["mobile_number"],
    emailId: json["email_id"],
    userId: json["user_id"],
    numberOfPerson: json["number_of_person"],
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
    returnDistance: json["return_distance"],
    returnTime: json["return_time"],
    returnCharge: json["return_charge"],
    deliveryRate: json["delivery_rate"],
    deliveryCharge: json["delivery_charge"],
    otherCharges: json["other_charges"],
    totalAmount: json["total_amount"],
    cardNumber: json["card_number"],
    cvv: json["cvv"],
    expDate: json["exp_date"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    isCod: json["is_cod"],
    status: json["status"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_type": bookingType,
    "reservation_id": reservationId,
    "book_number": bookNumber,
    "restaurant_id": restaurantId,
    "eat_status": eatStatus,
    "eat_start_time": eatStartTime?.toIso8601String(),
    "eat_end_time": eatEndTime?.toIso8601String(),
    "full_name": fullName,
    "mobile_number": mobileNumber,
    "email_id": emailId,
    "user_id": userId,
    "number_of_person": numberOfPerson,
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
    "return_distance": returnDistance,
    "return_time": returnTime,
    "return_charge": returnCharge,
    "delivery_rate": deliveryRate,
    "delivery_charge": deliveryCharge,
    "other_charges": otherCharges,
    "total_amount": totalAmount,
    "card_number": cardNumber,
    "cvv": cvv,
    "exp_date": expDate,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "is_cod": isCod,
    "status": status,
    "updatedAt": updatedAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
  };
}
