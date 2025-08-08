import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/home/request/change_password_request.dart';
import 'package:project_one_c3_team/api/home/request/edit_profile_request.dart';
import 'package:project_one_c3_team/api/home/response/change_profile_password_response.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/UsaCase/change_password_use_case.dart';
import 'package:project_one_c3_team/domin/home/UsaCase/edit_profile_use_case.dart';
import 'package:project_one_c3_team/domin/home/UsaCase/get_user_info_use_case.dart';
import '../../domin/home/UsaCase/Get_Exams_by_Id_Usecase.dart';
import '../../domin/home/UsaCase/Get_Exams_by_Id_subject_UseCse.dart';
import '../../domin/home/UsaCase/Get_subjects_Use_Case.dart';
import '../../domin/home/model/Get_Exams_by_Id_subject_model.dart';
import '../../domin/home/model/Get_qustion_by_Exam_Id_model.dart';
import '../../domin/home/model/Get_subjects_model.dart';

@injectable
class Home_viwe_model extends Cubit<Home_viwe_model_status> {
  Get_subject_Use_Case _get_subject_use_case;
  Get_Exams_by_Id_subject_UseCse _cse;
  Get_Exams_by_Id_Usecase _usecase;
  GetUserInfoUseCase _getUserInfoUseCase;
  EditProfileUseCase _editProfileUseCase;
  ChangePasswordUseCase _changePasswordUseCase;

  Home_viwe_model(
    this._get_subject_use_case,
    this._cse,
    this._usecase,
    this._getUserInfoUseCase,
    this._editProfileUseCase,
    this._changePasswordUseCase,
  ) : super(Home_viwe_model_status.initial());
  Future<dynamic> doAction(doIntantAction action) async {
    if (action is Getsubjects) {
      return _Get_subjects_Data(action.token);
    }
    if (action is Get_Exams_by_Id_subject) {
      return _Get_Exams_by_Id_subject(action.subject, action.token);
    }
    if (action is Get_qustion_by_Exams_Id) {
      return _getQuestions(action.token, action.exam);
    }
    if (action is GetUserInfoAction) {
      return _getUserInfo(action.token);
    }
    if (action is EditPRofile) {
      return _editProfile(
        action.token,
        action.editProfileRequest.firstName ,
        action.editProfileRequest.lastName,
        action.editProfileRequest.phone,
        action.editProfileRequest.username,
        action.editProfileRequest.email,
      );
    }
    if (action is ChangePasswordAction) {
      return _changePassword(action.token, action.request);
    }
  }

