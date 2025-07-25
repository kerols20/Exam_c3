import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../api/Request/Request.dart';
import '../api/Request/sign_in_request.dart';
import '../api/response/sign_in_response.dart';
import '../domin/UsaCase/Get_subjects_Use_Case.dart';
import '../domin/UsaCase/SignInUseCase.dart';
import '../domin/UsaCase/SignUp_UsaCase.dart';
import '../domin/model/Get_subjects_model.dart';
@injectable
class Viwe_Model extends Cubit<Viwe_State> {
  SignUp_UsaCase _case;
  SignInUseCase _signInUseCase;
  Get_subject_Use_Case _get_subject_use_case;

  Viwe_Model(this._case, this._signInUseCase, this._get_subject_use_case)
      :super(Viwe_State.initial());

  Future<dynamic> doAction(doIntantAction Action)async {
    if (Action is signUPData) {
      return _signUp(Action.request);
    } else if (Action is signIngData) {
      return _signIn(Action.request);
    } else if (Action is Getsubjects) {
      return _Get_subjects_Data(Action.token);
    }
  }

  Future<Sign_in_response> _signIn(SignInRequest request) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try {
     final respons =  await _signInUseCase.signIn(request);
      emit(state.copyWith(isLoading: false, sucsses: "SignIn success"));
      return respons;
    } catch (error) {
      emit(state.copyWith(isLoading: false, errormasssege: error.toString()));
      rethrow;
    }
  }
  Future<void> _signUp(SignUpRequest request)async{
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
   try{
     await _case.signUp(request);
     emit(state.copyWith(isLoading: false, sucsses: "SignUp success"));
   } catch (error){
     emit(state.copyWith(isLoading: false,errormasssege: error.toString()));
   }
  }
  Future<void> _Get_subjects_Data(String token) async {
    emit(state.copyWith(isLoading: true ,sucsses: null, errormasssege: null));
    try {
      List<subject> subjects = await _get_subject_use_case.Get_subjects_Data(token);
      emit(state.copyWith( isLoading: false,sucsses: "sucsses", errormasssege: null, subjects: subjects));
    } catch (e) {
      emit(state.copyWith(isLoading: false ,sucsses: null, errormasssege: e.toString()));
    }
  }
}

sealed class doIntantAction{}
class signUPData extends doIntantAction{
  final SignUpRequest request;
  signUPData(this.request);
}
class signIngData extends doIntantAction{
  final SignInRequest request;
  signIngData(this.request);
}
class Getsubjects extends doIntantAction{
  final String token;
  Getsubjects(this.token);
}

class Viwe_State{
  final bool isLoading;
  final String? sucsses;
  final String? errormasssege;
  final List <subject> subjects;
  Viwe_State({this.sucsses,this.errormasssege,required this.subjects, required this.isLoading});
  Viwe_State copyWith({
    bool? isLoading,
    String? sucsses,
    String? errormasssege,
    List<subject>? subjects,
  }) {
    return Viwe_State(
      isLoading:  isLoading ?? this.isLoading,
      sucsses: sucsses ?? this.sucsses,
      errormasssege: errormasssege ?? this.errormasssege,
      subjects: subjects ?? this.subjects,
    );
  }
  factory Viwe_State.initial(){
    return Viwe_State(subjects: [], sucsses: null, errormasssege: null, isLoading: false);
  }
}




























