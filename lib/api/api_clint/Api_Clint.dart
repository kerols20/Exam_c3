import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../Request/Request.dart';
part 'Api_Clint.g.dart';
@RestApi(baseUrl: "https://exam.elevateegy.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("v1/auth/signUp")
  Future<void> signUp(@Body() SignUpRequest request);
}