  Future<void> _getQuestions(String token, String exam) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    final response = await _usecase.Get_qustion(token, exam);
    return response.fold(onSuccess: (qustion) {
      emit(state.copyWith(isLoading: false, sucsses: "sucsses", qustion: qustion));
    }, onFailure: (failure) {
      emit(state.copyWith(isLoading: false, errormasssege: failure.userFriendlyMessage));
  });
  }

  Future<void> _Get_subjects_Data(String token) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    final response = await _get_subject_use_case.Get_subjects_Data(token);
    return response.fold(onSuccess: (subject) {
      emit(state.copyWith(isLoading: false, sucsses: "sucsses", subjects: subject));
    }, onFailure: (failure) {
      emit(state.copyWith(isLoading: false, errormasssege: failure.userFriendlyMessage));
    });
  }

  Future<void> _Get_Exams_by_Id_subject(String subject, String token) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    final response = await _cse.getExams(subject, token);
    return response.fold(onSuccess: (Get_Exams_by_Id_subject) {
      emit(state.copyWith(isLoading: false, sucsses: "sucsses", exams: Get_Exams_by_Id_subject));
    }, onFailure: (failure) {
      emit(state.copyWith(isLoading: false, errormasssege: failure.userFriendlyMessage));
    },);
  }

  Future<UserInfoResponse> _getUserInfo(String token) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    final response = await _getUserInfoUseCase.execute(token);
    return response.fold(onSuccess: (data) {
      emit(state.copyWith(isLoading: false, sucsses: "sucsses"));
      return data;
    }, onFailure: (failure) {
      emit(state.copyWith(isLoading: false, errormasssege: failure.userFriendlyMessage));
      throw Exception(failure.userFriendlyMessage);
    },
    );
  }

  Future<Result<UserInfoResponse>> _editProfile(
      String token,
      String firstName,
      String lastName,
      String phone,
      String username,
      String email,
      ) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));

    try {
      final request = EditProfileRequest(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );

      final result = await _editProfileUseCase.editProfile(token, request);

      result.fold(
        onSuccess: (data) {
          emit(state.copyWith(isLoading: false, sucsses: data.message));
        },
        onFailure: (failure) {
          emit(state.copyWith(isLoading: false, errormasssege: failure.userFriendlyMessage));
        },
      );

      return result;
    } catch (error) {
      emit(state.copyWith(isLoading: false, errormasssege: error.toString()));
      rethrow;
    }
  }


  Future<ChangeProfilePasswordResponse> _changePassword(String token, ChangePasswordRequest request) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    final response = await _changePasswordUseCase.execute(token, request);
    return response.fold(onSuccess: (data) {
      emit(state.copyWith(isLoading: false, sucsses: data.message));
      return data;
    }, onFailure: (failure) {
      emit(state.copyWith(isLoading: false, errormasssege: failure.userFriendlyMessage));
      throw Exception(failure.userFriendlyMessage);
    },);
  }
}

sealed class doIntantAction {}

class Getsubjects extends doIntantAction {
  final String token;
  Getsubjects(this.token);
}

class Get_Exams_by_Id_subject extends doIntantAction {
  final String subject;
  final String token;
  Get_Exams_by_Id_subject(this.subject, this.token);
}

class Get_qustion_by_Exams_Id extends doIntantAction {
  final String token;
  final String exam;
  Get_qustion_by_Exams_Id(this.token, this.exam);
}

class GetUserInfoAction extends doIntantAction {
  final String token;
  GetUserInfoAction(this.token);
}

class EditPRofile extends doIntantAction{
  final String token;
  final EditProfileRequest editProfileRequest;

  EditPRofile({
    required this.token,
    required this.editProfileRequest,
  });
}

class ChangePasswordAction extends doIntantAction {
  final String token;
  final ChangePasswordRequest request;

  ChangePasswordAction({
    required this.token,
    required this.request,
  });
}

class Home_viwe_model_status {
  final bool isLoading;
  final String? sucsses;
  final String? errormasssege;
  final List<subject> subjects;
  final List<Get_Exams_by_Id_subject_model> exams;
  final List<Get_qustion_by_Exam_Id_model> qustion;

  Home_viwe_model_status({
    required this.qustion,
    required this.exams,
    this.sucsses,
    this.errormasssege,
    required this.subjects,
    required this.isLoading,
  });
  Home_viwe_model_status copyWith({
    bool? isLoading,
    String? sucsses,
    String? errormasssege,
    List<subject>? subjects,
    List<Get_Exams_by_Id_subject_model>? exams,
    List<Get_qustion_by_Exam_Id_model>? qustion,
  }) {
    return Home_viwe_model_status(
      qustion: qustion ?? this.qustion,
      exams: exams ?? this.exams,
      isLoading: isLoading ?? this.isLoading,
      sucsses: sucsses ?? this.sucsses,
      errormasssege: errormasssege ?? this.errormasssege,
      subjects: subjects ?? this.subjects,
    );
  }

  factory Home_viwe_model_status.initial() {
    return Home_viwe_model_status(
      qustion: [],
      exams: [],
      isLoading: false,
      sucsses: null,
      errormasssege: null,
      subjects: [],
    );
  }
}

///testsam@gmail.com
/// !@$##E#Rfrgg232r
/// d3ry237y132232XXS@@@