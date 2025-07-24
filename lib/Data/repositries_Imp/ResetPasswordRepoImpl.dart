import 'package:injectable/injectable.dart';

import '../../api/Request/ResetPasswordRequest.dart';
import '../../domin/repositries/Reset_password_reposetories.dart';
import '../Data_Source/ResetPasswordRemoteDataSource.dart';
@Injectable(as: ResetPasswordReposetories)
class ResetPasswordRepoImp  implements ResetPasswordReposetories{

  ResetPasswordRemoteDataSource _resetPasswordRemoteDataSource;
  ResetPasswordRepoImp(this._resetPasswordRemoteDataSource);

  @override
  Future<void> resetPassword(ResetPasswordRequest request) {
    return _resetPasswordRemoteDataSource.resetPassword(request);
  }


}