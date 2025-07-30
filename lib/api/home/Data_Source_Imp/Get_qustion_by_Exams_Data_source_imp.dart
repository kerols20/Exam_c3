import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/domin/home/model/Get_qustion_by_Exam_Id_model.dart';

import '../../../Data/home/Data_Source/Get_qustion_by_Exams_Data_source.dart';
import '../../api_clint/Api_Clint.dart';
@Injectable(as: Get_qustion_by_Exams_Data_source)
class Get_qustion_by_Exams_Data_source_imp implements Get_qustion_by_Exams_Data_source{
  ApiClient _client;
  Get_qustion_by_Exams_Data_source_imp(this._client);

  @override
  Future<List<Get_qustion_by_Exam_Id_model>> Get_qustion(String token, String exam)async {
    var response = await _client.Get_qustion_by_Exam(token, exam);
    return response.questions?.map((e) => e.toModel()).toList() ?? [];
  }
  }