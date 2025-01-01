import 'dart:convert';

// List<BadgeResponse>? responseData;

class BadgeResponse {
  int? id;
  String? name;
  int? categoryId;
  int? subcategoryId;
  String? beforeDescription;
  String? afterDescription;
  String? categoryName;
  String? subcategoryName;
  String? beforeImage;
  String? afterImage;
  String? takenDate;
  int? isTaken;

  BadgeResponse({
    this.id,
    this.name,
    this.categoryId,
    this.subcategoryId,
    this.beforeDescription,
    this.afterDescription,
    this.categoryName,
    this.subcategoryName,
    this.beforeImage,
    this.afterImage,
    this.takenDate,
    this.isTaken,
  });

  BadgeResponse copyWith({
    int? id,
    String? name,
    int? categoryId,
    int? subcategoryId,
    String? beforeDescription,
    String? afterDescription,
    String? categoryName,
    String? subcategoryName,
    String? beforeImage,
    String? afterImage,
    String? takenDate,
    int? isTaken,
  }) =>
      BadgeResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        subcategoryId: subcategoryId ?? this.subcategoryId,
        beforeDescription: beforeDescription ?? this.beforeDescription,
        afterDescription: afterDescription ?? this.afterDescription,
        categoryName: categoryName ?? this.categoryName,
        subcategoryName: subcategoryName ?? this.subcategoryName,
        beforeImage: beforeImage ?? this.beforeImage,
        afterImage: afterImage ?? this.afterImage,
        takenDate: takenDate ?? this.takenDate,
        isTaken: isTaken ?? this.isTaken,
      );

  factory BadgeResponse.fromRowJson(String str) => BadgeResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory BadgeResponse.fromJson(Map<String, dynamic> json) => BadgeResponse(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        beforeDescription: json["before_description"],
        afterDescription: json["after_description"],
        categoryName: json["category_name"],
        subcategoryName: json["subcategory_name"],
        beforeImage: json["before_image"],
        afterImage: json["after_image"],
        takenDate: json["taken_Date"],
        isTaken: json["is_taken"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "before_description": beforeDescription,
        "after_description": afterDescription,
        "category_name": categoryName,
        "subcategory_name": subcategoryName,
        "before_image": beforeImage,
        "after_image": afterImage,
        "taken_Date": takenDate,
        "is_taken": isTaken,
      };
}
