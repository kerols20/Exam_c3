import '../../../api/auth/request/Reset Password.dart';


abstract class ResetPasswordReposetories {
  Future<void> resetPassword(Reset_Password request);
}