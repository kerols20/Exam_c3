import '../../api/Request/Request.dart';

abstract class SignUpDataSource{
  Future<void> signUp(SignUpRequest request);
}