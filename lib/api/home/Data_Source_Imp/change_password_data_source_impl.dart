import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/home/Data_Source/change_password_data_source.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/api/home/request/change_password_request.dart';
import 'package:project_one_c3_team/api/home/response/change_profile_password_response.dart';


@Injectable(as: ChangePasswordDataSource)
class ChangePasswordDataSourceImpl implements ChangePasswordDataSource {
  final ApiClient apiClient;
  ChangePasswordDataSourceImpl(this.apiClient);

  @override
  Future<ChangeProfilePasswordResponse> changePassword(String token, ChangePasswordRequest request) async {
    return await apiClient.changePassword(token, request);
  }
}