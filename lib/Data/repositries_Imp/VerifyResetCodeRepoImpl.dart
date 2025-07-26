import 'package:injectable/injectable.dart';
import '../../api/Request/Verify_Reset_password.dart';
import '../../domin/repositries/verify_reset_code.dart';
import '../Data_Source/verifyResetCodeDataSource.dart';
@Injectable(as: VerifyResetCodeReposetories)
class VerifyResetCodeRepoImp  implements VerifyResetCodeReposetories{

  final VerifyResetCodeRemoteDataSource _verifyResetCodeRemoteDataSource;
  VerifyResetCodeRepoImp(this._verifyResetCodeRemoteDataSource);

  @override
  Future<void> verifyResetCode(Verify_reset_password request) {
    return _verifyResetCodeRemoteDataSource.verifyResetCode(request);
  }
}