import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/Routs/App_Routs_names.dart';



class Home_Page extends StatefulWidget {
  Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
}
class _Home_PageState extends State<Home_Page> {
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Text("survey",style: TextStyle(
              color: Colors.blue,
            ),)
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
           ElevatedButton(onPressed: () {
            widget.secureStorage.delete(key: "token");
            Navigator.pushNamedAndRemoveUntil(context, App_Routs_names.signInScreen, (route) => false);
          }, child: Text("log out")),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {
               /////
              }, child: Text("search", style: TextStyle(
              color: Colors.grey,
            ),),
            )
          )
        ],
      ),
    );
  }
}



