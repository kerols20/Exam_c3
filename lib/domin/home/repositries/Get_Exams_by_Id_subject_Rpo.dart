import 'package:project_one_c3_team/domin/home/model/Get_Exams_by_Id_subject_model.dart';

abstract class Get_Exams_by_Id_subject_Rpo{
  Future<List<Get_Exams_by_Id_subject_model>> getExams(String subject, String token);
}