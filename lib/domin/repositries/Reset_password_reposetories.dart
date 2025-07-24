
import '../../api/Request/ResetPasswordRequest.dart';

abstract class ResetPasswordReposetories {
  Future<void> resetPassword(ResetPasswordRequest request);
}