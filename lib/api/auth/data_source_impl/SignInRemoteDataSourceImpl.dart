import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/auth/data_source/SignInRemoteDataSource.dart';
import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';

import '../response/sign_in_response.dart';
@Injectable(as: SignInRemoteDataSource)
class Signinremotedatasourceimpl implements SignInRemoteDataSource {
  ApiClient apiClient;
  Signinremotedatasourceimpl(this.apiClient);
  @override
  Future<Sign_in_response> signIn(SignInRequest request) async {
    return apiClient.signIn(request);
  }

}