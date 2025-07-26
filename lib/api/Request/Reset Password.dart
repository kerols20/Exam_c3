import 'package:json_annotation/json_annotation.dart';

part 'Reset Password.g.dart';

@JsonSerializable()
class Reset_Password {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "newPassword")
  final String? newPassword;

  Reset_Password ({
    this.email,
    this.newPassword,
  });

  factory Reset_Password.fromJson(Map<String, dynamic> json) {
    return _$Reset_PasswordFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Reset_PasswordToJson(this);
  }
}


