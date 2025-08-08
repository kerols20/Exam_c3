import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../Data/auth/data_source/ResetPasswordRemoteDataSource.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../request/Reset Password.dart';
@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource {
  ApiClient apiClient;
  final AuthErrorHandler errorHandler;
  ResetPasswordRemoteDataSourceImpl(this.apiClient, this.errorHandler);
  @override
  Future<Result<void>> resetPassword(Reset_Password request) async {
    try {
     final response = await apiClient.resetPassword(request);
      return  Success(response);
    } catch (e) {
      return errorHandler.handleResetPasswordError(e as Exception);
    }
  }
}