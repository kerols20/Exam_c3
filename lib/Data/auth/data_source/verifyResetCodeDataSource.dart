
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/Verify_Reset_password.dart';

abstract class VerifyResetCodeRemoteDataSource {
  Future<Result<void>> verifyResetCode(Verify_reset_password request);
}