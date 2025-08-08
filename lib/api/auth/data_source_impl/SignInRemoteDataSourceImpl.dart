import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/auth/data_source/SignInRemoteDataSource.dart';
import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../response/sign_in_response.dart';
@Injectable(as: SignInRemoteDataSource)
class Signinremotedatasourceimpl implements SignInRemoteDataSource {
  ApiClient apiClient;
  final AuthErrorHandler errorHandler;
  Signinremotedatasourceimpl(this.apiClient, this.errorHandler);
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