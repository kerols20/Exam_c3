import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/auth/data_source/SignInRemoteDataSource.dart';
import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/auth/repositories/sign_in_reposetories.dart';

import '../../../api/auth/response/sign_in_response.dart';
@Injectable(as: SignInRepositories)
class SignInRepoImpl  implements SignInRepositories{

  SignInRemoteDataSource _signInRemoteDataSource;
  SignInRepoImpl(this._signInRemoteDataSource);
  @override
  Future<Result<Sign_in_response>> signIn(SignInRequest request) async {
    return _signInRemoteDataSource.signIn(request);
  }
}