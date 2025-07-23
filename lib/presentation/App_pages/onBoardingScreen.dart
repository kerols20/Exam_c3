import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'Profile.dart';
import 'Result_page.dart';
class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<onBoardingScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pending_actions),
            label: "Result",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "profile",
          ),
        ],
      ),
    );
  }
  List<Widget> _pages = [
    Home_Page(),
    ResultPage(),
    Profile_page(),
  ];
}
