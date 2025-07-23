import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/api/Request/sign_in_request.dart';
import 'package:project_one_c3_team/core/Routs/App_Routs_names.dart';
import 'package:project_one_c3_team/di/di.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';
import 'package:dio/dio.dart';
import 'package:project_one_c3_team/viweModel/viweModel.dart';
import '../../../api/response/sign_in_response.dart';

class SignInView extends StatefulWidget {
   SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
}

class _SignInViewState extends State<SignInView> {
  bool _checkToken = true;
  @override
  void initState() {
    super.initState();
    _checkingToken();
  }
  Future<void> _checkingToken() async {
    final token = await widget.secureStorage.read(key: "token");

    if (token != null) {
      if (!mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          App_Routs_names.homeScreen,
              (route) => false,
        );
      });
    } else {
      if (!mounted) return;
      setState(() {
        _checkToken = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool isValid = false;
  final ViewModel _viewModel =getIt.get<ViewModel>();
  bool rememberMe = false;


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;


  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (_checkToken) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            /// not used there is no page before
            // IconButton(
            //   icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            //   onPressed: () => Navigator.pop(context),
            // ),
            const Text(
              "Login",
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
      body: Form(
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
                    : !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)
                    ? 'Invalid email'
                    : null,
                onChanged: (_) => _updateFormValidity(),
              ),
              CustomFormField(
                controller: passwordController,
                labelText: "password",
                isPassword: true,
                suffixIcon: Icons.visibility,
                hintText: "Enter your password",

                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
                onChanged: (_) => _updateFormValidity(),
              ),
            Row(
              children: [
                Text("Remember me"),
                Checkbox(value: rememberMe, onChanged: (value) {
                  setState(() {
                    rememberMe = value ?? false;
                  });
                },),
                Spacer(),
                Text('Forget password?',
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),),
              ],
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
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              ),
              const SizedBox(height: 20),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                text: TextSpan(
                  children: [
                  const TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    ),
                  ),
                  WidgetSpan(
                    child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, App_Routs_names.signUpScreen);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 6), // Remove padding
                      minimumSize: Size(0, 0), // Remove minimum size
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                      color: Color(0xFF02369C),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF02369C),
                      ),
                    ),
                    ),
                  ),
                  ],
                ),
                ),
              ],
              ),
            ],
          ),
        ),
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
    final request = SignInRequest(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
    );
    try {
      Sign_in_response response  =  await _viewModel.signIn(request);
      if(rememberMe)
        {
          await widget.secureStorage.write(key: "token", value: response.token);
          await widget.secureStorage.write(key: "user", value: "${response.user?.firstName}");
        }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign in successful,")),
      );
      Navigator.pushNamed(context, App_Routs_names.homeScreen);
    } catch (error) {
      if (error is DioException) {
        print("❌ Dio Error: ${error.response?.data}");
        print("📦 Request: ${error.requestOptions.data}");
        print("📤 Headers: ${error.requestOptions.headers}");
      } else {
        // print("⚠️ Unknown Error: $error");
      }
    }
  }
}
