import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/core/Routs/App_Routs_names.dart'; // تأكد أن هذا يحتوي على اسم شاشة تسجيل الدخول

class Home_Screen extends StatelessWidget {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await secureStorage.delete(key: "token");
              await secureStorage.delete(key: "user");
              Navigator.pushNamedAndRemoveUntil(
                context,
                App_Routs_names.signInScreen,
                    (route) => false,
              );
            },
            child: Text("Log out"),
          ),
        ],
      ),
    );
  }
}
