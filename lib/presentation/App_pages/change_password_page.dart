import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/api/home/response/change_profile_password_response.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';
import 'package:project_one_c3_team/di/di.dart';
import 'package:project_one_c3_team/viweModel/Home_viwe_model/Home_viwe_model.dart';
import 'package:project_one_c3_team/api/home/request/change_password_request.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  bool isDataChanged = false;
  bool isFormValid = false;
  
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  late Home_viwe_model _viewModel;
  
  // Focus nodes
  final currentPasswordFocus = FocusNode();
  final newPasswordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<Home_viwe_model>();
    _addTextListeners();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    currentPasswordFocus.dispose();
    newPasswordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  void _addTextListeners() {
    for (var controller in [
      currentPasswordController,
      newPasswordController,
      confirmPasswordController,
    ]) {
      controller.addListener(() {
        _checkForChanges();
        _updateFormValidity();
      });
    }
  }

  void _checkForChanges() {
    bool changed = currentPasswordController.text.isNotEmpty ||
        newPasswordController.text.isNotEmpty ||
        confirmPasswordController.text.isNotEmpty;

    if (changed != isDataChanged) {
      setState(() {
        isDataChanged = changed;
      });
    }
  }

  void _updateFormValidity() {
    bool valid = _validateForm();
    if (valid != isFormValid) {
      setState(() {
        isFormValid = valid;
      });
    }
  }

  bool _validateForm() {
    if (currentPasswordController.text.isEmpty) return false;
    if (newPasswordController.text.isEmpty) return false;
    if (confirmPasswordController.text.isEmpty) return false;
    if (newPasswordController.text != confirmPasswordController.text) return false;
    if (newPasswordController.text.length < 6) return false;
    return true;
  }

  void _changePassword() async {
    // Validate form first
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all fields correctly"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!_validateForm()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please ensure all fields are filled correctly and passwords match"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final token = await secureStorage.read(key: 'token');
    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Token not found. Please login again."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final request = ChangePasswordRequest(
      oldPassword: currentPasswordController.text.trim(),
      password: newPasswordController.text.trim(),
      rePassword: confirmPasswordController.text.trim(),
    );

    // Add debugging prints
    print("🔐 Change Password Debug:");
    print("Token: $token");
    print("Request body: ${request.toJson()}");
    print("Current password length: ${currentPasswordController.text.trim().length}");
    print("New password length: ${newPasswordController.text.trim().length}");

    try {
      final response = await _viewModel.doAction(ChangePasswordAction(
        token: token,
        request: request,
      )) as ChangeProfilePasswordResponse;
      
      // Handle the new token returned from the API
      if (response != null && response.token.isNotEmpty) {
        // Update the token in secure storage
        await secureStorage.write(key: 'token', value: response.token);
        print("🔄 Token updated successfully: ${response.token}");
      }
    } catch (e) {
      print("❌ Change password error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to change password: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _handlePasswordChangeSuccess() async {
    // Clear form and reset state
    setState(() {
      currentPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
      isDataChanged = false;
      isFormValid = false;
    });
    
    // Unfocus all fields
    FocusScope.of(context).unfocus();
    
    // Navigate back to profile
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Home_viwe_model, Home_viwe_model_status>(
      bloc: _viewModel,
      listener: (context, state) {
        if (state.sucsses == "success") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Password changed successfully"),
              backgroundColor: Colors.green,
            ),
          );
          _handlePasswordChangeSuccess();
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
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Reset password",
                  style: TextStyle(color: Colors.black),
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
                  const SizedBox(height: 20),
                  const Text(
                    "Change Password",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Password must not be empty and must contain 6 characters with upper case letter and one number at least",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                  CustomFormField(
                    focusNode: currentPasswordFocus,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    controller: currentPasswordController,
                    labelText: "Current password",
                    hintText: "Enter your current password",
                    isPassword: true,
                    validator: (val) {
                      if (val == null || val.isEmpty) return 'Current password is required';
                      return null;
                    },
                    onChanged: (_) => _updateFormValidity(),
                  ),
                  CustomFormField(
                    focusNode: newPasswordFocus,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    controller: newPasswordController,
                    labelText: "New password",
                    hintText: "Enter your new password",
                    isPassword: true,
                    validator: (val) {
                      if (val == null || val.isEmpty) return 'New password is required';
                      if (val.length < 6) return 'Password must be at least 6 characters';
                      return null;
                    },
                    onChanged: (_) => _updateFormValidity(),
                  ),
                  CustomFormField(
                    focusNode: confirmPasswordFocus,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    controller: confirmPasswordController,
                    labelText: "Confirm password",
                    hintText: "Confirm your new password",
                    isPassword: true,
                    validator: (val) {
                      if (val == null || val.isEmpty) return 'Please confirm your password';
                      if (val != newPasswordController.text) return 'Passwords do not match';
                      return null;
                    },
                    onChanged: (_) => _updateFormValidity(),
                  ),
                  const SizedBox(height: 20),
                  if (state.isLoading)
                    Center(child: CircularProgressIndicator()),
                  if (!state.isLoading)
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isDataChanged && isFormValid && !state.isLoading
                            ? _changePassword
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDataChanged && isFormValid && !state.isLoading
                              ? Colors.blue 
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          "Update",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}