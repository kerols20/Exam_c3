import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/home/Data_Source/edit_profile_data_source.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/api/home/request/edit_profile_request.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/core/errors/handlers/home_error_handler.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
@Injectable(as: EditProfileDataSource)
class EditUserProfileDataSourceImpl implements EditProfileDataSource {
  final ApiClient apiClient;
  HomeErrorHandler errorHandler;
  EditUserProfileDataSourceImpl(this.apiClient, this.errorHandler);


  @override
  Future<Result<UserInfoResponse>> editProfile(String token, EditProfileRequest request) async {
    try {
      final response = await apiClient.editProfile(token, request);
      return Success(response);
    } catch (e) {
      return errorHandler.handleEditProfileError(e as Exception);
    }
  }
}