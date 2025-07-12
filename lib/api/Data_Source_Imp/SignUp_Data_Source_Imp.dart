import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/Request/Request.dart';

import '../../Data/Data_Source/SignUp_Data_Source.dart';
import '../api_clint/Api_Clint.dart';
@Injectable(as:SignUpDataSource)
class SidnUp_Data_Source_Imp implements SignUpDataSource{
  ApiClient _apiClient;
  SidnUp_Data_Source_Imp(this._apiClient);
  @override
  Future<void> signUp(SignUpRequest request) {
    return _apiClient.signUp(request);
  }
}