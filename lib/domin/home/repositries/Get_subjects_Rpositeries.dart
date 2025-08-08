import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../model/Get_subjects_model.dart';

abstract class Get_subjects_Rpo{
  Future<Result<List<subject>>> Get_subjects_Data(String token);
}