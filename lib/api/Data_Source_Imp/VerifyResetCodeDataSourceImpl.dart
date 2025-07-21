import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import '../../Data/Data_Source/verifyResetCodeDataSource.dart';
import '../Request/EmailVerificationRequest.dart';

@Injectable(as: VerifyResetCodeRemoteDataSource)
class VerifyResetCodeRemoteDataSourceImpl
    implements VerifyResetCodeRemoteDataSource {
  ApiClient apiClient;
  VerifyResetCodeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<void> verifyResetCode(VerifyResetCodeRequest request) {
    return apiClient.verifyResetCode(request);
  }
}
