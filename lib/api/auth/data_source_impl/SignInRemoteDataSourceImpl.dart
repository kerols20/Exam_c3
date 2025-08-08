import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/auth/data_source/SignInRemoteDataSource.dart';
import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../response/sign_in_response.dart';
@Injectable(as: SignInRemoteDataSource)
class Signinremotedatasourceimpl implements SignInRemoteDataSource {
  ApiClient apiClient;
  Signinremotedatasourceimpl(this.apiClient);
  
  get errorHandler => null;
  @override
  Future<Result<Sign_in_response>> signIn(SignInRequest request) async {
    try {
      final response = await apiClient.signIn(request);
      return Success(response);
    } catch (e) {
      return errorHandler.handleSignInError(e as Exception);
    }
  }
}