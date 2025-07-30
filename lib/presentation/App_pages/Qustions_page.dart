import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../di/di.dart';
import '../../viweModel/Home_viwe_model/Home_viwe_model.dart';

class StyledQuestionsPage extends StatefulWidget {
  final String examId;
  StyledQuestionsPage({super.key, required this.examId});

  @override
  State<StyledQuestionsPage> createState() => _StyledQuestionsPageState();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
}

class _StyledQuestionsPageState extends State<StyledQuestionsPage> {
  late Home_viwe_model _home_viwe_model;

  @override
  void initState() {
    super.initState();
    _home_viwe_model = getIt<Home_viwe_model>();
    _loadData();
  }

  Future<void> _loadData() async {
    final token = await widget.secureStorage.read(key: "token");
    if (token != null && token.isNotEmpty) {
      try {
        final action = Get_qustion_by_Exams_Id(token, widget.examId);
        await _home_viwe_model.doAction(action);
      } catch (e) {
        print('Unexpected error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Questions")),
      body: BlocConsumer<Home_viwe_model, Home_viwe_model_status>(
        bloc: _home_viwe_model,
        listener: (context, state) {
          if (state.sucsses == "sucsses") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Done"),
              backgroundColor: Colors.green,
            ));
          } else if (state.errormasssege != null) {
            print(" count : ${state.qustion.length}");
            if (state.qustion.isNotEmpty) {
              print(" first question  : ${state.qustion[0].qustion}");
            }
          }
        },
          builder: (context, state) {
            if (state.qustion != null && state.qustion!.isNotEmpty) {
              return ListView.builder(
                itemCount: state.qustion!.length,
                itemBuilder: (context, index) {
                  final q = state.qustion![index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.shade300)],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          q.qustion,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        ...q.Answer.map((answer) => _buildAnswerOption(answer)).toList(),
                      ],
                    ),
                  );
                },
              );
            } else if (state.isLoading == true) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text("No Data to Show "));
            }
          }

      ),
    );
  }
  Widget _buildAnswerOption(String answerText) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        answerText,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
