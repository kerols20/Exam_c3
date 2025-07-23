import '../repositries/Get_subjects_Rpositeries.dart';

class Get_subject_Use_Case{
  Get_subjects_Rpo _get_subjects_rpo;
  Get_subject_Use_Case(this._get_subjects_rpo);
  @override
  Future<void> Get_subjects_Data(String token) {
    return _get_subjects_rpo.Get_subjects_Data(token);
  }
}