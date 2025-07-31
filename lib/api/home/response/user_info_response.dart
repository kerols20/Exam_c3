import 'package:json_annotation/json_annotation.dart';

part '../../auth/response/user_info_response.g.dart';

@JsonSerializable()
class UserInfoResponse {
  final String message;
  final User user;

  UserInfoResponse({
    required this.message,
    required this.user,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;
  final String createdAt;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}