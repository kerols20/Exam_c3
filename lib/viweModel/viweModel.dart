import 'package:injectable/injectable.dart';

import '../api/Request/Request.dart';
import '../domin/UsaCase/SignUp_UsaCase.dart';

@injectable
class viewModel{
  SignUp_UsaCase _case;
  viewModel(this._case);
  Future<void> signUp(SignUpRequest request){
    return _case.signUp(request);
  }
}