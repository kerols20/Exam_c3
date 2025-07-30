import '../model/Get_qustion_by_Exam_Id_model.dart';

abstract class Get_qustion_by_Exams_Id_Rpo{
  Future<List<Get_qustion_by_Exam_Id_model>> Get_qustion (String token, String exam);
}