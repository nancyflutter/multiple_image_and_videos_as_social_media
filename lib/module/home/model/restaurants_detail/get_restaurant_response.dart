import 'dart:convert';

class GetRestaurantsResponse {
  List<RestaurantDetails>? data;
  Meta? meta;
  Links? links;
  Op? op;

  GetRestaurantsResponse({
    this.data,
    this.meta,
    this.links,
    this.op,
  });

  GetRestaurantsResponse copyWith({
    List<RestaurantDetails>? data,
    Meta? meta,
    Links? links,
    Op? op,
  }) =>
      GetRestaurantsResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        links: links ?? this.links,
        op: op ?? this.op,
      );

  factory GetRestaurantsResponse.fromRawJson(String str) => GetRestaurantsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetRestaurantsResponse.fromJson(Map<String, dynamic> json) => GetRestaurantsResponse(
    data: json["data"] == null ? [] : List<RestaurantDetails>.from(json["data"]!.map((x) => RestaurantDetails.fromMap(x))),
    meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
    links: json["links"] == null ? null : Links.fromMap(json["links"]),
    op: json["op"] == null ? null : Op.fromMap(json["op"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "meta": meta?.toMap(),
    "links": links?.toMap(),
    "op": op?.toMap(),
  };
}

class RestaurantDetails {
  String? id;
  String? type;
  Attributes? attributes;

  RestaurantDetails({
    this.id,
    this.type,
    this.attributes,
  });

  RestaurantDetails copyWith({
    String? id,
    String? type,
    Attributes? attributes,
  }) =>
      RestaurantDetails(
        id: id ?? this.id,
        type: type ?? this.type,
        attributes: attributes ?? this.attributes,
      );

  factory RestaurantDetails.fromJson(String str) => RestaurantDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantDetails.fromMap(Map<String, dynamic> json) => RestaurantDetails(
    id: json["id"],
    type: json["type"],
    attributes: json["attributes"] == null ? null : Attributes.fromMap(json["attributes"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "attributes": attributes?.toMap(),
  };
}

class Attributes {
  String? name;
  String? contactEmail;
  String? addressLine1;
  String? ratingsAverage;
  String? imageUrl;
  List<String>? labels;

  Attributes({
    this.name,
    this.contactEmail,
    this.addressLine1,
    this.ratingsAverage,
    this.imageUrl,
    this.labels,
  });

  Attributes copyWith({
    String? name,
    String? contactEmail,
    String? addressLine1,
    String? ratingsAverage,
    String? imageUrl,
    List<String>? labels,
  }) =>
      Attributes(
        name: name ?? this.name,
        contactEmail: contactEmail ?? this.contactEmail,
        addressLine1: addressLine1 ?? this.addressLine1,
        ratingsAverage: ratingsAverage ?? this.ratingsAverage,
        imageUrl: imageUrl ?? this.imageUrl,
        labels: labels ?? this.labels,
      );

  factory Attributes.fromJson(String str) => Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
    name: json["name"],
    contactEmail: json["contact_email"],
    addressLine1: json["address_line_1"],
    ratingsAverage: json["ratings_average"],
    imageUrl: json["image_url"],
    labels: json["labels"] == null ? [] : List<String>.from(json["labels"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "contact_email": contactEmail,
    "address_line_1": addressLine1,
    "ratings_average": ratingsAverage,
    "image_url": imageUrl,
    "labels": labels == null ? [] : List<dynamic>.from(labels!.map((x) => x)),
  };
}

class Links {
  String? first;
  dynamic next;
  dynamic prev;
  String? last;

  Links({
    this.first,
    this.next,
    this.prev,
    this.last,
  });

  Links copyWith({
    String? first,
    dynamic next,
    dynamic prev,
    String? last,
  }) =>
      Links(
        first: first ?? this.first,
        next: next ?? this.next,
        prev: prev ?? this.prev,
        last: last ?? this.last,
      );

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    first: json["first"],
    next: json["next"],
    prev: json["prev"],
    last: json["last"],
  );

  Map<String, dynamic> toMap() => {
    "first": first,
    "next": next,
    "prev": prev,
    "last": last,
  };
}

class Meta {
  int? limit;
  int? totalPages;
  int? totalCount;
  int? currentPage;

  Meta({
    this.limit,
    this.totalPages,
    this.totalCount,
    this.currentPage,
  });

  Meta copyWith({
    int? limit,
    int? totalPages,
    int? totalCount,
    int? currentPage,
  }) =>
      Meta(
        limit: limit ?? this.limit,
        totalPages: totalPages ?? this.totalPages,
        totalCount: totalCount ?? this.totalCount,
        currentPage: currentPage ?? this.currentPage,
      );

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    limit: json["limit"],
    totalPages: json["total_pages"],
    totalCount: json["total_count"],
    currentPage: json["current_page"],
  );

  Map<String, dynamic> toMap() => {
    "limit": limit,
    "total_pages": totalPages,
    "total_count": totalCount,
    "current_page": currentPage,
  };
}

class Op {
  String? method;
  String? url;
  Headers? headers;

  Op({
    this.method,
    this.url,
    this.headers,
  });

  Op copyWith({
    String? method,
    String? url,
    Headers? headers,
  }) =>
      Op(
        method: method ?? this.method,
        url: url ?? this.url,
        headers: headers ?? this.headers,
      );

  factory Op.fromJson(String str) => Op.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Op.fromMap(Map<String, dynamic> json) => Op(
    method: json["method"],
    url: json["url"],
    headers: json["headers"] == null ? null : Headers.fromMap(json["headers"]),
  );

  Map<String, dynamic> toMap() => {
    "method": method,
    "url": url,
    "headers": headers?.toMap(),
  };
}

class Headers {
  String? postmanToken;
  String? cacheControl;
  String? authorization;

  Headers({
    this.postmanToken,
    this.cacheControl,
    this.authorization,
  });

  Headers copyWith({
    String? postmanToken,
    String? cacheControl,
    String? authorization,
  }) =>
      Headers(
        postmanToken: postmanToken ?? this.postmanToken,
        cacheControl: cacheControl ?? this.cacheControl,
        authorization: authorization ?? this.authorization,
      );

  factory Headers.fromJson(String str) => Headers.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Headers.fromMap(Map<String, dynamic> json) => Headers(
    postmanToken: json["postman-token"],
    cacheControl: json["cache-control"],
    authorization: json["authorization"],
  );

  Map<String, dynamic> toMap() => {
    "postman-token": postmanToken,
    "cache-control": cacheControl,
    "authorization": authorization,
  };
}
