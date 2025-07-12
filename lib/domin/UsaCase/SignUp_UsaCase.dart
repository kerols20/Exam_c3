import 'package:injectable/injectable.dart';

import '../../api/Request/Request.dart';
import '../repositries/SignUp_reposetries.dart';
@injectable
class SignUp_UsaCase{
  SignUp_Rpo _signUp_Rpo;
  SignUp_UsaCase(this._signUp_Rpo);
  Future<void> signUp(SignUpRequest request){
    return _signUp_Rpo.signUp(request);
  }
}