import 'package:json_annotation/json_annotation.dart';
part 'Verify_Reset_password.g.dart';

@JsonSerializable()
class Verify_reset_password {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  Verify_reset_password ({
    this.resetCode,
  });

  factory Verify_reset_password.fromJson(Map<String, dynamic> json) {
    return _$Verify_reset_passwordFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Verify_reset_passwordToJson(this);
  }
}


