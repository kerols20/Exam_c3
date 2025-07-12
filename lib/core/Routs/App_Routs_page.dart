import 'package:flutter/material.dart';
import '../../singUp/signup.dart';
import 'App_Routs_names.dart';

interface class App_Routs_page {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case App_Routs_names.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      default:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
    }
  }
}
