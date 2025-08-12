import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/api/auth/request/sign_in_request.dart';
import 'package:project_one_c3_team/core/Routs/App_Routs_names.dart';
import 'package:project_one_c3_team/di/di.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';
import 'package:project_one_c3_team/viweModel/viweModel.dart';
import '../../../api/auth/response/sign_in_response.dart';
class SignInView extends StatefulWidget {
   SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
}

class _SignInViewState extends State<SignInView> {
  bool _checkToken = true;
  late Viwe_Model _viwe_model;

  @override
  void initState() {
    super.initState();
    _viwe_model = getIt<Viwe_Model>();
    _checkingToken();
  }

  Future<void> _checkingToken() async {
    final token = await widget.secureStorage.read(key: "token");
    print("📦 Token: $token");

    if (!mounted) return;
    if (token != null && token.isNotEmpty) {
      print("✅ Token exists. Navigating...");
      WidgetsBinding.instance.addPostFrameCallback((_) { // what is this?
        Navigator.pushNamedAndRemoveUntil(
          context,
          App_Routs_names.homeScreen,
              (route) => false,
        );
      });
    } else {
      print("❌ No token found");
      setState(() {
        _checkToken = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool isValid = false;
  bool rememberMe = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    if (_checkToken) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return BlocConsumer<Viwe_Model, Viwe_State>(
      bloc: _viwe_model,
      listener: (context, state) {
        if (state.sucsses == "SignIn success") {
          Navigator.pushReplacementNamed(context, App_Routs_names.homeScreen);
        } else if (state.errormasssege != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errormasssege!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
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
                            : !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(val)
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
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                               Navigator.pushNamed(
                                  context, App_Routs_names.forgetPasswordScreen);
                            },
                            child: Text(
                              'Forget password?',
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isValid && !state.isLoading
                              ? _onsignInpressd
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            isValid ? Colors.blue : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18),
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
                                      Navigator.pushNamed(
                                          context,
                                          App_Routs_names.signUpScreen);
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(left: 6),
                                      minimumSize: Size(0, 0),
                                      tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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
            ),
            if (state.isLoading)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }
  void _updateFormValidity() {
    setState(() {
      isValid = _formKey.currentState?.validate() ?? false;
    });
  }
  void _onsignInpressd() async {
    if (!_formKey.currentState!.validate()) return;

    final request = SignInRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    try {
      final response = await _viwe_model.doAction(signIngData(request)) as Sign_in_response;
      if (response.token != null && response.token!.isNotEmpty) {
        await widget.secureStorage.write(key: "token", value: response.token!);
        print("✅ Token saved: ${response.token}");
      } else {
        print("❌ No token received");
      }

    } catch (e, stackTrace) {
      print("❌ Sign in error: $e");
      print(stackTrace);
    }
  }

}


///miner@gmail.com
///3e22r3SSS#@@!!54
