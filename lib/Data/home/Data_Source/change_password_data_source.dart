import 'package:project_one_c3_team/api/home/request/change_password_request.dart';
import 'package:project_one_c3_team/api/home/response/change_profile_password_response.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';


abstract class ChangePasswordDataSource {
  Future<Result<ChangeProfilePasswordResponse>> changePassword(String token, ChangePasswordRequest request);
}