import 'package:project_one_c3_team/api/home/request/edit_profile_request.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';

abstract class EditProfileRepository {
  Future<UserInfoResponse> editProfile(String token, EditProfileRequest request);
}