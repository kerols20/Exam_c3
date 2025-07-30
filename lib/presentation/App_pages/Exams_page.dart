import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../di/di.dart';
import '../../viweModel/Home_viwe_model/Home_viwe_model.dart';
import 'Qustions_page.dart';

class ExamsPage extends StatefulWidget {
  String subject;
   ExamsPage({super.key, required this.subject,});

  @override
  State<ExamsPage> createState() => _ExamsPageState();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
}

class _ExamsPageState extends State<ExamsPage> {
  late Home_viwe_model _home_viwe_model;
  @override
  void initState() {
    super.initState();
    _home_viwe_model = getIt<Home_viwe_model>();
    _loding_data();
  }
  Future<void> _loding_data() async {
    final token = await widget.secureStorage.read(key: "token");
    if (token != null && token.isNotEmpty) {
      try {
        final action = Get_Exams_by_Id_subject(widget.subject, token);
        await _home_viwe_model.doAction(action);
      }
      catch (e) {
        print('Unexpected error: $e');
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exams"),
      ),
      body: BlocConsumer<Home_viwe_model, Home_viwe_model_status>(
        bloc: _home_viwe_model,
        listener: (BuildContext context, Home_viwe_model_status state) {
          if (state.sucsses == "sucsses") {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.sucsses!),
                  backgroundColor: Colors.green,)
            );}
          else if (state.errormasssege != null) {
            print("Error message from state: ${state.errormasssege}");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errormasssege!),
                  backgroundColor: Colors.red,)
            );}
        },
        builder: (BuildContext context, Home_viwe_model_status state) {
          if (state.exams != null && state.exams!.isNotEmpty) {
            return ListView.builder(
                itemCount: state.exams.length,
                itemBuilder: (context, index) {
                  final exam = state.exams[index];
                  return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(exam.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text("Duration: ${exam.duration} minutes"),
                          SizedBox(height: 8),
                          Text("Number of Questions: ${exam.numberOfQuestions}"),
                          SizedBox(height: 8),
                          Text("Active: ${exam.active ? "Yes" : "No"}"),
                          SizedBox(height: 8),
                          Text("Created At: ${exam.createdAt}"),
                          SizedBox(height: 8),
                          ElevatedButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StyledQuestionsPage(
                              examId: exam.id,
                            ),));
                          }, child: Text("Start Exam", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),))
                        ],
                      )
                  );
                }

            );
            } else if (state.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("No Data to Show"));
          }
        }
      )
    );
  }
}

