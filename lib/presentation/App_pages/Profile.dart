import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/api/home/request/edit_profile_request.dart';
import 'package:project_one_c3_team/api/home/response/user_info_response.dart';
import 'package:project_one_c3_team/di/di.dart';
import 'package:project_one_c3_team/presentation/App_pages/change_password_page.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';
import 'package:project_one_c3_team/viweModel/Home_viwe_model/Home_viwe_model.dart';


class Profile_page extends StatefulWidget {
   Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
  final FlutterSecureStorage secureStorage =  FlutterSecureStorage();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  void initState() {
    super.initState();
    _viewModel = getIt<Home_viwe_model>();
    _loadData();
    _addFocusListeners();
    _addTextListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    usernameFocus.dispose();
    firstNameFocus.dispose();
    lastNameFocus.dispose();
    emailFocus.dispose();
   // passwordFocus.dispose();
    phoneFocus.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  bool isEditing = false;
  bool isDataChanged = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();
  late Home_viwe_model _viewModel;
  //foucs nodes for all form fields
  final usernameFocus = FocusNode();
  final firstNameFocus = FocusNode();
  final lastNameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final phoneFocus = FocusNode();
  //store the original values
  String originalUsername = '';
  String originalFirstName = '';
  String originalLastName = '';
  String originalEmail = '';
  String originalPhone = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Home_viwe_model, Home_viwe_model_status>(
      bloc: _viewModel,
      listener: (context, state) {
        if (state.sucsses == "Profile updated successfully") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Profile updated successfully"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (state.errormasssege != null) {
          print("Profile Error From BlocConsumer: ${state.errormasssege}");
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
                if (isEditing)
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    onPressed: () {
                      FocusScope.of(context).unfocus(); // Hide keyboard
                      setState(() {
                        isEditing = false;
                        isDataChanged = false;

                        // Revert all fields to original values
                        usernameController.text = originalUsername;
                        firstNameController.text = originalFirstName;
                        lastNameController.text = originalLastName;
                        emailController.text = originalEmail;
                        phoneController.text = originalPhone;
                    //    passwordController.text = originalPassword;
                      });
                    },
                  ),
                Text(
                  isEditing ? "Edit Profile" : "Profile",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomFormField(
                   
                    focusNode: usernameFocus,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    controller: usernameController,
                    labelText: "User Name",
                    hintText: "Enter your username",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                          
                          focusNode: firstNameFocus,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          controller: firstNameController,
                          labelText: "First Name",
                          hintText: "Enter your first name",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomFormField(
                         
                          focusNode: lastNameFocus,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          controller: lastNameController,
                          labelText: "Last Name",
                          hintText: "Enter your last name",
                        ),
                      ),
                    ],
                  ),
                  CustomFormField(
                    
                    focusNode: emailFocus,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    controller: emailController,
                    labelText: "Email",
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Stack(
                    children: [
                      IgnorePointer(
                      child: CustomFormField(
                        isReadOnly: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        controller: passwordController,
                        labelText: "Password",
                        hintText: '★★★★★',
                        isPassword: false,
                      ),
                      ),
                      Positioned(
                      // Vertically center the "Change" text relative to the CustomFormField
                      top: 0,
                      right: 30,
                      bottom: 0,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(
                          color: Color(0xff02369C),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          ),
                        ),
                        ),
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  CustomFormField(
                    focusNode: phoneFocus,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    controller: phoneController,
                    labelText: "Phone",
                    hintText: "Enter your phone",
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  if (state.isLoading)
                    Center(child: CircularProgressIndicator()),
                   if (isEditing)
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isDataChanged
                              ? changeData
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isDataChanged ? Colors.blue : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            "Update",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: () {
                    widget.secureStorage.delete(key: "token");
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  }, child: Text("log out"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _loadData() async {
    final token = await widget.secureStorage.read(key: "token");
    if (token == null) return;
    final result =
        await _viewModel.doAction(GetUserInfoAction(token)) as UserInfoResponse;
    print('Read from storage: $result');
    if (result != null) {
      setState(() {
        usernameController.text = result.user.username ?? '';
        firstNameController.text = result.user.firstName.split(' ').first ?? '';
        lastNameController.text = result.user.lastName ?? '';
        emailController.text = result.user.email ?? '';
        phoneController.text = result.user.phone ?? '';

        originalUsername = usernameController.text;
        originalFirstName = firstNameController.text;
        originalLastName = lastNameController.text;
        originalEmail = emailController.text;
        originalPhone = phoneController.text;
      });
    }
  }

  void _addFocusListeners() {
    for (var node in [
      usernameFocus,
      firstNameFocus,
      lastNameFocus,
      emailFocus,
     // passwordFocus,
      phoneFocus,
    ]) {
      node.addListener(() {
        if (node.hasFocus && !isEditing) {
          setState(() {
            isEditing = true;
          });
        } else {
          setState(() {
            isEditing = false;
          });
        }
      });
    }
  }

  void _addTextListeners() {
    for (var controller in [
      usernameController,
      firstNameController,
      lastNameController,
      emailController,
     // passwordController,
      phoneController,
    ]) {
      controller.addListener(_checkForChanges);
    }
  }

  void _checkForChanges() {
    bool changed =
        usernameController.text != originalUsername ||
        firstNameController.text != originalFirstName ||
        lastNameController.text != originalLastName ||
        emailController.text != originalEmail ||
        phoneController.text != originalPhone ;
       // passwordController.text != originalPassword;

    if (changed != isDataChanged) {
      setState(() {
        isDataChanged = changed;
      });
    }
  }

  void changeData() async {
    final token = await widget.secureStorage.read(key: "token");
    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No token found. Please login again."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    EditProfileRequest request = EditProfileRequest(
      email: emailController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      username: usernameController.text,
    );
    print("Token: $token");
    print("Request body: ${request.toJson()}");
    try {
      final response = await _viewModel.doAction(EditPRofile(
        token: token,
        editProfileRequest: request,
      )) as UserInfoResponse;

      if (response != null && response.user != null) {
        setState(() {
          usernameController.text = response.user.username;
          firstNameController.text = response.user.firstName;
          lastNameController.text = response.user.lastName;
          emailController.text = response.user.email;
          phoneController.text = response.user.phone;
          originalUsername = response.user.username;
          originalFirstName = response.user.firstName;
          originalLastName = response.user.lastName;
          originalEmail = response.user.email;
          originalPhone = response.user.phone;
          isEditing = false;
          isDataChanged = false;
          // unfocus all text fields
          FocusScope.of(context).unfocus();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to update profile"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

///testsam@gmail.com
///
/// d3ry237y132232XXS@@@
/// jdwq9389483294@@#2