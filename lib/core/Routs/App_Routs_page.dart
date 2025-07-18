import 'package:flutter/material.dart';
import 'package:project_one_c3_team/presentation/views/auth/sign_in_view.dart';
import '../../presentation/views/auth/sign_up_view.dart';
import 'App_Routs_names.dart';

interface class App_Routs_page {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case App_Routs_names.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case App_Routs_names.signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInView());  

      default:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
    }
  }
}
