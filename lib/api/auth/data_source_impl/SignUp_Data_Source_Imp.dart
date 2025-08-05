import 'dart:developer';
import 'package:injectable/injectable.dart';
import '../../../Data/auth/data_source/SignUp_Data_Source.dart';
import '../../api_clint/Api_Clint.dart';
import 'package:dio/dio.dart';

import '../request/SignUpRequest.dart';
/// unit test
@Injectable(as: SignUpDataSource)
class SidnUp_Data_Source_Imp implements SignUpDataSource {
  final ApiClient _apiClient;
  SidnUp_Data_Source_Imp(this._apiClient);

  @override
  Future<void> signUp(SignUpRequest request) async {
    try {
      await _apiClient.signUp(request);
    } on DioException catch (e) {
      log("❌ DioException", error: e, stackTrace: e.stackTrace);
      log("❌ Status Code", error: e.response?.statusCode);
      log("❌ Response Data", error: e.response?.data);
      final message = e.response?.data?['message']?.toString() ?? 'Signup failed';
      throw Exception(message);
    } catch (e, stackTrace) {
      log("❌ Unknown Error", error: e, stackTrace: stackTrace);
      throw Exception('Something went wrong');
    }
  }
}
/// kerolos@gmail.com
/// 123Zzx2234@@##