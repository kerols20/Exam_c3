import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';
import 'package:project_one_c3_team/api/home/request/change_password_request.dart';
import 'package:project_one_c3_team/api/home/request/edit_profile_request.dart';
import 'package:project_one_c3_team/api/home/response/change_profile_password_response.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../auth/request/Forgot_Password_Request.dart';
import '../auth/request/Request.dart';
import '../auth/request/Reset Password.dart';
import '../auth/request/Verify_Reset_password.dart';
import '../home/response/Get_Exams_by_Id.dart';
import '../home/response/Get_qustion_by_Exam.dart';
import '../home/response/Get_subjects_Rsonse.dart';
import '../auth/response/sign_in_response.dart';
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
  @GET("v1/exams")
  Future<Get_Exams_by_Id_subject> Get_Exams(
      @Header("token") String token, @Query("subject") String subject,);

  @GET("v1/questions")
  Future<Get_qustion_by_Exam_id> Get_qustion_by_Exam(
      @Header("token") String token, @Query("exam") String exam,);

  @POST("v1/auth/forgotPassword")
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST("v1/auth/verifyResetCode")
  Future<void> verifyResetCode(@Body() Verify_reset_password request);

  @PUT("v1/auth/resetPassword")
  Future<void> resetPassword(@Body() Reset_Password request);

  @GET("v1/auth/profileData")
  Future<UserInfoResponse> getProfileData(@Header("token") String token);

  @PUT("v1/auth/editProfile")
  Future<UserInfoResponse> editProfile(
    @Header("token") String token,
    @Body() EditProfileRequest request,
  );

  @PATCH("v1/auth/changePassword")
  Future<ChangeProfilePasswordResponse> changePassword(
    @Header("token") String token,
    @Body() ChangePasswordRequest request,
  );
}

