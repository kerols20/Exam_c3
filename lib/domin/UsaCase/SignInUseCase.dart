import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/Request/sign_in_request.dart';
import 'package:project_one_c3_team/domin/repositries/sign_in_reposetories.dart';
@injectable
class SignInUseCase {
  final SignInRepositories _signInRepositories;
  SignInUseCase(this._signInRepositories);
  Future<void> signIn(SignInRequest request)  {
    return _signInRepositories.signIn(request);
  }
}