import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/response/sign_in_response.dart';

abstract class SignInRemoteDataSource {
  Future<Result<Sign_in_response>> signIn(SignInRequest request);
}