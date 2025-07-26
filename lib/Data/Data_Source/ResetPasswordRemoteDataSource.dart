
import '../../api/Request/Reset Password.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<void> resetPassword(Reset_Password request);
}