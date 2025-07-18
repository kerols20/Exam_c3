import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/Routs/App_Routs_names.dart';
import 'core/Routs/App_Routs_page.dart';
import 'di/di.dart';

void main() {
  configureDependencies();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
        initialRoute: App_Routs_names.signInScreen,
        onGenerateRoute: App_Routs_page.route,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.interTextTheme(),
        ),
      );
    }
    );
  }
}
