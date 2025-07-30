import 'package:injectable/injectable.dart';

import '../model/Get_qustion_by_Exam_Id_model.dart';
import '../repositries/Get_qustion_by_Exams_Id_Rpo.dart';
@injectable
class Get_Exams_by_Id_Usecase{
  Get_qustion_by_Exams_Id_Rpo _rpo;
  Get_Exams_by_Id_Usecase(this._rpo);
  Future<List<Get_qustion_by_Exam_Id_model>> Get_qustion(String token, String exam){
    return _rpo.Get_qustion(token, exam);
  }
}