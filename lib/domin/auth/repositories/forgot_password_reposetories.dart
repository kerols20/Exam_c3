import '../../../api/auth/request/Forgot_Password_Request.dart';


abstract class ForgotPasswordReposetories {
  Future<void> forgotPasswordSendCode(ForgotPasswordRequest request);
}