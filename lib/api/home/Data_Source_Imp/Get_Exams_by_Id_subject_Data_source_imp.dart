import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/domin/home/model/Get_Exams_by_Id_subject_model.dart';
import '../../../Data/home/Data_Source/Get_Exams_by_Id_subject_Data_source.dart';
import '../../api_clint/Api_Clint.dart';
@Injectable(as: Get_Exams_by_Id_subject_Data_source)
class Get_Exams_by_Id_subject_model_Data_Source_Imp implements Get_Exams_by_Id_subject_Data_source{
  ApiClient _apiClient;
  Get_Exams_by_Id_subject_model_Data_Source_Imp(this._apiClient);
  @override
  Future<List<Get_Exams_by_Id_subject_model>> getExams(String subject, String token)async {
    var response = await _apiClient.Get_Exams(token, subject);
    return response.exams?.map((e) => e.toModel()).toList() ?? [];
  }
}