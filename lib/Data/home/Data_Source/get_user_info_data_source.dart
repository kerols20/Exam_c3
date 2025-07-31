import 'package:project_one_c3_team/api/home/response/user_info_response.dart';

abstract class GetUserInfoDataSource {
  Future<UserInfoResponse> getUserInfo(String token);
}