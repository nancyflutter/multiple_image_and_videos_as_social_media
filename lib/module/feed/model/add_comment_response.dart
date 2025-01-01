import 'dart:convert';

/// AddCommentResponse? responseData

class AddCommentResponse {
  int? id;
  String? comment;

  AddCommentResponse({
    this.id,
    this.comment,
  });

  AddCommentResponse copyWith({
    int? id,
    String? comment,
  }) =>
      AddCommentResponse(
        id: id ?? this.id,
        comment: comment ?? this.comment,
      );

  factory AddCommentResponse.fromRowJson(String str) => AddCommentResponse.fromJson(json.decode(str));

  String toRowJson() => json.encode(toMap());

  factory AddCommentResponse.fromJson(Map<String, dynamic> json) => AddCommentResponse(
        id: json["id"],
        comment: json["comment"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "comment": comment,
      };
}
