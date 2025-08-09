import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one_c3_team/presentation/views/auth/reset_password_screen.dart';
import 'package:project_one_c3_team/viweModel/viweModel.dart';
import '../../../api/auth/request/Verify_Reset_password.dart';
import '../../../di/di.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  late Viwe_Model _viweModel;

  final List<TextEditingController> _controllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(6, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    _viweModel = getIt<Viwe_Model>();
  }

  void _submitCode() {
    final code = _controllers.map((c) => c.text).join();
    if (code.length != 6) return;

    _viweModel.doAction(
      VerifyResetCodeAction(Verify_reset_password(resetCode: code)),
    );
  }

  Widget _buildCodeBox(int index) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < _focusNodes.length - 1) {
            _focusNodes[index + 1].requestFocus();
          }
          if (_controllers.every((c) => c.text.isNotEmpty)) {
            _submitCode();
          }
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Viwe_Model, Viwe_State>(
      bloc: _viweModel,
      listener: (context, state) {
        if (state.sucsses == "success") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  ResetPasswordScreen()),
          );
        }
        else if (state.errormasssege != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errormasssege!)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Password', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Email verification',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please enter your code that sent to your\nemail address',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (i) => _buildCodeBox(i)),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        _viweModel.doAction(
                          VerifyResetCodeAction(Verify_reset_password(resetCode: "123456")),
                        );
                        print("Resend OTP");
                      },
                      child: const Text("Didn't receive code? Resend"),
                    ),
                  ],
                ),
              ),
              if (state.isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}
