import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Reset password",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Text(
              "Password must not be empty and must contain 6 characters with upper case letter and one number at least ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
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
                      controller: passwordController,
                      labelText: "New password",
                      hintText: "Enter your password",
                      isPassword: true,
                      suffixIcon: Icons.visibility,
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Required' : null,
                      onChanged: (_) => _updateFormValidity(),
                    ),
                    SizedBox(height: 20),
                    CustomFormField(
                      controller: confirmPasswordController,
                      labelText: "Confirm password",
                      hintText: "Enter your password",
                      isPassword: true,
                      suffixIcon: Icons.visibility,
                      validator: (val) {
                        if (val == null || val.isEmpty) return 'Required';
                        if (val != passwordController.text)
                          return 'Passwords do not match';
                        return null;
                      },

                      onChanged: (_) => _updateFormValidity(),
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isValid ? Colors.blue : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {},
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
      ),
    );
  }

  void _updateFormValidity() {
    setState(() {
      isValid = _formKey.currentState?.validate() ?? false;
    });
  }
}
