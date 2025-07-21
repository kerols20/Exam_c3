import 'package:injectable/injectable.dart';
import '../../api/Request/EmailVerificationRequest.dart';
import '../../domin/repositries/verify_reset_code.dart';
import '../Data_Source/verifyResetCodeDataSource.dart';


@Injectable(as: VerifyResetCodeReposetories)
class VerifyResetCodeRepoImp  implements VerifyResetCodeReposetories{

  final VerifyResetCodeRemoteDataSource _verifyResetCodeRemoteDataSource;
  VerifyResetCodeRepoImp(this._verifyResetCodeRemoteDataSource);

  @override
  Future<void> verifyResetCode(VerifyResetCodeRequest request) {
    return _verifyResetCodeRemoteDataSource.verifyResetCode(request);
  }


}