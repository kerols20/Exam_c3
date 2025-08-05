import 'package:flutter/material.dart';

import 'package:project_one_c3_team/presentation/views/auth/sign_in_view.dart';
import '../../presentation/App_pages/onBoardingScreen.dart';
import '../../presentation/views/auth/Forget_Password.dart';
import '../../presentation/views/auth/VerifyResetCode.dart';
import '../../presentation/views/auth/reset_password_screen.dart';
import '../../presentation/views/auth/sign_up_view.dart';
import 'App_Routs_names.dart';
import '../../presentation/App_pages/change_password_page.dart';

interface class App_Routs_page {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case App_Routs_names.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case App_Routs_names.signInScreen:
        return MaterialPageRoute(builder: (context) => SignInView());
      case App_Routs_names.homeScreen:
        return MaterialPageRoute(builder: (context) =>  onBoardingScreen());
        case App_Routs_names.resetPasswordScreen:
          return MaterialPageRoute(builder: (context) => ResetPasswordScreen());
          case App_Routs_names.forgetPasswordScreen:
            return MaterialPageRoute(builder: (context) => ForgetPassword());
            case App_Routs_names.verifyCodeScreen:
              return MaterialPageRoute(builder: (context) => EmailVerification());
              case App_Routs_names.changePasswordPage:
                return MaterialPageRoute(builder: (context) => ChangePasswordPage());
      default:
        return MaterialPageRoute(builder: (context) => SignInView());
    }
  }
}
