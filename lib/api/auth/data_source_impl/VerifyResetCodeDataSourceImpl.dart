import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../Data/auth/data_source/verifyResetCodeDataSource.dart';
import '../request/Verify_Reset_password.dart';
@Injectable(as: VerifyResetCodeRemoteDataSource)
class VerifyResetCodeRemoteDataSourceImpl implements VerifyResetCodeRemoteDataSource {
  ApiClient apiClient;
  VerifyResetCodeRemoteDataSourceImpl(this.apiClient);
  
  get errorHandler => null;

  @override
  Future<Result<void>> verifyResetCode(Verify_reset_password request) async {
    try {
      await apiClient.verifyResetCode(request);
      return const Success(null);
    } catch (e) {
      return errorHandler.handleVerifyCodeError(e as Exception);
    }
  }
}