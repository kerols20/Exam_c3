import 'package:flutter/material.dart';
import 'package:project_one_c3_team/presentation/views/auth/sign_in_view.dart';
import '../../presentation/App_pages/onBoardingScreen.dart';
import '../../presentation/views/auth/sign_up_view.dart';
import 'App_Routs_names.dart';

interface class App_Routs_page {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case App_Routs_names.signUpScreen:
        return MaterialPageRoute(builder: (context) =>  SignUpScreen());
      case App_Routs_names.signInScreen:
        return MaterialPageRoute(builder: (context) =>  SignInView());
      case App_Routs_names.homeScreen:
        return MaterialPageRoute(builder: (context) =>  onBoardingScreen());

      default:
        return MaterialPageRoute(builder: (context) =>  SignInView());
    }
  }
}
