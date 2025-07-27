import 'package:injectable/injectable.dart';
import '../../../api/auth/request/Verify_Reset_password.dart';
import '../../../domin/auth/repositories/verify_reset_code.dart';
import '../data_source/verifyResetCodeDataSource.dart';
@Injectable(as: VerifyResetCodeReposetories)
class VerifyResetCodeRepoImp  implements VerifyResetCodeReposetories{

  final VerifyResetCodeRemoteDataSource _verifyResetCodeRemoteDataSource;
  VerifyResetCodeRepoImp(this._verifyResetCodeRemoteDataSource);

  @override
  Future<void> verifyResetCode(Verify_reset_password request) {
    return _verifyResetCodeRemoteDataSource.verifyResetCode(request);
  }
}