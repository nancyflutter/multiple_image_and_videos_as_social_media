import 'dart:convert';

class BookingHistoryResponseData {
  int? currentPage;
  List<BookingHistoryData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  BookingHistoryResponseData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  BookingHistoryResponseData copyWith({
    int? currentPage,
    List<BookingHistoryData>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) =>
      BookingHistoryResponseData(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory BookingHistoryResponseData.fromRowJson(String str) => BookingHistoryResponseData.fromJson(json.decode(str));

  String fromRowJson() => json.encode(toMap());

  factory BookingHistoryResponseData.fromJson(Map<String, dynamic> json) => BookingHistoryResponseData(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<BookingHistoryData>.from(json["data"]!.map((x) => BookingHistoryData.fromMap(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toMap() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class BookingHistoryData {
  int? id;
  String? reservationId;
  String? restaurantId;
  String? eatStatus;
  String? bookNumber;
  DateTime? date;
  String? time;
  dynamic totalAmount;
  String? serviceName;
  String? supplierAddress;
  int? status;
  String? bookingType;
  String? image;
  String? statusString;
  int? msgCount;
  dynamic coin;
  String? menuUrl;
  String? establishmentType;
  String? phone;
  String? email;
  String? city;
  String? province;

  BookingHistoryData({
    this.id,
    this.reservationId,
    this.restaurantId,
    this.eatStatus,
    this.bookNumber,
    this.date,
    this.time,
    this.totalAmount,
    this.serviceName,
    this.supplierAddress,
    this.status,
    this.bookingType,
    this.image,
    this.statusString,
    this.msgCount,
    this.coin,
    this.menuUrl,
    this.establishmentType,
    this.phone,
    this.email,
    this.city,
    this.province,
  });

  BookingHistoryData copyWith({
    int? id,
    String? reservationId,
    String? restaurantId,
    String? eatStatus,
    String? bookNumber,
    DateTime? date,
    String? time,
    dynamic totalAmount,
    String? serviceName,
    String? supplierAddress,
    int? status,
    String? bookingType,
    String? image,
    String? statusString,
    int? msgCount,
    dynamic coin,
    String? menuUrl,
    String? establishmentType,
    String? phone,
    String? email,
    String? city,
    String? province,
  }) =>
      BookingHistoryData(
        id: id ?? this.id,
        reservationId: reservationId ?? this.reservationId,
        restaurantId: restaurantId ?? this.restaurantId,
        eatStatus: eatStatus ?? this.eatStatus,
        bookNumber: bookNumber ?? this.bookNumber,
        date: date ?? this.date,
        time: time ?? this.time,
        totalAmount: totalAmount ?? this.totalAmount,
        serviceName: serviceName ?? this.serviceName,
        supplierAddress: supplierAddress ?? this.supplierAddress,
        status: status ?? this.status,
        bookingType: bookingType ?? this.bookingType,
        image: image ?? this.image,
        statusString: statusString ?? this.statusString,
        msgCount: msgCount ?? this.msgCount,
        coin: coin ?? this.coin,
        menuUrl: menuUrl ?? this.menuUrl,
        establishmentType: establishmentType ?? this.establishmentType,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        city: city ?? this.city,
        province: province ?? this.province,
      );

  factory BookingHistoryData.fromJson(String str) => BookingHistoryData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingHistoryData.fromMap(Map<String, dynamic> json) => BookingHistoryData(
    id: json["id"],
    reservationId: json["reservation_id"],
    restaurantId: json["restaurant_id"],
    eatStatus: json["eat_status"],
    bookNumber: json["book_number"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    totalAmount: json["total_amount"],
    serviceName: json["service_name"],
    supplierAddress: json["supplier_address"],
    status: json["status"],
    bookingType: json["booking_type"],
    image: json["image"],
    statusString: json["status_string"],
    msgCount: json["msg_count"],
    coin: json["coin"],
    menuUrl: json["menu_url"],
    establishmentType: json["establishment_type"],
    phone: json["phone"],
    email: json["email"],
    city: json["city"],
    province: json["province"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "reservation_id": reservationId,
    "restaurant_id": restaurantId,
    "eat_status": eatStatus,
    "book_number": bookNumber,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "total_amount": totalAmount,
    "service_name": serviceName,
    "supplier_address": supplierAddress,
    "status": status,
    "booking_type": bookingType,
    "image": image,
    "status_string": statusString,
    "msg_count": msgCount,
    "coin": coin,
    "menu_url": menuUrl,
    "establishment_type": establishmentType,
    "phone": phone,
    "email": email,
    "city": city,
    "province": province,
  };
}