import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/di/di.dart';
import 'package:project_one_c3_team/domin/home/model/profile_model.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';
import 'package:project_one_c3_team/viweModel/viweModel.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
}

class _Profile_pageState extends State<Profile_page> {

  @override
  void initState() {
    super.initState();
    _loadData();
    _viewModel = getIt<Viwe_Model>();
  }
  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   phoneController.dispose();
  //   usernameController.dispose();
  //   super.dispose();
  // }
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();
  late Viwe_Model _viewModel;
  ProfileModel? profileData;
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
                  const Text("Profile", style: TextStyle(color: Colors.black)),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
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
                  children: [
                    CustomFormField(
                      enabled: false,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      controller: usernameController,
                      labelText: "User Name",
                      hintText: "Enter your username",
                      // validator: Validators.name,
                     // onChanged: (_) => _updateFormValidity(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                            enabled: false,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            controller: firstNameController,
                            labelText: "First Name",
                            hintText: "Enter your first name",
                           // validator: Validators.name,
                           // onChanged: (_) => _updateFormValidity(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomFormField(
                            enabled:false,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            controller: lastNameController,
                            labelText: "Last Name",
                            hintText: "Enter your last name",
                           // validator: Validators.name,
                            //onChanged: (_) => _updateFormValidity(),
                          ),
                        ),
                      ],
                    ),
                    CustomFormField(
                      enabled:false,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      controller: emailController,
                      labelText: "Email",
                      hintText: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                      //validator: Validators.email,
                     // onChanged: (_) => _updateFormValidity(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                            enabled:false,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            controller: passwordController,
                            labelText: "Password",
                            hintText: "Enter your password",
                            isPassword: true,
                            suffixIcon: Icons.visibility,
                           // validator: Validators.passwordMatch,
                          //  onChanged: (_) => _updateFormValidity(),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    CustomFormField(
                      enabled:true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      controller: phoneController,
                      labelText: "Phone",
                      hintText: "Enter your phone",
                      keyboardType: TextInputType.phone,
                     // validator: Validators.phone,
                     // onChanged: (_) => _updateFormValidity(),
                    ),
                    const SizedBox(height: 20),
                    if (state.isLoading)
                        Center(child: CircularProgressIndicator()),
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 50,
                    //   child: ElevatedButton(
                    //    // onPressed: isValid ? _onSignUpPressed : null,
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: isValid ? Colors.blue : Colors.grey,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(25),
                    //       ),
                    //     ),
                    //     child: const Text(
                    //       "Sign Up",
                    //       style: TextStyle(color: Colors.white, fontSize: 18),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          );
        },
       );
  }

  Future<void> _loadData() async {
    final profileDataJson = await widget.secureStorage.read(key: 'signUpProfile');
    //print('Read from storage: $profileDataJson');
    if (profileDataJson != null) {
      setState(() {
        profileData = ProfileModel.fromJson(jsonDecode(profileDataJson));
        usernameController.text = profileData?.username ?? '';
        firstNameController.text = profileData?.name?.split(' ').first ?? '';
        lastNameController.text = profileData?.name?.split(' ').last ?? '';
        emailController.text = profileData?.email ?? '';
        phoneController.text = profileData?.phone ?? '';
        passwordController.text = profileData?.password ?? '';
      });
    }
  }
}
