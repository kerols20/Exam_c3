import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/handlers/auth_error_handler.dart';

import '../../../Data/auth/data_source/SignUp_Data_Source.dart';
import '../../../core/errors/result/results.dart';
import '../../api_clint/Api_Clint.dart';
import '../request/SignUpRequest.dart';

@Injectable(as: SignUpDataSource)
class SidnUp_Data_Source_Imp implements SignUpDataSource {
  final ApiClient _apiClient;
  final AuthErrorHandler errorHandler;

  SidnUp_Data_Source_Imp(this._apiClient, this.errorHandler);

  @override
  Future<Result<void>> signUp(SignUpRequest request) async {
    try {
      await _apiClient.signUp(request);
      return const Success(null);
    } catch (e) {
      return errorHandler.handleSignUpError(e as Exception);
    }
  }
}
