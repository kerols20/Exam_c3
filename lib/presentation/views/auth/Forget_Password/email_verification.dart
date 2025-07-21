import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:dio/dio.dart';
import 'package:project_one_c3_team/presentation/views/auth/Forget_Password/reset_password_screen.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => EmailVerificationState();
}

class EmailVerificationState extends State<EmailVerification> {
  bool isValid = false;
  bool isError = false;


  @override
  void initState() {
    super.initState();
  }

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Password', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
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
              'Please enter your code that send to your\nemail address',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 40),
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: otpController,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 60,
                fieldWidth: 60,
                activeFillColor: Colors.blue.shade50,
                selectedFillColor: Colors.blue.shade50,
                inactiveFillColor: Colors.blue.shade50,
                activeColor: Colors.transparent,
                selectedColor: Colors.transparent,
                inactiveColor: Colors.transparent,
              ),
              cursorColor: Colors.black,
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (isError) {
                  setState(() {
                    isError = false;
                  });
                }
              },
              onCompleted: (value) {
                _validateOtp(value); // Call your OTP validation function here
              },

            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive code? "),
                TextButton(
                  onPressed: () {
                    print('Resend OTP');
                  },
                  child: const Text('Resend'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _validateOtp(String value) async {
    try {
      final response = await Dio().post(
        'https://exam.elevateegy.com/api/v1/auth/verifyResetCode',
        data: {'otp': value},
      );

      if (response.statusCode == 200 && response.data['valid'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ResetPasswordScreen()),
        );
      } else {
        _showInvalidOtp();
      }
    } catch (e) {
      _showInvalidOtp();
    }
  }

  void _showInvalidOtp() {
    setState(() {
      isError = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invalid code. Please try again.')),
    );
  }


}
