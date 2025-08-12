import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/model/Get_Exams_by_Id_subject_model.dart';

import '../../../domin/home/repositries/Get_Exams_by_Id_subject_Rpo.dart';
import '../Data_Source/Get_Exams_by_Id_subject_Data_source.dart';
@Injectable(as: Get_Exams_by_Id_subject_Rpo)
class Get_Exams_by_Id_subject_Rpo_Imp implements Get_Exams_by_Id_subject_Rpo{
  final Get_Exams_by_Id_subject_Data_source _get_exams_by_id_subject_data_source;
  Get_Exams_by_Id_subject_Rpo_Imp(this._get_exams_by_id_subject_data_source);
  @override
  Future<Result<List<Get_Exams_by_Id_subject_model>>> getExams(String subject, String token) {
    return _get_exams_by_id_subject_data_source.getExams(subject, token);
  }
}