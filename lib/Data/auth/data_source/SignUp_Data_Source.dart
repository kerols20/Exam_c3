

import '../../../api/auth/request/SignUpRequest.dart';

abstract class SignUpDataSource{
  Future<void> signUp(SignUpRequest request);
}