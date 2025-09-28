import 'package:get/get.dart';
import 'package:sm_task_project/core/route_config/route_names.dart';
import 'package:sm_task_project/presentations/view/onboarding_screen/onboarding_screen.dart';
import '../../presentations/view/post_screen/post_screen.dart';
import '../../presentations/view/splash_screen/splash_screen.dart';


class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteNames.postScreen,
      page: () => PostScreen(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: RouteNames.onBoardingScreen,
      page: () => OnboardingScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
