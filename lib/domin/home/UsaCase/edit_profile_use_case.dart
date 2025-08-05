import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/home/request/edit_profile_request.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/domin/home/repositries/edit_profile_repository.dart';
@injectable
class EditProfileUseCase {
  final EditProfileRepository _repository;
  EditProfileUseCase(this._repository);
  Future<UserInfoResponse> editProfile(String token, EditProfileRequest request) {
    return _repository.editProfile(token, request);
  }
}