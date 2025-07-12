import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(
    baseUrl: "https://exam.elevateegy.com/api/",
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));
  @lazySingleton
  ApiClient provideApiClient(Dio dio) => ApiClient(dio);
}
