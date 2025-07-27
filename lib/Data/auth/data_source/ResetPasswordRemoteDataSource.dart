
import '../../../api/auth/request/Reset Password.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<void> resetPassword(Reset_Password request);
}