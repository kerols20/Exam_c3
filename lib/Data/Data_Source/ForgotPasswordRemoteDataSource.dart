import '../../api/Request/Forgot_Password_Request.dart';


abstract class ForgotPasswordRemoteDataSource {
  Future<void> forgotPasswordSendCode(ForgotPasswordRequest request);
}