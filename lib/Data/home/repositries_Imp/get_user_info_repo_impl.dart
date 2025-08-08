import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/Data/home/Data_Source/get_user_info_data_source.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/repositries/get_user_info_repository.dart';

@Injectable(as: GetUserInfoRepository)
class GetUserInfoRepoImpl implements GetUserInfoRepository {
  final GetUserInfoDataSource dataSource;
  GetUserInfoRepoImpl(this.dataSource);
  @override
  Future<Result<UserInfoResponse>> getUserInfo(String token) {

    return dataSource.getUserInfo(token);
  }
}