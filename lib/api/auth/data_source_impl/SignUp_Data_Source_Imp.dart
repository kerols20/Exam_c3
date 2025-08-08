import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import '../../../Data/auth/data_source/SignUp_Data_Source.dart';
import '../../api_clint/Api_Clint.dart';
import 'package:dio/dio.dart';

import '../request/SignUpRequest.dart';
/// unit test
@Injectable(as: SignUpDataSource)
class SidnUp_Data_Source_Imp implements SignUpDataSource {
  final ApiClient _apiClient;
  SidnUp_Data_Source_Imp(this._apiClient);
  
  get errorHandler => null;

  @override
  Future<Result<void>> signUp(SignUpRequest request) async {
    try {
      await _apiClient.signUp(request);
      return const Success(null);
    } catch (e) {
      return errorHandler.handleSignUpError(e as Exception);
    }
  }
}
/// kerolos@gmail.com
/// 123Zzx2234@@##