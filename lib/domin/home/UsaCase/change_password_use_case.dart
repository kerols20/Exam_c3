import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/home/response/change_profile_password_response.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/repositries/change_password_repository.dart';
import 'package:project_one_c3_team/api/home/request/change_password_request.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepository repository;
  ChangePasswordUseCase(this.repository);
  Future<Result<ChangeProfilePasswordResponse>> execute(String token, ChangePasswordRequest request) {
    return repository.changePassword(token, request);
  }
}