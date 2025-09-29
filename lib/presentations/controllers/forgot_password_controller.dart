import 'dart:async';

import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final RxBool isNewPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;

  void toggleNewPasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  /// otp countdown timer
  final RxInt seconds = 60.obs;
  late Timer _timer;

  void startTimer() {
    seconds.value = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void disposeTimer() {
    _timer.cancel();
  }

  @override
  void onClose() {
    disposeTimer();
    super.onClose();
  }

}