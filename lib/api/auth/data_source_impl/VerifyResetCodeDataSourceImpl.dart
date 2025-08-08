import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../Data/auth/data_source/verifyResetCodeDataSource.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../request/Verify_Reset_password.dart';
@Injectable(as: VerifyResetCodeRemoteDataSource)
class VerifyResetCodeRemoteDataSourceImpl implements VerifyResetCodeRemoteDataSource {
  ApiClient apiClient;
   AuthErrorHandler errorHandler;
  VerifyResetCodeRemoteDataSourceImpl(this.apiClient, this.errorHandler);
  @override
  Future<Result<void>> verifyResetCode(Verify_reset_password request) async {
    try {
     final response =  await apiClient.verifyResetCode(request);
      return  Success(response);
    } catch (e) {
      return errorHandler.handleVerifyCodeError(e as Exception);
    }
  }
}