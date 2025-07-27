import 'package:injectable/injectable.dart';
import '../../../api/auth/request/Reset Password.dart';
import '../repositories/Reset_password_reposetories.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordReposetories _resetPasswordReposetories;
  ResetPasswordUseCase(this._resetPasswordReposetories);
  Future<void> resetPassword(Reset_Password request) {
    return _resetPasswordReposetories.resetPassword(request);
  }
}