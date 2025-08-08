import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project_one_c3_team/api/auth/request/Forgot_Password_Request.dart';
import 'package:project_one_c3_team/api/auth/request/Reset%20Password.dart';
import 'package:project_one_c3_team/api/auth/request/SignUpRequest.dart';
import 'package:project_one_c3_team/api/auth/request/Verify_Reset_password.dart';
import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';
import 'package:project_one_c3_team/api/auth/response/sign_in_response.dart';
import 'package:project_one_c3_team/api/home/response/Get_qustion_by_Exam.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/auth/use_case/ForgotPasswordUseCase.dart';
import 'package:project_one_c3_team/domin/auth/use_case/ResetPasswordUseCase.dart';
import 'package:project_one_c3_team/domin/auth/use_case/SignInUseCase.dart';
import 'package:project_one_c3_team/domin/auth/use_case/SignUp_UsaCase.dart';
import 'package:project_one_c3_team/domin/auth/use_case/VerifyResetCodeUseCase.dart';
import 'package:project_one_c3_team/domin/home/UsaCase/Get_subjects_Use_Case.dart';
import 'package:project_one_c3_team/domin/home/UsaCase/get_user_info_use_case.dart';
import 'package:project_one_c3_team/domin/home/model/Get_subjects_model.dart';
import 'package:project_one_c3_team/viweModel/viweModel.dart';

import 'viweModel_test.mocks.dart';
@GenerateMocks([
  SignUp_UsaCase,
  SignInUseCase,
  Get_subject_Use_Case,
  ForgotPasswordUseCase,
  VerifyResetCodeUseCase,
  ResetPasswordUseCase,
  GetUserInfoUseCase
])

