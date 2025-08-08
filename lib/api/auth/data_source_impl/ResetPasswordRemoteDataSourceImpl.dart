import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../Data/auth/data_source/ResetPasswordRemoteDataSource.dart';
import '../request/Reset Password.dart';
@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource {
  ApiClient apiClient;
  ResetPasswordRemoteDataSourceImpl(this.apiClient);
  
  get errorHandler => null;

  @override
  Future<Result<void>> resetPassword(Reset_Password request) async {
    try {
      await apiClient.resetPassword(request);
      return const Success(null);
    } catch (e) {
      return errorHandler.handleResetPasswordError(e as Exception);
    }
  }
}