import 'package:json_annotation/json_annotation.dart';

part 'EmailVerificationRequest.g.dart';


@JsonSerializable()
class VerifyResetCodeRequest {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VerifyResetCodeRequest ({
    this.resetCode,
  });

  factory VerifyResetCodeRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestFromJson(json);
  }


  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeRequestToJson(this);
  }
}