void main() {
 group("test viwe_model", () {
   var SignUp_UsaCase  = MockSignUp_UsaCase();
   var SignInUseCase = MockSignInUseCase();
   var Get_subject_Use_Case = MockGet_subject_Use_Case();
   var ForgotPasswordUseCase = MockForgotPasswordUseCase();
   var VerifyResetCodeUseCase = MockVerifyResetCodeUseCase();
   var ResetPasswordUseCase = MockResetPasswordUseCase();
   blocTest<Viwe_Model, Viwe_State>(
     'test sign up',
     build: () {
       provideDummy<Result<void>>(Success<void>(null));
       when(SignUp_UsaCase.signUp(any)).thenAnswer((_) async => Success<void>(null),
       );
       return Viwe_Model(
         SignUp_UsaCase,
         SignInUseCase,
         Get_subject_Use_Case,
         ForgotPasswordUseCase,
         VerifyResetCodeUseCase,
         ResetPasswordUseCase,
       );
     },
     act: (bloc) {
       final request = SignUpRequest(
         firstName: "test",
         lastName: "test",
         email: "test",
         password: "swdwdkqwqioru232894",
         rePassword: "swdwdkqwqioru232894",
         phone: "01022345543",
         username: "kerolos",
       );
       return bloc.doAction(signUPData(request));
     },
     expect: () => [
       Viwe_State.initial().copyWith(isLoading: true),
       Viwe_State.initial().copyWith(isLoading: false, sucsses: "SignUp success"),
     ],
     verify: (bloc) {
       verify(SignUp_UsaCase.signUp(any)).called(1);
     },
   );

   blocTest<Viwe_Model, Viwe_State>(
     'tast_sign_in',
     build: () {
       provideDummy<Result<Sign_in_response>>(
         Success<Sign_in_response>(
           Sign_in_response(/* قيمك هنا */),
         ),
       );
       when(SignInUseCase.signIn(any)).thenAnswer(
             (_) async => Success<Sign_in_response>(
           Sign_in_response(/* قيمك هنا */),
         ),
       );
       return Viwe_Model(
         SignUp_UsaCase,
         SignInUseCase,
         Get_subject_Use_Case,
         ForgotPasswordUseCase,
         VerifyResetCodeUseCase,
         ResetPasswordUseCase,
       );
     },
     act: (bloc) {
       final request = SignInRequest(
         email: "test",
         password: "swdwdkqwqioru232894",
       );
       return bloc.doAction(signIngData(request));
     },
     expect: () => [
       Viwe_State.initial().copyWith(isLoading: true),
       Viwe_State.initial().copyWith(isLoading: false, sucsses: "SignIn success"),
     ],
     verify: (bloc) {
       verify(SignInUseCase.signIn(any)).called(1);
     },
   );

   blocTest<Viwe_Model, Viwe_State>(
     "Get_subject_Use_Case",
     build: () {
       provideDummy<Result<List<subject>>>(Success<List<subject>>([]));
       when(Get_subject_Use_Case.Get_subjects_Data(any))
           .thenAnswer((_) async => Success<List<subject>>([]));
       return Viwe_Model(
         SignUp_UsaCase,
         SignInUseCase,
         Get_subject_Use_Case,
         ForgotPasswordUseCase,
         VerifyResetCodeUseCase,
         ResetPasswordUseCase,
       );
     },
     act: (bloc) {
       return bloc.doAction(Getsubjects("test"));
     },
     expect: () => [
       Viwe_State.initial().copyWith(isLoading: true),
       Viwe_State.initial().copyWith(isLoading: false, sucsses: "success"),
     ],
     verify: (bloc) {
       verify(Get_subject_Use_Case.Get_subjects_Data(any)).called(1);
     },
   );

   blocTest<Viwe_Model, Viwe_State>(
     "ForgotPasswordUseCase",
         build: () {
           provideDummy<Result<Sign_in_response>>(
             Success<Sign_in_response>(
               Sign_in_response(/* قيمك هنا */),
             ),
           );
           when(ForgotPasswordUseCase.forgotPasswordSendCode(any)).thenAnswer((_) async => Success<void>(null));
           return Viwe_Model(
             SignUp_UsaCase,
             SignInUseCase,
             Get_subject_Use_Case,
             ForgotPasswordUseCase,
             VerifyResetCodeUseCase,
             ResetPasswordUseCase,
           );
         },
   act: (bloc) {
       return bloc.doAction(ForgotPasswordAction(ForgotPasswordRequest(
           email: "test",
       ))
       );
   },
     expect: () => [
       Viwe_State.initial().copyWith(isLoading: true),
       Viwe_State.initial().copyWith(isLoading: false, sucsses: "ForgotPassword success"),
     ],
     verify: (bloc) {
       verify(ForgotPasswordUseCase.forgotPasswordSendCode(any)).called(1);
     }
   );
   blocTest<Viwe_Model, Viwe_State>(
     "VerifyResetCodeUseCase",
     build: () {
       when(VerifyResetCodeUseCase.verifyResetCode(any))
           .thenAnswer((_) async => Success<void>(null));
       return Viwe_Model(
         SignUp_UsaCase,
         SignInUseCase,
         Get_subject_Use_Case,
         ForgotPasswordUseCase,
         VerifyResetCodeUseCase,
         ResetPasswordUseCase,
         );
     },
     act: (bloc) {
       return bloc.doAction(VerifyResetCodeAction(Verify_reset_password(
           resetCode: "test"
       )));
     },
     expect: () => [
       Viwe_State.initial().copyWith(isLoading: true),
       Viwe_State.initial().copyWith(isLoading: false, sucsses: "verify success"),
   ],
     verify: (bloc) {
       verify(VerifyResetCodeUseCase.verifyResetCode(any)).called(1);
     },
   );
   blocTest<Viwe_Model, Viwe_State>(
     "ResetPasswordUseCase",
     build: () {
       when(ResetPasswordUseCase.resetPassword(any))
           .thenAnswer((_) async => Success<void>(null));
       return Viwe_Model(
         SignUp_UsaCase,
         SignInUseCase,
         Get_subject_Use_Case,
         ForgotPasswordUseCase,
         VerifyResetCodeUseCase,
         ResetPasswordUseCase,
       );
     },
     act: (bloc) {
       return bloc.doAction(ResetPasswordAction(Reset_Password(
         email: "test",
         newPassword: "test"
       ))
       );
     },
     expect: () => [
       Viwe_State.initial().copyWith(isLoading: true),
       Viwe_State.initial().copyWith(isLoading: false, sucsses: "Password reset")
     ],
     verify: (bloc) {
       verify(ResetPasswordUseCase.resetPassword(any)).called(1);
     },
   );
 },);
}