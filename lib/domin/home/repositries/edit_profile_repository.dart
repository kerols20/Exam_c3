import 'package:project_one_c3_team/api/home/request/edit_profile_request.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

abstract class EditProfileRepository {
  Future<Result<UserInfoResponse>> editProfile(String token, EditProfileRequest request);
}