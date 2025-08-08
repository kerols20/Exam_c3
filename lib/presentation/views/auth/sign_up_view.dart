import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';
import 'package:project_one_c3_team/di/di.dart';
import '../../../api/auth/request/SignUpRequest.dart';
import '../../../viweModel/viweModel.dart';
import '../../widget/Validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();
  late Viwe_Model _viewModel;
  

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<Viwe_Model>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Viwe_Model, Viwe_State>(
      bloc: _viewModel,
      listener: (context, state) {
        if (state.sucsses == "SignUp success") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("SignUp success"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
        else if (state.errormasssege != null) {
          print("Signup Error From BlocConsumer: ${state.errormasssege}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errormasssege!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
        builder: (context, state) {
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
                  const Text("Sign Up", style: TextStyle(color: Colors.black)),
                ],
              ),
              centerTitle: false,
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomFormField(
                      controller: usernameController,
                      labelText: "User Name",
                      hintText: "Enter your user name",
                       validator: Validators.name,
                      onChanged: (_) => _updateFormValidity(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                            controller: firstNameController,
                            labelText: "First Name",
                            hintText: "Enter your first name",
                            validator: Validators.name,
                            onChanged: (_) => _updateFormValidity(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomFormField(
                            controller: lastNameController,
                            labelText: "Last Name",
                            hintText: "Enter your last name",
                            validator: Validators.name,
                            onChanged: (_) => _updateFormValidity(),
                          ),
                        ),
                      ],
                    ),
                    CustomFormField(
                      controller: emailController,
                      labelText: "Email",
                      hintText: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                      onChanged: (_) => _updateFormValidity(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                            controller: passwordController,
                            labelText: "Password",
                            hintText: "Enter your password",
                            isPassword: true,
                            suffixIcon: Icons.visibility,
                            validator: Validators.passwordMatch,
                            onChanged: (_) => _updateFormValidity(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomFormField(
                            controller: confirmPasswordController,
                            labelText: "Confirm Password",
                            hintText: "Confirm your password",
                            isPassword: true,
                            validator: (val) {
                              if (val == null || val.isEmpty) return 'Required';
                              if (val != passwordController.text)
                                return 'Passwords do not match';
                              return null;
                            },
                            onChanged: (_) => _updateFormValidity(),
                          ),
                        ),
                      ],
                    ),
                    CustomFormField(
                      controller: phoneController,
                      labelText: "Phone",
                      hintText: "Enter your phone",
                      keyboardType: TextInputType.phone,
                      validator: Validators.phone,
                      onChanged: (_) => _updateFormValidity(),
                    ),
                    const SizedBox(height: 20),
                    if (state.isLoading)
                        Center(child: CircularProgressIndicator()),
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
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
       );
  }

  void _updateFormValidity() {
    setState(() {
      isValid = _formKey.currentState?.validate() ?? false;
    });
  }
  void _onSignUpPressed() async {
    if (!_formKey.currentState!.validate()) return;
    final request = SignUpRequest(
      username: usernameController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      rePassword: confirmPasswordController.text.trim(),
      phone: phoneController.text.trim(),
    );
     await _viewModel.doAction(signUPData(request));
    await widget.secureStorage.write(
  key: 'signUpProfile',
  value: jsonEncode(request.toJson()),
);}
  }