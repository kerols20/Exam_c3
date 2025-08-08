import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../Data/auth/data_source/ForgotPasswordRemoteDataSource.dart';
import '../request/Forgot_Password_Request.dart';
@Injectable(as: ForgotPasswordRemoteDataSource)
class ForgotPasswordRemoteDataSourceImpl implements ForgotPasswordRemoteDataSource {
  ApiClient apiClient;
  ForgotPasswordRemoteDataSourceImpl(this.apiClient);
  
  get errorHandler => null;

  @override
  Future<Result<void>> forgotPasswordSendCode(ForgotPasswordRequest request) async{
   try {
      await apiClient.forgotPassword(request);
      return const Success(null);
    } catch (e) {
      return errorHandler.handleForgotPasswordError(e as Exception);
    }
  }
}