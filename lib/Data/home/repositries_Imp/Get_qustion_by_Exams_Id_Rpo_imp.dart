import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/model/Get_qustion_by_Exam_Id_model.dart';

import '../../../domin/home/repositries/Get_qustion_by_Exams_Id_Rpo.dart';
import '../Data_Source/Get_qustion_by_Exams_Data_source.dart';
@Injectable(as: Get_qustion_by_Exams_Id_Rpo)
class Get_qustion_by_Exams_Id_Rpo_imp implements Get_qustion_by_Exams_Id_Rpo{
  final Get_qustion_by_Exams_Data_source _source;
  Get_qustion_by_Exams_Id_Rpo_imp(this._source);
  @override
  Future<Result<List<Get_qustion_by_Exam_Id_model>>> Get_qustion(String token, String exam) {
    return _source.Get_qustion(token, exam);
  }
}