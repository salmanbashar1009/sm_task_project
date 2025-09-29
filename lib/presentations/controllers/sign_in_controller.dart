import 'package:get/get.dart';

class SignInController extends GetxController{
  final RxBool isPasswordHidden = true.obs;
  final RxBool rememberMe = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }
}