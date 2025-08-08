import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import '../../../api/auth/request/Forgot_Password_Request.dart';
import '../repositories/forgot_password_reposetories.dart';

@injectable
class ForgotPasswordUseCase {
  final ForgotPasswordReposetories _forgotPasswordReposetories;
  ForgotPasswordUseCase(this._forgotPasswordReposetories);
  Future<Result<void>> forgotPasswordSendCode(ForgotPasswordRequest request) {
    return _forgotPasswordReposetories.forgotPasswordSendCode(request);
  }
}