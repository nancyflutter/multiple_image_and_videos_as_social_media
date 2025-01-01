import 'dart:convert';

class ForgotPasswordPayload {
  final String? emailOrMobile;
  final String? type;

  ForgotPasswordPayload({
    this.emailOrMobile,
    this.type,
  });

  ForgotPasswordPayload copyWith({
    String? emailOrMobile,
    String? type,
  }) =>
      ForgotPasswordPayload(
        emailOrMobile: emailOrMobile ?? this.emailOrMobile,
        type: type ?? this.type,
      );

  factory ForgotPasswordPayload.fromRawJson(String str) => ForgotPasswordPayload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordPayload.fromJson(Map<String, dynamic> json) => ForgotPasswordPayload(
        emailOrMobile: json["email_or_mobile"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "email_or_mobile": emailOrMobile,
        "type": type,
      };
}
