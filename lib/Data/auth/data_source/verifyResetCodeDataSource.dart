
import '../../../api/auth/request/Verify_Reset_password.dart';

abstract class VerifyResetCodeRemoteDataSource {
  Future<void> verifyResetCode(Verify_reset_password request);
}