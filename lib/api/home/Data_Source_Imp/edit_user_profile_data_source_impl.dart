import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/home/Data_Source/edit_profile_data_source.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/api/home/request/edit_profile_request.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
@Injectable(as: EditProfileDataSource)
class EditUserProfileDataSourceImpl implements EditProfileDataSource {
  final ApiClient apiClient;
  EditUserProfileDataSourceImpl(this.apiClient);
  @override
  Future<UserInfoResponse> editProfile(String token, EditProfileRequest request) async {
    return await apiClient.editProfile(token, request);
  }
}