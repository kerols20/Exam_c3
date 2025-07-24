import 'package:json_annotation/json_annotation.dart';
part 'ResetPasswordRequest.g.dart';


@JsonSerializable()
class ResetPasswordRequest {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "newPassword")
  final String? newPassword;
  @JsonKey(name: "resetCode")
  final String? resetCode;
  ResetPasswordRequest({this.email, this.newPassword,this.resetCode});

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordRequestFromJson(json);
  }

  Map<  String, dynamic> toJson() {
    return _$ResetPasswordRequestToJson(this);
  }
}
