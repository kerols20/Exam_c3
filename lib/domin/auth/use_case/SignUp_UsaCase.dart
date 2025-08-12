import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import '../../../api/auth/request/SignUpRequest.dart';
import '../repositories/SignUp_reposetries.dart';
// unit testing
@injectable
class SignUp_UsaCase{
  final SignUp_Rpo _signUp_Rpo;
  SignUp_UsaCase(this._signUp_Rpo);
  Future<Result<void>> signUp(SignUpRequest request){
    return _signUp_Rpo.signUp(request);
  }
}