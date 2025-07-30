import 'package:json_annotation/json_annotation.dart';
part "Forgot_Password_Request.g.dart";
@JsonSerializable()
class ForgotPasswordRequest {
  @JsonKey(name: "email")
  final String? email;

  ForgotPasswordRequest ({
    this.email,
  });

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) {
    return _$ForgotPasswordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgotPasswordRequestToJson(this);
  }
}


