import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/domin/model/Get_subjects_model.dart';

import '../../domin/repositries/Get_subjects_Rpositeries.dart';
import '../Data_Source/Get_subjects_Data_Source.dart';
@Injectable(as:Get_subjects_Rpo)
class Get_subjects_Rpo_Imp implements Get_subjects_Rpo{
  Get_subjects_Data_Source _get_subjects_data_source;
  Get_subjects_Rpo_Imp(this._get_subjects_data_source);
  @override
  Future<List<subject>> Get_subjects_Data(String token) {
    return _get_subjects_data_source.Get_subjects_Data(token);
  }
}