import 'dart:convert';

class CheckAvailabilityStatus {
  int? noticeDuration;
  dynamic terms;
  int? minCovers;
  int? maxCovers;
  DateTime? firstSeating;
  DateTime? lastSeating;
  List<Available>? available;

  CheckAvailabilityStatus({
    this.noticeDuration,
    this.terms,
    this.minCovers,
    this.maxCovers,
    this.firstSeating,
    this.lastSeating,
    this.available,
  });

  CheckAvailabilityStatus copyWith({
    int? noticeDuration,
    dynamic terms,
    int? minCovers,
    int? maxCovers,
    DateTime? firstSeating,
    DateTime? lastSeating,
    List<Available>? available,
  }) =>
      CheckAvailabilityStatus(
        noticeDuration: noticeDuration ?? this.noticeDuration,
        terms: terms ?? this.terms,
        minCovers: minCovers ?? this.minCovers,
        maxCovers: maxCovers ?? this.maxCovers,
        firstSeating: firstSeating ?? this.firstSeating,
        lastSeating: lastSeating ?? this.lastSeating,
        available: available ?? this.available,
      );

  factory CheckAvailabilityStatus.fromRawJson(String str) => CheckAvailabilityStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckAvailabilityStatus.fromJson(Map<String, dynamic> json) => CheckAvailabilityStatus(
    noticeDuration: json["notice_duration"],
    terms: json["terms"],
    minCovers: json["min_covers"],
    maxCovers: json["max_covers"],
    firstSeating: json["first_seating"] == null ? null : DateTime.parse(json["first_seating"]),
    lastSeating: json["last_seating"] == null ? null : DateTime.parse(json["last_seating"]),
    available: json["available"] == null ? [] : List<Available>.from(json["available"]!.map((x) => Available.fromMap(x))),
  );

  Map<String, dynamic> toJson() => {
    "notice_duration": noticeDuration,
    "terms": terms,
    "min_covers": minCovers,
    "max_covers": maxCovers,
    "first_seating": firstSeating?.toIso8601String(),
    "last_seating": lastSeating?.toIso8601String(),
    "available": available == null ? [] : List<dynamic>.from(available!.map((x) => x.toMap())),
  };
}

class Available {
  DateTime? value;
  bool? disable;

  Available({
    this.value,
    this.disable,
  });

  Available copyWith({
    DateTime? value,
    bool? disable,
  }) =>
      Available(
        value: value ?? this.value,
        disable: disable ?? this.disable,
      );

  factory Available.fromJson(String str) => Available.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Available.fromMap(Map<String, dynamic> json) => Available(
    value: json["value"] == null ? null : DateTime.parse(json["value"]),
    disable: json["disable"],
  );

  Map<String, dynamic> toMap() => {
    "value": value?.toIso8601String(),
    "disable": disable,
  };
}
