import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/Data_Source/SignInRemoteDataSource.dart';
import 'package:project_one_c3_team/api/Request/sign_in_request.dart';
import 'package:project_one_c3_team/domin/repositries/sign_in_reposetories.dart';

import '../../api/response/sign_in_response.dart';
@Injectable(as: SignInRepositories)
class SignInRepoImpl  implements SignInRepositories{

  SignInRemoteDataSource _signInRemoteDataSource;
  SignInRepoImpl(this._signInRemoteDataSource);
  @override
  Future<Sign_in_response> signIn(SignInRequest request) async {
    return _signInRemoteDataSource.signIn(request);
  }

}