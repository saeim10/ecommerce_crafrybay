

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpTimerController extends GetxController {
  Timer? _timer;
  int secondsRemaining = 60;
  bool canResend = false;

  @override
  void onInit() {
    startResendTimer();
    super.onInit();
  }

  void startResendTimer() {
    secondsRemaining = 60;
    canResend = false;
    update();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining == 0) {
        timer.cancel();
        canResend = true;
        update();
      } else {
        secondsRemaining--;
        update();
      }
    });
  }

  void resendOtp() {
    debugPrint('OTP Resent');
    startResendTimer();
    // TODO: resend OTP API / Firebase
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
