
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/auth/data_source/ForgotPasswordRemoteDataSource.dart';
import '../../../api/auth/request/Forgot_Password_Request.dart';
import '../../../domin/auth/repositories/forgot_password_reposetories.dart';

@Injectable(as: ForgotPasswordReposetories)
class ForgotPasswordRepoImpl  implements ForgotPasswordReposetories{

  ForgotPasswordRemoteDataSource _forgotPasswordRemoteDataSource;
  ForgotPasswordRepoImpl(this._forgotPasswordRemoteDataSource);

  @override
  Future<void> forgotPasswordSendCode(ForgotPasswordRequest request) {
    return _forgotPasswordRemoteDataSource.forgotPasswordSendCode(request);
  }
}
