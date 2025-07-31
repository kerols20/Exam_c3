import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/domin/home/repositries/get_user_info_repository.dart';

@injectable
class GetUserInfoUseCase {
  final GetUserInfoRepository _repository;

  GetUserInfoUseCase(this._repository);

  Future<UserInfoResponse> execute(String token) {
    return _repository.getUserInfo(token);
  }
}