import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../model/Get_Exams_by_Id_subject_model.dart';
import '../repositries/Get_Exams_by_Id_subject_Rpo.dart';
@injectable
class Get_Exams_by_Id_subject_UseCse{
  final Get_Exams_by_Id_subject_Rpo _get_exams_by_id_subject_rpo;
  Get_Exams_by_Id_subject_UseCse(this._get_exams_by_id_subject_rpo);
  @override
  Future<Result<List<Get_Exams_by_Id_subject_model>>> getExams(String subject, String token) {
    return _get_exams_by_id_subject_rpo.getExams(subject, token);
  }
}