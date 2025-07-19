import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/Request/ForgotPasswordRequest.dart';
import 'package:project_one_c3_team/api/Request/sign_in_request.dart';
import 'package:project_one_c3_team/domin/UsaCase/ForgotPasswordUseCase.dart';
import 'package:project_one_c3_team/domin/UsaCase/SignInUseCase.dart';

import '../api/Request/Request.dart';
import '../api/response/sign_in_response.dart';
import '../domin/UsaCase/SignUp_UsaCase.dart';

@injectable
class ViewModel {
  SignUp_UsaCase _case;
  ForgotPasswordUseCase _forgotPasswordUseCase;
  SignInUseCase _signInUseCase;
  ViewModel(this._case, this._signInUseCase, this._forgotPasswordUseCase);
  Future<void> signUp(SignUpRequest request) {
    return _case.signUp(request);
  }

  Future<void> forgotPasswordSendCode(ForgotPasswordRequest request) {
    return _forgotPasswordUseCase.forgotPasswordSendCode(request);
  }

  Future<Sign_in_response> signIn(SignInRequest request) {
    return _signInUseCase.signIn(request);
  }
}
