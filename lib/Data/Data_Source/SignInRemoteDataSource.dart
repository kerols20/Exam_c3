import 'package:project_one_c3_team/api/Request/sign_in_request.dart';

abstract class SignInRemoteDataSource {
  Future<void> signIn(SignInRequest request);
}