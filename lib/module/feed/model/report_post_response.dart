import 'dart:convert';

class ReportPostResponse {
  int? id;
  String? comment;

  ReportPostResponse({
    this.id,
    this.comment,
  });

  ReportPostResponse copyWith({
    int? id,
    String? comment,
  }) =>
      ReportPostResponse(
        id: id ?? this.id,
        comment: comment ?? this.comment,
      );

  factory ReportPostResponse.fromRowJson(String str) => ReportPostResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory ReportPostResponse.fromJson(Map<String, dynamic> json) => ReportPostResponse(
        id: json["id"],
        comment: json["comment"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "comment": comment,
      };
}
