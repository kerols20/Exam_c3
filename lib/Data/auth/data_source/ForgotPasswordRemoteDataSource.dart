import '../../../api/auth/request/Forgot_Password_Request.dart';


abstract class ForgotPasswordRemoteDataSource {
  Future<void> forgotPasswordSendCode(ForgotPasswordRequest request);
}