import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';

import '../../Data/Data_Source/ResetPasswordRemoteDataSource.dart';
import '../Request/Reset Password.dart';
@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource {
  ApiClient apiClient;
  ResetPasswordRemoteDataSourceImpl(this.apiClient);

  @override
  Future<void> resetPassword(Reset_Password request) {
    return apiClient.resetPassword(request);
  }
}