import '../../../domin/home/model/Get_Exams_by_Id_subject_model.dart';

 abstract class Get_Exams_by_Id_subject_Data_source {
  Future<List<Get_Exams_by_Id_subject_model>> getExams(String subject, String token);
}