import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/home/Data_Source/edit_profile_data_source.dart';
import 'package:project_one_c3_team/api/home/request/edit_profile_request.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/repositries/edit_profile_repository.dart';
@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImpl implements EditProfileRepository {
  final EditProfileDataSource dataSource;
  EditProfileRepositoryImpl(this.dataSource);
  @override
  Future<Result<UserInfoResponse>> editProfile(String token, EditProfileRequest request) {
    return dataSource.editProfile(token, request);
  }
}