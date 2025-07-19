import 'package:project_one_c3_team/api/Request/sign_in_request.dart';

import '../../api/response/sign_in_response.dart';

abstract class SignInRemoteDataSource {
  Future<Sign_in_response> signIn(SignInRequest request);
}