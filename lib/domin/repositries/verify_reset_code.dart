
import '../../api/Request/EmailVerificationRequest.dart';

abstract class VerifyResetCodeReposetories {
  Future<void> verifyResetCode(VerifyResetCodeRequest request);
}