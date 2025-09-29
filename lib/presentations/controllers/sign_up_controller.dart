import 'package:get/get.dart';

class SignUpController extends GetxController{
  final RxString password = ''.obs;
  final RxDouble strength = 0.0.obs;

  final RxBool isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void checkPasswordStrength(String value) {
    password.value = value;
    if (value.isEmpty || value == ' ') {
      strength.value = 0.0; // Weak when empty
    } else if (value.length < 8) {
      strength.value = 0.3; // Weak
    } else if (value.contains(RegExp(r'[A-Za-z]')) && value.contains(RegExp(r'[0-9]'))) {
      strength.value = 1.0; // Strong
    } else {
      strength.value = 0.7; // Medium
    }
  }
}