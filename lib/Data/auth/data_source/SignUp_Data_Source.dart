

import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/SignUpRequest.dart';

abstract class SignUpDataSource{
  Future<Result<void>> signUp(SignUpRequest request);
}