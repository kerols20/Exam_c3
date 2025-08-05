import 'package:project_one_c3_team/api/home/request/change_password_request.dart';
import 'package:project_one_c3_team/api/home/response/change_profile_password_response.dart';


abstract class ChangePasswordRepository {
  Future<ChangeProfilePasswordResponse> changePassword(String token, ChangePasswordRequest request);
}