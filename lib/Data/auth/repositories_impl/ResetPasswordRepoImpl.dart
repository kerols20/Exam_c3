import 'package:injectable/injectable.dart';

import '../../../api/auth/request/Reset Password.dart';
import '../../../domin/auth/repositories/Reset_password_reposetories.dart';
import '../data_source/ResetPasswordRemoteDataSource.dart';
@Injectable(as: ResetPasswordReposetories)
class ResetPasswordRepoImp  implements ResetPasswordReposetories{

  ResetPasswordRemoteDataSource _resetPasswordRemoteDataSource;
  ResetPasswordRepoImp(this._resetPasswordRemoteDataSource);

  @override
  Future<void> resetPassword(Reset_Password request) {
    return _resetPasswordRemoteDataSource.resetPassword(request);
  }


}