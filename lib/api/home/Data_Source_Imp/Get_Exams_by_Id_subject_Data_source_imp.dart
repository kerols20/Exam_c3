import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/handlers/auth_error_handler.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/model/Get_Exams_by_Id_subject_model.dart';
import '../../../Data/home/Data_Source/Get_Exams_by_Id_subject_Data_source.dart';
import '../../api_clint/Api_Clint.dart';
@Injectable(as: Get_Exams_by_Id_subject_Data_source)
class Get_Exams_by_Id_subject_model_Data_Source_Imp implements Get_Exams_by_Id_subject_Data_source{
  ApiClient _apiClient;
  AuthErrorHandler errorHandler;
  Get_Exams_by_Id_subject_model_Data_Source_Imp(this._apiClient, this.errorHandler);


  @override
  Future<Result<List<Get_Exams_by_Id_subject_model>>> getExams(String subject, String token) async {
    try {
      var response = await _apiClient.Get_Exams(token, subject);
      final exams = response.exams?.map((e) => e.toModel()).toList() ?? [];
      return Success(exams);
    } catch (e) {
      return errorHandler.handle(e as Exception);
    }
  }
}