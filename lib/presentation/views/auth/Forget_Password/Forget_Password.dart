import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/api/Request/sign_in_request.dart';
import 'package:project_one_c3_team/core/Routs/App_Routs_names.dart';
import 'package:project_one_c3_team/di/di.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';
import 'package:dio/dio.dart';
import 'package:project_one_c3_team/viweModel/viweModel.dart';

import '../../../../api/Request/ForgotPasswordRequest.dart';
import '../../../../api/response/sign_in_response.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool isValid = false;
  final ViewModel _viewModel = getIt.get<ViewModel>();

  final emailController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              "Password",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Text(
            "Forget Password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            "Please enter your email associated to your account ",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomFormField(
                    controller: emailController,
                    labelText: "Email",
                    hintText: "Enter your email",
                    validator: (val) => val == null || val.isEmpty
                        ? 'Required'
                        : !RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(val)
                        ? 'Invalid email'
                        : null,
                    onChanged: (_) => _updateFormValidity(),
                  ),


                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isValid ? _onSignUpPressed : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isValid ? Colors.blue : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateFormValidity() {
    setState(() {
      isValid = _formKey.currentState?.validate() ?? false;
    });
  }

  void _onSignUpPressed() async {
    if (!_formKey.currentState!.validate()) return;
    final request =   ForgotPasswordRequest(
      email: emailController.text.trim(),
    );
    try {
       await _viewModel.forgotPasswordSendCode(request);

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Sign in successful,")));
      // Navigator.pushNamed(context, App_Routs_names.homeScreen);
    } catch (error) {
      if (error is DioException) {
        print("❌ Dio Error: ${error.response?.data}");
        print("📦 Request: ${error.requestOptions.data}");
        print("📤 Headers: ${error.requestOptions.headers}");
      } else {
        print("⚠️ Unknown Error: $error");
      }
    }
  }
}
