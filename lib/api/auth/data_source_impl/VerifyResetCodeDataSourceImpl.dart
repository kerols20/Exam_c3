import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';

import '../../../Data/auth/data_source/verifyResetCodeDataSource.dart';
import '../request/Verify_Reset_password.dart';
@Injectable(as: VerifyResetCodeRemoteDataSource)
class VerifyResetCodeRemoteDataSourceImpl implements VerifyResetCodeRemoteDataSource {
  ApiClient apiClient;
  VerifyResetCodeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<void> verifyResetCode(Verify_reset_password request) {
    return apiClient.verifyResetCode(request);
  }
}