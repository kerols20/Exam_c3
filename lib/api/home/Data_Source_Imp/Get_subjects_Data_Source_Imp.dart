import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/domin/home/model/Get_subjects_model.dart';

import '../../../Data/home/Data_Source/Get_subjects_Data_Source.dart';
import '../../api_clint/Api_Clint.dart';
@Injectable(as:Get_subjects_Data_Source)
class Get_subjects_Data_Source_Imp implements Get_subjects_Data_Source{
  ApiClient _client;
  Get_subjects_Data_Source_Imp(this._client);
  @override
  Future<List<subject>> Get_subjects_Data(String token)async {
    var response = await _client.Get_subjects(token);
   return response.subjects?.map((e) => e.toSubject()).toList() ?? [];
  }
}