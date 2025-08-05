

import '../../../api/auth/request/SignUpRequest.dart';

abstract class SignUp_Rpo{
  Future<void> signUp(SignUpRequest request);
}