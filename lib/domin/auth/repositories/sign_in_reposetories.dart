import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';

import '../../../api/auth/response/sign_in_response.dart';

abstract class SignInRepositories {
  Future<Sign_in_response> signIn(SignInRequest request);
}