import 'package:project_one_c3_team/api/Request/sign_in_request.dart';
//import 'package:project_one_c3_team/api/response/sign_in_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../Request/Request.dart';
part 'Api_Clint.g.dart';
@RestApi(baseUrl: "https://exam.elevateegy.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("v1/auth/signUp")
  Future<void> signUp(@Body() SignUpRequest request);

 @POST("v1/auth/signIn")
  Future<void> signIn(@Body() SignInRequest request); 
}
