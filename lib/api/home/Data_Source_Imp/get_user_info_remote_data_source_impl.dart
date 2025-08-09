import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/home/Data_Source/get_user_info_data_source.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/core/errors/handlers/auth_error_handler.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

@Injectable(as: GetUserInfoDataSource)
class GetUserInfoRemoteDataSourceImpl implements GetUserInfoDataSource {
  final ApiClient apiClient;
  AuthErrorHandler errorHandler;
  GetUserInfoRemoteDataSourceImpl(this.apiClient, this.errorHandler);

  Future<Result<UserInfoResponse>> getUserInfo(String token) async {
    try {
      final response = await apiClient.getProfileData(token);
      return Success(response);
    } catch (e) {
      return errorHandler.handle(e as Exception);
    }
  }
}

