import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

abstract class GetUserInfoRepository {
  Future<Result<UserInfoResponse>> getUserInfo(String token);
}