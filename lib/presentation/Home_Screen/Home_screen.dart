import 'package:flutter/material.dart';
class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon:SizedBox(
              height: 40,
              width: 40,
              child: Image.asset("assets/icon-container.png"),
            ),
            label: "Settings",
          )
        ]
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
