import 'package:get/get.dart';
import 'package:sm_task_project/presentations/controllers/forgot_password_controller.dart';
import 'package:sm_task_project/presentations/controllers/onboarding_controller.dart';
import '../../presentations/controllers/post_controller.dart';
import '../../presentations/controllers/sign_in_controller.dart';
import '../../presentations/controllers/sign_up_controller.dart';



class StateControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> PostController());
    Get.lazyPut(()=> OnboardingController());
    Get.lazyPut(()=> SignInController());
    Get.lazyPut(()=> SignUpController());
    Get.lazyPut(()=> ForgotPasswordController());
  }
}