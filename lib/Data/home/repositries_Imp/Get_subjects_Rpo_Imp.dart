import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/home/model/Get_subjects_model.dart';

import '../../../domin/home/repositries/Get_subjects_Rpositeries.dart';
import '../Data_Source/Get_subjects_Data_Source.dart';
@Injectable(as:Get_subjects_Rpo)
class Get_subjects_Rpo_Imp implements Get_subjects_Rpo{
  final Get_subjects_Data_Source _get_subjects_data_source;
  Get_subjects_Rpo_Imp(this._get_subjects_data_source);
  @override
  Future<Result<List<subject>>> Get_subjects_Data(String token) {
    return _get_subjects_data_source.Get_subjects_Data(token);
  }
}