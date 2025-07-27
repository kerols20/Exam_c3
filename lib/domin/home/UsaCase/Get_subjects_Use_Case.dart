import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/domin/home/model/Get_subjects_model.dart';

import '../repositries/Get_subjects_Rpositeries.dart';
@injectable
class Get_subject_Use_Case{
  Get_subjects_Rpo _get_subjects_rpo;
  Get_subject_Use_Case(this._get_subjects_rpo);
  @override
  Future<List<subject>> Get_subjects_Data(String token) {
    return _get_subjects_rpo.Get_subjects_Data(token);
  }
}