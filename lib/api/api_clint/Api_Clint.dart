import 'package:project_one_c3_team/api/Request/sign_in_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../Request/Forgot_Password_Request.dart';
import '../Request/Request.dart';
import '../Request/Reset Password.dart';
import '../Request/Verify_Reset_password.dart';
import '../response/Get_subjects_Rsonse.dart';
import '../response/sign_in_response.dart';
part 'Api_Clint.g.dart';
@RestApi(baseUrl: "https://exam.elevateegy.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;
  @POST("v1/auth/signUp")
  Future<dynamic> signUp(@Body() SignUpRequest request);

 @POST("v1/auth/signIn")
  Future<Sign_in_response> signIn(@Body() SignInRequest request);
  @GET("v1/subjects")
  Future<Get_subjects_Rsonse> Get_subjects(@Header("token") String token );
  @POST("v1/auth/forgotPassword")

  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST("v1/auth/verifyResetCode")
  Future<void> verifyResetCode(@Body() Verify_reset_password request);

  @PUT("v1/auth/resetPassword")
  Future<void> resetPassword(@Body() Reset_Password request);
}
