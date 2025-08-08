
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/Reset Password.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<Result<void>> resetPassword(Reset_Password request);
}