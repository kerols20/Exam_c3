import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../domin/home/model/Get_Exams_by_Id_subject_model.dart';

 abstract class Get_Exams_by_Id_subject_Data_source {
  Future<Result<List<Get_Exams_by_Id_subject_model>>> getExams(String subject, String token);
}