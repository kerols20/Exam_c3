import '../../../api/auth/request/Request.dart';

abstract class SignUp_Rpo{
  Future<void> signUp(SignUpRequest request);
}