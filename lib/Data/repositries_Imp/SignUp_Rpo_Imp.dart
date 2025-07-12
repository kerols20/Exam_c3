import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/Request/Request.dart';

import '../../domin/repositries/SignUp_reposetries.dart';
import '../Data_Source/SignUp_Data_Source.dart';
@Injectable(as:SignUp_Rpo)
class SignUp_Rpo_Imp implements SignUp_Rpo{
  SignUpDataSource _signUpDataSource;
  SignUp_Rpo_Imp(this._signUpDataSource);
  @override
  Future<void> signUp(SignUpRequest request) {
    return _signUpDataSource.signUp(request);
  }
}