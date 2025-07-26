import 'package:injectable/injectable.dart';
import '../../api/Request/Reset Password.dart';
import '../repositries/Reset_password_reposetories.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordReposetories _resetPasswordReposetories;
  ResetPasswordUseCase(this._resetPasswordReposetories);
  Future<void> resetPassword(Reset_Password request) {
    return _resetPasswordReposetories.resetPassword(request);
  }
}