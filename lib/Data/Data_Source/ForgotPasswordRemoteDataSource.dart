
import '../../api/Request/ForgotPasswordRequest.dart';

abstract class ForgotPasswordRemoteDataSource {
  Future<void> forgotPasswordSendCode(ForgotPasswordRequest request);
}


