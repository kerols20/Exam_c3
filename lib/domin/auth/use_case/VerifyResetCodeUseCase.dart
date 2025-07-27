import 'package:injectable/injectable.dart';

import '../../../api/auth/request/Verify_Reset_password.dart';
import '../repositories/verify_reset_code.dart';

@injectable
class VerifyResetCodeUseCase {
  final VerifyResetCodeReposetories _verifyResetCodeReposetories;
  VerifyResetCodeUseCase(this._verifyResetCodeReposetories);
  Future<void> verifyResetCode(Verify_reset_password request) {
    return _verifyResetCodeReposetories.verifyResetCode(request);
  }
}