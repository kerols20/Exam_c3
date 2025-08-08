import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import '../../../api/auth/request/SignUpRequest.dart';
import '../../../domin/auth/repositories/SignUp_reposetries.dart';
import '../data_source/SignUp_Data_Source.dart';
/// unit testing
@Injectable(as:SignUp_Rpo)
class SignUp_Rpo_Imp implements SignUp_Rpo{
  SignUpDataSource _signUpDataSource;
  SignUp_Rpo_Imp(this._signUpDataSource);
  @override
  Future<Result<void>> signUp(SignUpRequest request) {
    return _signUpDataSource.signUp(request);
  }
}