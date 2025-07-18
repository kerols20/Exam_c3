
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';
@JsonSerializable()
class SignInRequest {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  SignInRequest ({
    this.email,
    this.password,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) {
    return _$SignInRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInRequestToJson(this);
  }
}


