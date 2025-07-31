import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
   final List<Map<String, dynamic>> sections = [
    {
      'title': 'Language',
      'items': [
        {'title': 'High level', 'questions': 20, 'time': 30},
        {'title': 'High level', 'questions': 20, 'time': 30},
      ]
    },
    {
      'title': 'Math',
      'items': [
        {'title': 'Algebra', 'questions': 20, 'time': 30},
        {'title': 'Algebra', 'questions': 20, 'time': 30},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Results', style: TextStyle(color: Colors.black,
          fontSize: 24, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: sections.map((section) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  section['title'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...section['items'].map<Widget>((item) {
                  return ResultCard(
                    title: item['title'],
                    questions: item['questions'],
                    time: item['time'],
                  );
                }).toList(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String title;
  final int questions;
  final int time;

  const ResultCard({
    Key? key,
    required this.title,
    required this.questions,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use different image assets based on the title
    String iconAsset = title == 'Algebra'
      ? 'assets/results_icon_two.png'
      : 'assets/results_icon_one.png';

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image(image: AssetImage(iconAsset), width: 50, height: 50),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$questions Question'),
            SizedBox(height: 4),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '18 corrected answers in 25 min. ',
                      style: TextStyle(color: Color(0xFF02369C))),
                ],
              ),
            )
          ],
        ),
        trailing: Text('$time Minutes'),
      ),
    );
  }
}
    
