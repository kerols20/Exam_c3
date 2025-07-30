import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domin/home/UsaCase/Get_Exams_by_Id_Usecase.dart';
import '../../domin/home/UsaCase/Get_Exams_by_Id_subject_UseCse.dart';
import '../../domin/home/UsaCase/Get_subjects_Use_Case.dart';
import '../../domin/home/model/Get_Exams_by_Id_subject_model.dart';
import '../../domin/home/model/Get_qustion_by_Exam_Id_model.dart';
import '../../domin/home/model/Get_subjects_model.dart';
@injectable
class Home_viwe_model extends Cubit<Home_viwe_model_status>{
  Get_subject_Use_Case _get_subject_use_case;
  Get_Exams_by_Id_subject_UseCse _cse;
  Get_Exams_by_Id_Usecase _usecase;

  Home_viwe_model(this._get_subject_use_case, this._cse, this._usecase) : super(Home_viwe_model_status.initial());
  Future<void> doAction(doIntantAction action) async {
    if (action is Getsubjects) {
      return _Get_subjects_Data(action.token);
    }
    if (action is Get_Exams_by_Id_subject) {
      return _Get_Exams_by_Id_subject(action.subject, action.token);
    }
    if(action is Get_qustion_by_Exams_Id){
      return _getQuestions(action.token, action.exam);
    }
  }
  Future<void> _getQuestions(String token, String exam) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try {
      List<Get_qustion_by_Exam_Id_model> qustion = await _usecase.Get_qustion(token, exam);
      emit(state.copyWith(isLoading: false, sucsses: "sucsses", qustion: qustion));
    } catch (e) {
      print("Error $e");
      emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
    }
  }
  Future<void> _Get_subjects_Data(String token) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try{
      List<subject> subjects = await _get_subject_use_case.Get_subjects_Data(token);
      emit(state.copyWith(isLoading: false, sucsses: "sucsses", subjects: subjects));
    }catch(e){
      emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
    }
  }
  Future<void> _Get_Exams_by_Id_subject(String subject, String token) async {
    emit(state.copyWith(isLoading: true, sucsses: null, errormasssege: null));
    try{
      List<Get_Exams_by_Id_subject_model> exams = await _cse.getExams(subject, token);
      emit(state.copyWith(isLoading: false, sucsses: "sucsses", exams: exams));
    }catch(e){
      emit(state.copyWith(isLoading: false, errormasssege: e.toString()));
    }
  }
}

sealed class doIntantAction{}

class Getsubjects extends doIntantAction{
  final String token;
  Getsubjects(this.token);
}
class Get_Exams_by_Id_subject extends doIntantAction{
  final String subject;
  final String token;
  Get_Exams_by_Id_subject(this.subject, this.token);
}
class Get_qustion_by_Exams_Id extends doIntantAction{
  final String token;
  final String exam;
  Get_qustion_by_Exams_Id(this.token, this.exam);
}
class Home_viwe_model_status {
  final bool? isLoading;
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
    this.isLoading,
  });
  Home_viwe_model_status copyWith({
    bool? isLoading,
    String? sucsses,
    String? errormasssege,
    List<subject>? subjects,
    List<Get_Exams_by_Id_subject_model>? exams,
    List<Get_qustion_by_Exam_Id_model>? qustion,
  })
  {
    return Home_viwe_model_status(
      qustion: qustion ?? this.qustion,
      exams: exams ?? this.exams,
      isLoading: isLoading ?? this.isLoading,
      sucsses: sucsses ?? this.sucsses,
      errormasssege: errormasssege ?? this.errormasssege,
      subjects: subjects ?? this.subjects,
    );
  }
  factory Home_viwe_model_status.initial(){
    return Home_viwe_model_status(
      qustion: [],
      exams: [],
      isLoading: false,
      sucsses: null,
      errormasssege: null, subjects: [],);
  }
}




////testsam@gmail.com
/// !@$##E#Rfrgg232r
