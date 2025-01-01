import 'dart:convert';

class BookingStatusPayload {
  String? startTime;
  String? status;
  String? covers;

  BookingStatusPayload({
    this.startTime,
    this.status,
    this.covers,
  });

  factory BookingStatusPayload.fromJson(String str) => BookingStatusPayload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingStatusPayload.fromMap(Map<String, dynamic> json) => BookingStatusPayload(
    startTime: json["start_time"] == null ? null : (json["start_time"]),
    status: json["status"],
    covers: json["covers"],
  );

  Map<String, dynamic> toMap() => {
    "start_time": startTime,
    "status": status,
    "covers": covers,
  };
}





class ApiResponse {
  final int status;
  final int responseCode;
  final bool success;
  final String responseText;
  final BookingStatusResponse responseData;

  ApiResponse({
    required this.status,
    required this.responseCode,
    required this.success,
    required this.responseText,
    required this.responseData,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      responseCode: json['ResponseCode'],
      success: json['success'],
      responseText: json['ResponseText'],
      responseData: BookingStatusResponse.fromJson(json['ResponseData']),
    );
  }
}

class BookingStatusResponse {
  final Data? data;
  final List<List<ErrorDetail>>? errors;

  BookingStatusResponse({
    this.data,
    this.errors,
  });

  factory BookingStatusResponse.fromJson(Map<String, dynamic> json) {
    return BookingStatusResponse(
      data: json.containsKey('data') ? Data.fromJson(json['data']) : null,
      errors: json.containsKey('errors')
          ? (json['errors'] as List)
          .map((errorList) => (errorList as List)
          .map((e) => ErrorDetail.fromJson(e))
          .toList())
          .toList()
          : null,
    );
  }
}

class Data {
  final String id;
  final String type;
  final Attributes attributes;
  final Relationships relationships;

  Data({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      type: json['type'],
      attributes: Attributes.fromJson(json['attributes']),
      relationships: Relationships.fromJson(json['relationships']),
    );
  }
}

class Attributes {
  final String key;
  final String restaurantId;
  final int covers;
  final int duration;
  final String status;
  final String? notes;
  final String? idempotencyToken;
  final String startTime;
  final String endTime;
  final String? partnerReservationSid;
  final String guestId;
  final String? partnerGuestSid;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String createdAt;
  final String updatedAt;

  Attributes({
    required this.key,
    required this.restaurantId,
    required this.covers,
    required this.duration,
    required this.status,
    this.notes,
    this.idempotencyToken,
    required this.startTime,
    required this.endTime,
    this.partnerReservationSid,
    required this.guestId,
    this.partnerGuestSid,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      key: json['key'],
      restaurantId: json['restaurant_id'],
      covers: json['covers'],
      duration: json['duration'],
      status: json['status'],
      notes: json['notes'],
      idempotencyToken: json['idempotency_token'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      partnerReservationSid: json['partner_reservation_sid'],
      guestId: json['guest_id'],
      partnerGuestSid: json['partner_guest_sid'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Relationships {
  final Preference? preference;

  Relationships({this.preference});

  factory Relationships.fromJson(Map<String, dynamic> json) {
    return Relationships(
      preference: json['preference'] != null
          ? Preference.fromJson(json['preference'])
          : null,
    );
  }
}

class Preference {
  final dynamic data;

  Preference({this.data});

  factory Preference.fromJson(Map<String, dynamic> json) {
    return Preference(
      data: json['data'],
    );
  }
}

class ErrorDetail {
  final String key;
  final String code;
  final String detail;

  ErrorDetail({
    required this.key,
    required this.code,
    required this.detail,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      key: json['key'],
      code: json['code'],
      detail: json['detail'],
    );
  }
}
