import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/model/Get_subjects_model.dart';

import '../../../Data/home/Data_Source/Get_subjects_Data_Source.dart';
import '../../api_clint/Api_Clint.dart';
@Injectable(as:Get_subjects_Data_Source)
class Get_subjects_Data_Source_Imp implements Get_subjects_Data_Source{
  ApiClient _client;
  Get_subjects_Data_Source_Imp(this._client);
  
  get errorHandler => null;
  @override
  Future<Result<List<subject>>> Get_subjects_Data(String token) async {
    try {
      var response = await _client.Get_subjects(token);
      final subjects = response.subjects?.map((e) => e.toSubject()).toList() ?? [];
      return Success(subjects);
    } catch (e) {
      return errorHandler.handleGetSubjectsError(e as Exception);
    }
  }
}