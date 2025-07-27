import '../model/Get_subjects_model.dart';

abstract class Get_subjects_Rpo{
  Future<List<subject>> Get_subjects_Data(String token);
}