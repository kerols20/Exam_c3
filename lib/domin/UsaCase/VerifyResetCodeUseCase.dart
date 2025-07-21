import 'package:injectable/injectable.dart';

import '../../api/Request/EmailVerificationRequest.dart';

import '../repositries/verify_reset_code.dart';

@injectable
class VerifyResetCodeUseCase {
  final VerifyResetCodeReposetories _verifyResetCodeReposetories;
  VerifyResetCodeUseCase(this._verifyResetCodeReposetories);
  Future<void> verifyResetCode(VerifyResetCodeRequest request) {
    return _verifyResetCodeReposetories.verifyResetCode(request);
  }
}
