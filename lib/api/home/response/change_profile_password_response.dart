// {
//     "message": "success",
//     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4N2JkZjk3NTU1NGIzMjg5MTJlNmNkNSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzU0NDIyNjY2fQ.Nheneja3eu7hZ_FvaNMuvB801Lp-OzbgzZWiNAdieug"
// }
import 'package:json_annotation/json_annotation.dart';

part 'change_profile_password_response.g.dart';

@JsonSerializable()
class ChangeProfilePasswordResponse {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "token")
  final String token;

  ChangeProfilePasswordResponse({
    required this.message,
    required this.token,
  });

  factory ChangeProfilePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeProfilePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeProfilePasswordResponseToJson(this);
}
