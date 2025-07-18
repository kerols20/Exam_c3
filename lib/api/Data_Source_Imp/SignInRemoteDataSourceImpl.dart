import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/Data_Source/SignInRemoteDataSource.dart';
import 'package:project_one_c3_team/api/Request/sign_in_request.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
@Injectable(as: SignInRemoteDataSource)
class Signinremotedatasourceimpl implements SignInRemoteDataSource {
  ApiClient apiClient;
  Signinremotedatasourceimpl(this.apiClient);
  @override
  Future<void> signIn(SignInRequest request) async {
     
    return apiClient.signIn(request);
  }

}