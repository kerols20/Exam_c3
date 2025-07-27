import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';
import 'package:project_one_c3_team/viweModel/viweModel.dart';
import 'package:project_one_c3_team/core/Routs/App_Routs_names.dart';
import 'package:project_one_c3_team/api/auth/request/Forgot_Password_Request.dart';
import 'package:project_one_c3_team/di/di.dart';

import '../../widget/Validators.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  bool isValid = false;
  late Viwe_Model _viweModel;

  @override
  void initState() {
    super.initState();
    _viweModel = getIt<Viwe_Model>();
  }

  void _updateFormValidity() {
    setState(() {
      isValid = _formKey.currentState?.validate() ?? false;
    });
  }

  void _onForgetPasswordPressed() async {
    if (!_formKey.currentState!.validate()) return;

    final request = ForgotPasswordRequest(email: emailController.text.trim());
    await secureStorage.write(key: 'email', value: request.email);

    try {
      await _viweModel.doAction(ForgotPasswordAction(request));
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Code sent to your email."),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(context, App_Routs_names.verifyCodeScreen);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to send code.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Viwe_Model, Viwe_State>(
      bloc: _viweModel,
      listener: (context, state) {
        if (state.sucsses == "sucsses") {
          // Navigator.pushReplacementNamed(context, App_Routs_names.signInScreen); xxxxxxxxxxxxxxxxxxxxxxxxxxxx
        }
        else if (state.errormasssege != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errormasssege!),
              backgroundColor: Colors.red,
            ));}
        else if (state.isLoading) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
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
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Forget Password",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Please enter your email associated to your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CustomFormField(
                        controller: emailController,
                        labelText: "Email",
                        hintText: "Enter your email",
                        validator: Validators.email,
                        onChanged: (_) => _updateFormValidity(),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isValid ? _onForgetPasswordPressed : null,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
