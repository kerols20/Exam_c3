import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_one_c3_team/presentation/widget/custom_Button.dart';
import '../../../di/di.dart';
import '../../../viweModel/viweModel.dart';
import '../../../api/auth/request/Reset Password.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  late Viwe_Model _viwe_model;

  @override
  void initState() {
    super.initState();
    _viwe_model = getIt<Viwe_Model>();
  }

  void _updateFormValidity() {
    setState(() {
      isValid = _formKey.currentState?.validate() ?? false;
    });
  }

  Future<void> _resetPassword() async {
    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields correctly.")),
      );
      return;
    }
    final email = await widget.secureStorage.read(key: 'email');
    if (email == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email not found.")),
      );
      return;
    }
    final request = Reset_Password(
      email: email,
      newPassword: passwordController.text.trim(),
    );
    await _viwe_model.doAction(ResetPasswordAction(request));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Viwe_Model, Viwe_State>(
      bloc: _viwe_model,
      listener: (context, state) {
        if (state.sucsses == "success") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password reset successfully!")),
          );
          Navigator.pushReplacementNamed(context, '/signin');
        } else if (state.errormasssege != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errormasssege!)),
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
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  "Password",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
            centerTitle: false,
          ),
          body:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Reset password",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Password must not be empty and must contain 6 characters with upper case letter and one number at least",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
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
                        const SizedBox(height: 20),
                        CustomFormField(
                          controller: confirmPasswordController,
                          labelText: "Confirm password",
                          hintText: "Confirm your password",
                          isPassword: true,
                          suffixIcon: Icons.visibility,
                          validator: (val) {
                            if (val == null || val.isEmpty) return 'Required';
                            if (val != passwordController.text) return 'Passwords do not match';
                            return null;
                          },
                          onChanged: (_) => _updateFormValidity(),
                        ),
                        const SizedBox(height: 20),
                        if (state.isLoading) const CircularProgressIndicator(),
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
                            onPressed: _resetPassword,
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
          ),
        );
      },
    );
  }
}
