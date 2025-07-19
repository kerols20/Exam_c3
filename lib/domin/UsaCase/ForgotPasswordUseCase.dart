import 'package:injectable/injectable.dart';

import '../../api/Request/ForgotPasswordRequest.dart';
import '../repositries/forgot_password_reposetories.dart';

@injectable
class ForgotPasswordUseCase {
  final ForgotPasswordReposetories _forgotPasswordReposetories;
  ForgotPasswordUseCase(this._forgotPasswordReposetories);
  Future<void> forgotPasswordSendCode(ForgotPasswordRequest request) {
    return _forgotPasswordReposetories.forgotPasswordSendCode(request);
  }
}
