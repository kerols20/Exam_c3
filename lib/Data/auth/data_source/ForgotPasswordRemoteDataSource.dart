import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/Forgot_Password_Request.dart';


abstract class ForgotPasswordRemoteDataSource {
  Future<Result<void>> forgotPasswordSendCode(ForgotPasswordRequest request);
}