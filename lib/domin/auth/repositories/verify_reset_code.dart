import '../../../api/auth/request/Verify_Reset_password.dart';

abstract class VerifyResetCodeReposetories {
  Future<void> verifyResetCode(Verify_reset_password request);
}