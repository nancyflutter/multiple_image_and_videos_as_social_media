import 'dart:convert';

class CreateReservationPayload {
  String? date;
  String? deliveryCharge;
  String? deliveryRate;
  String? distance;
  String? distanceTime;
  String? emailId;
  String? firstName;
  String? isCab;
  String? isCod;
  String? isReturn;
  String? lastName;
  String? mobileNumber;
  String? numberOfPerson;
  String? payId;
  String? pickupCharge;
  String? restaurantId;
  String? returnCharge;
  String? returnDistance;
  String? returnTime;
  String? startTime;
  String? time;
  String? userId;

  CreateReservationPayload({
    this.date,
    this.deliveryCharge,
    this.deliveryRate,
    this.distance,
    this.distanceTime,
    this.emailId,
    this.firstName,
    this.isCab,
    this.isCod,
    this.isReturn,
    this.lastName,
    this.mobileNumber,
    this.numberOfPerson,
    this.payId,
    this.pickupCharge,
    this.restaurantId,
    this.returnCharge,
    this.returnDistance,
    this.returnTime,
    this.startTime,
    this.time,
    this.userId,
  });

  CreateReservationPayload copyWith({
    String? date,
    String? deliveryCharge,
    String? deliveryRate,
    String? distance,
    String? distanceTime,
    String? emailId,
    String? firstName,
    String? isCab,
    String? isCod,
    String? isReturn,
    String? lastName,
    String? mobileNumber,
    String? numberOfPerson,
    String? payId,
    String? pickupCharge,
    String? restaurantId,
    String? returnCharge,
    String? returnDistance,
    String? returnTime,
    String? startTime,
    String? time,
    String? userId,
  }) =>
      CreateReservationPayload(
        date: date ?? this.date,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        deliveryRate: deliveryRate ?? this.deliveryRate,
        distance: distance ?? this.distance,
        distanceTime: distanceTime ?? this.distanceTime,
        emailId: emailId ?? this.emailId,
        firstName: firstName ?? this.firstName,
        isCab: isCab ?? this.isCab,
        isCod: isCod ?? this.isCod,
        isReturn: isReturn ?? this.isReturn,
        lastName: lastName ?? this.lastName,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        numberOfPerson: numberOfPerson ?? this.numberOfPerson,
        payId: payId ?? this.payId,
        pickupCharge: pickupCharge ?? this.pickupCharge,
        restaurantId: restaurantId ?? this.restaurantId,
        returnCharge: returnCharge ?? this.returnCharge,
        returnDistance: returnDistance ?? this.returnDistance,
        returnTime: returnTime ?? this.returnTime,
        startTime: startTime ?? this.startTime,
        time: time ?? this.time,
        userId: userId ?? this.userId,
      );

  factory CreateReservationPayload.fromJson(String str) => CreateReservationPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateReservationPayload.fromMap(Map<String, dynamic> json) => CreateReservationPayload(
    date: json["date"],
    deliveryCharge: json["delivery_charge"],
    deliveryRate: json["delivery_rate"],
    distance: json["distance"],
    distanceTime: json["distance_time"],
    emailId: json["email_id"],
    firstName: json["first_name"],
    isCab: json["is_cab"],
    isCod: json["is_cod"],
    isReturn: json["is_return"],
    lastName: json["last_name"],
    mobileNumber: json["mobile_number"],
    numberOfPerson: json["number_of_person"],
    payId: json["pay_id"],
    pickupCharge: json["pickup_charge"],
    restaurantId: json["restaurant_id"],
    returnCharge: json["return_charge"],
    returnDistance: json["return_distance"],
    returnTime: json["return_time"],
    startTime: json["start_time"],
    time: json["time"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toMap() => {
    "date": date,
    "delivery_charge": deliveryCharge,
    "delivery_rate": deliveryRate,
    "distance": distance,
    "distance_time": distanceTime,
    "email_id": emailId,
    "first_name": firstName,
    "is_cab": isCab,
    "is_cod": isCod,
    "is_return": isReturn,
    "last_name": lastName,
    "mobile_number": mobileNumber,
    "number_of_person": numberOfPerson,
    "pay_id": payId,
    "pickup_charge": pickupCharge,
    "restaurant_id": restaurantId,
    "return_charge": returnCharge,
    "return_distance": returnDistance,
    "return_time": returnTime,
    "start_time": startTime,
    "time": time,
    "user_id": userId,
  };
}
