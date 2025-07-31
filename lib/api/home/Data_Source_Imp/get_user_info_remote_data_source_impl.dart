import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/home/Data_Source/get_user_info_data_source.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';

@Injectable(as: GetUserInfoDataSource)
class GetUserInfoRemoteDataSourceImpl implements GetUserInfoDataSource {
  final ApiClient apiClient;

  GetUserInfoRemoteDataSourceImpl(this.apiClient);

  Future<UserInfoResponse> getUserInfo(String token) async {
    return await apiClient.getProfileData(token);
  }
}