import 'package:project_one_c3_team/api/Request/EmailVerificationRequest.dart';
import 'package:project_one_c3_team/api/Request/sign_in_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../Request/ForgotPasswordRequest.dart';
import '../Request/Request.dart';
import '../Request/ResetPasswordRequest.dart';
import '../response/sign_in_response.dart';
part 'Api_Clint.g.dart';
@RestApi(baseUrl: "https://exam.elevateegy.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("v1/auth/signUp")
  Future<void> signUp(@Body() SignUpRequest request);

 @POST("v1/auth/signIn")
  Future<Sign_in_response> signIn(@Body() SignInRequest request);


@POST("v1/auth/forgotPassword")
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);


@POST("v1/auth/verifyResetCode")
  Future<void> verifyResetCode(@Body() VerifyResetCodeRequest request);


@PUT("v1/auth/resetPassword")
  Future<void> resetPassword(@Body() ResetPasswordRequest request);
}
