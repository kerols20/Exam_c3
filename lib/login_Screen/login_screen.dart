import 'package:flutter/material.dart';

import '../widget/custom_Button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscured = false;
  bool isVaild = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios_new, color: Colors.black),
            SizedBox(width: 8),
            Text(
              "Login",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  isVaild = _formKey.currentState!.validate();
                });
              },
              controller: emailController,
              labelText: "Email",
              hintText: "Enter your email",
              keyboardType: TextInputType.emailAddress,
            ), CustomFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  isVaild = _formKey.currentState!.validate();
                });
              },
              controller: passwordController,
              isPassword: true,
              suffixIcon: Icons.visibility,
              labelText: "password",
              hintText: "Enter your password",
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(

                  value: isObscured,
                  onChanged: (change) {
                    setState(() {
                      isObscured = change!;
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                  ),
                    onPressed: () {

                },
                    child: Text("Forgot password?",    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),))
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  bool formValid = _formKey.currentState!.validate();
                  setState(() {
                    isVaild = formValid;
                  });
                  if (formValid) {
                    print("Form is valid, proceed to login");
                  } else {
                    print("Form is NOT valid");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isVaild ? Colors.blue : Colors.grey,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't  have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    )
                )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
