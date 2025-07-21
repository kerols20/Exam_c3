import 'package:flutter/material.dart';
import 'package:project_one_c3_team/presentation/views/auth/Forget_Password/email_verification.dart';
import 'package:project_one_c3_team/presentation/views/auth/sign_in_view.dart';
import '../../presentation/Home_Screen/Home_screen.dart';
import '../../presentation/views/auth/Forget_Password/Forget_Password.dart';
import '../../presentation/views/auth/Forget_Password/reset_password_screen.dart';
import '../../presentation/views/auth/sign_up_view.dart';
import 'App_Routs_names.dart';

interface class App_Routs_page {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case App_Routs_names.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case App_Routs_names.signInScreen:
        return MaterialPageRoute(builder: (context) => SignInView());
      case App_Routs_names.homeScreen:
        return MaterialPageRoute(builder: (context) => Home_Screen());
      case App_Routs_names.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      case App_Routs_names.emailVerificationScreen:
        return MaterialPageRoute(builder: (context) => EmailVerification());
        case App_Routs_names.resetPasswordScreen:
        return MaterialPageRoute(builder: (context) => ResetPasswordScreen());

      default:
        return MaterialPageRoute(builder: (context) => SignInView());
    }
  }
}
