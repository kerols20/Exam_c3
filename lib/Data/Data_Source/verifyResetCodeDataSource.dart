
import '../../api/Request/EmailVerificationRequest.dart';

abstract class VerifyResetCodeRemoteDataSource {
  Future<void> verifyResetCode(VerifyResetCodeRequest request);
}


