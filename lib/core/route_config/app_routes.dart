import 'package:get/get.dart';
import 'package:sm_task_project/core/route_config/route_names.dart';
import 'package:sm_task_project/presentations/view/forgot_password_screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:sm_task_project/presentations/view/forgot_password_screens/reset_password_screen/reset_password_screen.dart';
import 'package:sm_task_project/presentations/view/forgot_password_screens/verify_code_screen/verify_code_screen.dart';
import 'package:sm_task_project/presentations/view/onboarding_screen/onboarding_screen.dart';
import 'package:sm_task_project/presentations/view/sign_in_screen/sign_in_screen.dart';
import 'package:sm_task_project/presentations/view/sign_up_screen/sign_up_screen.dart';
import '../../presentations/view/post_screen/post_screen.dart';
import '../../presentations/view/splash_screen/splash_screen.dart';
import '../state_controller_binders/state_controller_binder.dart';


class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteNames.postScreen,
      page: () => PostScreen(),
      transition: Transition.rightToLeft,
      binding: StateControllerBinder(),
    ),
    GetPage(
      name: RouteNames.onBoardingScreen,
      page: () => OnboardingScreen(),
      transition: Transition.noTransition,
      binding: StateControllerBinder(),
    ),
    GetPage(
      name: RouteNames.signInScreen,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,
      binding: StateControllerBinder()
    ),
    GetPage(
      name: RouteNames.signUpScreen,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
      binding: StateControllerBinder()
    ),
    GetPage(
      name: RouteNames.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
      binding: StateControllerBinder()
    ),
    GetPage(
      name: RouteNames.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      transition: Transition.rightToLeft,
      binding: StateControllerBinder()
    ),
    GetPage(
      name: RouteNames.verifyCodeScreen,
      page: () => VerifyCodeScreen(),
      transition: Transition.rightToLeft,
      binding: StateControllerBinder()
    ),

  ];
}
