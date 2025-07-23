import 'package:project_one_c3_team/domin/model/Get_subjects_model.dart';

abstract class Get_subjects_Data_Source{
  Future<List<subject>> Get_subjects_Data(String token);
}