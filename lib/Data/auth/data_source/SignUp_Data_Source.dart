import '../../../api/auth/request/Request.dart';

abstract class SignUpDataSource{
  Future<void> signUp(SignUpRequest request);
}