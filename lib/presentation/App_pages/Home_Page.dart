import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Home_Page extends StatefulWidget {
  Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
}
class _Home_PageState extends State<Home_Page> {
  late Future<String?> tokenFuture;
  @override
  void initState() {
    super.initState();
    _printToken();
  }
  void _printToken() async {
    String? token = await widget.secureStorage.read(key: "token");
    print("Token: $token");
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          //Text("token ${widget.secureStorage.read(key: "token")}")
        ],
      ),
    );
  }
}