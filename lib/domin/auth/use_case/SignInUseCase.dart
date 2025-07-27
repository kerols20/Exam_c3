import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';
import 'package:project_one_c3_team/domin/auth/repositories/sign_in_reposetories.dart';

import '../../../api/auth/response/sign_in_response.dart';
@injectable
class SignInUseCase {
  final SignInRepositories _signInRepositories;
  SignInUseCase(this._signInRepositories);
  Future<Sign_in_response> signIn(SignInRequest request)  {
    return _signInRepositories.signIn(request);
  }
}