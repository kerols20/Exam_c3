import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../model/Get_qustion_by_Exam_Id_model.dart';
import '../repositries/Get_qustion_by_Exams_Id_Rpo.dart';
@injectable
class Get_Exams_by_Id_Usecase{
  final Get_qustion_by_Exams_Id_Rpo _rpo;
  Get_Exams_by_Id_Usecase(this._rpo);
  Future<Result<List<Get_qustion_by_Exam_Id_model>>> Get_qustion(String token, String exam){
    return _rpo.Get_qustion(token, exam);
  }
}