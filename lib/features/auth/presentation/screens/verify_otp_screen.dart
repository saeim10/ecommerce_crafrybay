
import 'dart:async';

import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/widgetsForScreen/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  Timer? _timer;
  int _secondsRemaining = 30;
  bool _canResend = false;
  @override
  void initState() {
    // TODO: implement initState
    _startResendTimer();
    super.initState();
  }
  void _startResendTimer() {
    _secondsRemaining = 30;
    _canResend = false;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        setState(() => _canResend = true);
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 48,),
                AppLogo(width: 90,),
                const SizedBox(height: 16,),
                Text('Verify OTP',style: textTheme.titleLarge),
                Text('A 6 digits code has been sent in your email address',style: textTheme.titleSmall,),
                const SizedBox(height: 24,),
            PinCodeTextField(
              appContext: context,
              controller: _otpTEController,
              keyboardType: TextInputType.number,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
            ),
                const SizedBox(height: 16,),
                FilledButton(
                    onPressed: _onTapVerifyButton, child: Text('Verify',style: TextStyle(fontSize: 16),)),
                const SizedBox(height: 16,),
                _canResend
                    ? TextButton(
                  onPressed: _onTapResendOtp,
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: 16),
                  ),
                )
                    : Text(
                  'Resend OTP in $_secondsRemaining sec',
                  style: textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
                TextButton(onPressed: _onTapMoveToSignIn, child: Text('Back to login',style: TextStyle(fontSize: 18),))
              ],
            ),
          ),
        ))
    );
  }
  void _onTapVerifyButton(){
  }
  void _onTapMoveToSignIn(){
    Navigator.pushNamed(context, SignInScreen.name);
  }
  void _onTapResendOtp() {
    debugPrint('OTP Resent');
    _startResendTimer();
    // TODO: resend OTP API / Firebase
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    _otpTEController.dispose();
    super.dispose();
  }
}
