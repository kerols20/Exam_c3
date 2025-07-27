import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';

import '../../../Data/auth/data_source/ForgotPasswordRemoteDataSource.dart';
import '../request/Forgot_Password_Request.dart';
@Injectable(as: ForgotPasswordRemoteDataSource)
class ForgotPasswordRemoteDataSourceImpl implements ForgotPasswordRemoteDataSource {
  ApiClient apiClient;
  ForgotPasswordRemoteDataSourceImpl(this.apiClient);

  @override
  Future<void> forgotPasswordSendCode(ForgotPasswordRequest request) {
    return apiClient.forgotPassword(request);
  }
}