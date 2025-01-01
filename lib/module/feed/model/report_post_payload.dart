import 'dart:convert';

class ReportPostPayLoad {
  String? postId;
  String? userId;
  String? report;
  String? type;

  ReportPostPayLoad({
    this.postId,
    this.userId,
    this.report,
    this.type,
  });

  ReportPostPayLoad copyWith({
    String? postId,
    String? userId,
    String? report,
    String? type,
  }) =>
      ReportPostPayLoad(
        postId: postId ?? this.postId,
        userId: userId ?? this.userId,
        report: report ?? this.report,
        type: type ?? this.type,
      );

  factory ReportPostPayLoad.fromJson(String str) => ReportPostPayLoad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportPostPayLoad.fromMap(Map<String, dynamic> json) => ReportPostPayLoad(
    postId: json["post_id"],
    userId: json["user_id"],
    report: json["report"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "post_id": postId,
    "user_id": userId,
    "report": report,
    "type": type,
  };
}
