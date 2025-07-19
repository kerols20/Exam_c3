import 'package:project_one_c3_team/api/Request/ForgotPasswordRequest.dart';

abstract class ForgotPasswordReposetories {
  Future<void> forgotPasswordSendCode(ForgotPasswordRequest request);
}