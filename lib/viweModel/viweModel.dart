import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/domin/home/UsaCase/get_user_info_use_case.dart';
import '../api/auth/request/Forgot_Password_Request.dart';
import '../api/auth/request/Request.dart';
import '../api/auth/request/Reset Password.dart';
import '../api/auth/request/Verify_Reset_password.dart';
import '../api/auth/request/sign_in_request.dart';
import '../api/auth/response/sign_in_response.dart';
import '../domin/auth/use_case/ForgotPasswordUseCase.dart';
import '../domin/home/UsaCase/Get_subjects_Use_Case.dart';
import '../domin/auth/use_case/ResetPasswordUseCase.dart';
import '../domin/auth/use_case/SignInUseCase.dart';
import '../domin/auth/use_case/SignUp_UsaCase.dart';
import '../domin/auth/use_case/VerifyResetCodeUseCase.dart';
import '../domin/home/model/Get_subjects_model.dart';
@injectable
class Viwe_Model extends Cubit<Viwe_State> {
  final SignUp_UsaCase _case;
  final SignInUseCase _signInUseCase;
  final Get_subject_Use_Case _get_subject_use_case;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;

  Viwe_Model(
      this._case,
      this._signInUseCase,
      this._get_subject_use_case,
      this._forgotPasswordUseCase,
      this._verifyResetCodeUseCase,
      this._resetPasswordUseCase,
      this._getUserInfoUseCase
      ) : super(Viwe_State.initial());

  Future<dynamic> doAction(doIntantAction action) async {
    if (action is signUPData) {
      return _signUp(action.request);
    } else if (action is signIngData) {
      return _signIn(action.request);
    } else if (action is Getsubjects) {
      return _Get_subjects_Data(action.token);
    } else if (action is ForgotPasswordAction) {
      return _forgotPasswordSendCode(action.request);
    } else if (action is VerifyResetCodeAction) {
      return _verifyResetCode(action.request);
    } else if (action is ResetPasswordAction) {
      return _resetPassword(action.request);
    }else if (action is GetUserInfoAction) {
      return _getUserInfo(action.token);
    }
  }

  Future<Sign_in_response> _signIn(SignInRequest request) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try {
      final response = await _signInUseCase.signIn(request);
      emit(state.copyWith(isLoading: false, sucsses: "SignIn success"));
      return response;
    } catch (error) {
      emit(state.copyWith(isLoading: false, errormasssege: error.toString()));
      rethrow;
    }
  }

  Future<void> _signUp(SignUpRequest request) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try {
      await _case.signUp(request);
      emit(state.copyWith(isLoading: false, sucsses: "SignUp success"));
    } catch (error) {
      emit(state.copyWith(isLoading: false, errormasssege: error.toString()));
    }
  }

  Future<void> _Get_subjects_Data(String token) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try {
      List<subject> subjects = await _get_subject_use_case.Get_subjects_Data(token);
      emit(state.copyWith(isLoading: false, sucsses: "sucsses", subjects: subjects));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
    }
  }

  Future<void> _forgotPasswordSendCode(ForgotPasswordRequest request) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try {
      await _forgotPasswordUseCase.forgotPasswordSendCode(request);
      emit(state.copyWith(isLoading: false, sucsses: "ForgotPassword success"));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
    }
  }

  Future<void> _verifyResetCode(Verify_reset_password request) async {
    print("Start verifying code...");
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try {
      await _verifyResetCodeUseCase.verifyResetCode(request);
      print("Verification successful");
      emit(state.copyWith(isLoading: false, sucsses: "verify success"));
    } catch (e) {
      print("Verification failed: $e");
      emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
    }
  }


  Future<void> _resetPassword(Reset_Password request) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try {
      await _resetPasswordUseCase.resetPassword(request);
      emit(state.copyWith(isLoading: false, sucsses: "Password reset"));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
    }
  }

  Future<UserInfoResponse> _getUserInfo(String token) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try {
      final response = await _getUserInfoUseCase.execute(token);
      emit(state.copyWith(isLoading: false, sucsses: "User info retrieved successfully"));
      return response;
    } catch (error) {
      emit(state.copyWith(isLoading: false, errormasssege: error.toString()));
      rethrow;
    }
  }
}

sealed class doIntantAction {}
class signUPData extends doIntantAction {
  final SignUpRequest request;
  signUPData(this.request);
}

class signIngData extends doIntantAction {
  final SignInRequest request;
  signIngData(this.request);
}

class Getsubjects extends doIntantAction {
  final String token;
  Getsubjects(this.token);
}

class ForgotPasswordAction extends doIntantAction {
  final ForgotPasswordRequest request;
  ForgotPasswordAction(this.request);
}

class VerifyResetCodeAction extends doIntantAction {
  final Verify_reset_password request;
  VerifyResetCodeAction(this.request);
}

class ResetPasswordAction extends doIntantAction {
  final Reset_Password request;
  ResetPasswordAction(this.request);
}
class GetUserInfoAction extends doIntantAction {
  final String token;
  GetUserInfoAction(this.token);
}

class Viwe_State {
  final bool isLoading;
  final String? sucsses;
  final String? errormasssege;
  final List<subject> subjects;

  Viwe_State({
    this.sucsses,
    this.errormasssege,
    required this.subjects,
    required this.isLoading,
  });

  Viwe_State copyWith({
    bool? isLoading,
    String? sucsses,
    String? errormasssege,
    List<subject>? subjects,
  }) {
    return Viwe_State(
      isLoading: isLoading ?? this.isLoading,
      sucsses: sucsses ?? this.sucsses,
      errormasssege: errormasssege ?? this.errormasssege,
      subjects: subjects ?? this.subjects,
    );
  }

  factory Viwe_State.initial() {
    return Viwe_State(
      isLoading: false,
      sucsses: null,
      errormasssege: null,
      subjects: [],
    );
  }
}






















/// Future<void> forgotPasswordSendCode(ForgotPasswordRequest request) async {
//      emit(state.copyWith(isLoading: true));
//      try {
//        await _forgotPasswordUseCase.forgotPasswordSendCode(request);
//        emit(state.copyWith(isLoading: false, sucsses: "forgotPassword success", errormasssege: "some thing wrong"));
//      } catch (e) {
//        emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
//      }
//    }
//    Future<void> verifyResetCode(Verify_reset_password request) async {
//      emit(state.copyWith(isLoading: true));
//      try {
//        await _verifyResetCodeUseCase.verifyResetCode(request);
//        emit(state.copyWith(isLoading: false, sucsses: "Code verified"));
//      } catch (e) {
//        emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
//      }
//    }
//    Future<void> resetPassword(Reset_Password request) async {
//      emit(state.copyWith(isLoading: true));
//      try {
//        await _resetPasswordUseCase.resetPassword(request);
//        emit(state.copyWith(isLoading: false, sucsses: "Password reset"));
//      } catch (e) {
//        emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
//      }
//    }






