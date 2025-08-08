import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/home/response/change_profile_password_response.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/repositries/change_password_repository.dart';
import 'package:project_one_c3_team/Data/home/Data_Source/change_password_data_source.dart';
import 'package:project_one_c3_team/api/home/request/change_password_request.dart';


@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final ChangePasswordDataSource dataSource;
  ChangePasswordRepositoryImpl(this.dataSource);

  @override
  Future<Result<ChangeProfilePasswordResponse>> changePassword(String token, ChangePasswordRequest request) {
    return dataSource.changePassword(token, request);
  }
}