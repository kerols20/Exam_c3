
import '../../api/Request/ResetPasswordRequest.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<void> resetPassword(ResetPasswordRequest request);
}


