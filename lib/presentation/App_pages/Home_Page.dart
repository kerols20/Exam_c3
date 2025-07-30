import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/di/di.dart';
import 'package:project_one_c3_team/presentation/App_pages/Exams_page.dart';

import '../../viweModel/Home_viwe_model/Home_viwe_model.dart';
class Home_Page extends StatefulWidget {
  Home_Page({super.key});
  @override
  State<Home_Page> createState() => _Home_PageState();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
}
class _Home_PageState extends State<Home_Page> {
  late Home_viwe_model _home_viwe_model;
  @override
  void initState() {
    super.initState();
    _home_viwe_model = getIt<Home_viwe_model>();
    _loding_data();
  }
  Future <void> _loding_data() async {
    final token = await widget.secureStorage.read(key: "token");
    if (token != null && token.isNotEmpty) {
      final action = Getsubjects(token);
      await _home_viwe_model.doAction(action);
    }
  }
  Widget build(BuildContext context) {
    return BlocConsumer<Home_viwe_model, Home_viwe_model_status>(
      bloc: _home_viwe_model,
        listener: (context, state) {
          if (state.sucsses == "sucsses") {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.sucsses!),
                  backgroundColor: Colors.green,
                ));
          }
          else if (state.errormasssege != null) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errormasssege!),
                  backgroundColor: Colors.red,));
          }
        },
      builder: ( context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("servy"),
          ),
              body: Column(
                children: [
                  state.isLoading == true ?  Center(child: CircularProgressIndicator()) :
                      state.subjects.isEmpty ? Text("no data") :
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.subjects.length,
                          itemBuilder: (context, index) {
                          final subject = state.subjects[index];
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExamsPage(subject:
                                    subject.id,),));
                                  }, child: Text(subject.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                   ),
                                SizedBox(height: 8),
                                Image.network(subject.icon),
                                SizedBox(height: 8),
                              ],
                            ),
                          );
                        },
                        ),
                      )
                ],
              )
        );
      },);
  }
}



