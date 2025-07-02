import 'package:flutter/material.dart';
import 'package:project_one_c3_team/widget/custom_Button.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool isVaild = false;
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cofirmpasswordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "Sign Up",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey2,
        child: Column(
          children: [
            CustomFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your user name';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  isVaild = _formKey2.currentState!.validate();
                });
              },
              controller: usernameController,
              labelText: "User Name",
              hintText: "Enter your user name",
            ), // user name
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        isVaild = _formKey2.currentState!.validate();
                      });
                    },
                    controller: firstnameController,
                    labelText: "first name",
                    hintText: "Enter your first name",
                    keyboardType: TextInputType.name,
                  ),// first name
                ), Expanded(
                  child: CustomFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        isVaild = _formKey2.currentState!.validate();
                      });
                    },
                    controller: lastnameController,
                    labelText: "last name",
                    hintText: "Enter your last name",
                    keyboardType: TextInputType.emailAddress,
                  ), // last name
                ),
              ],
            ),
            CustomFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  isVaild = _formKey2.currentState!.validate();
                });
              },
              labelText: "Email",
              hintText: "Enter your email",
              keyboardType: TextInputType.emailAddress,
            ), // email
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        isVaild = _formKey2.currentState!.validate();
                      });
                    },
                    isPassword: true,
                    suffixIcon: Icons.visibility,
                    labelText: "password",
                    hintText: "Enter your password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ), Expanded(
                  child: CustomFormField(
                    controller: cofirmpasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty || value != passwordController.text) {
                        return 'Please enter your correct password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        isVaild = _formKey2.currentState!.validate();
                      });
                    },
                    labelText: "confirm password",
                    hintText: "confirm your password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
              ],
            ),
            CustomFormField(
              controller: phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  isVaild = _formKey2.currentState!.validate();
                });
              },
              labelText: "phone",
              hintText: "Enter your phone",
            ),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    bool formValid = _formKey2.currentState!.validate();
                    setState(() {
                      isVaild = formValid;
                    });
                    if (formValid) {
                      print("Form is valid, proceed to signUp");
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
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
