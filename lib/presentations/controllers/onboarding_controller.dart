import 'package:get/get.dart';
import 'package:sm_task_project/core/constant/app_images.dart';

class OnboardingController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final onboardingData = [
    {
      'image': AppImages.onboarding1, // Replace with your image asset
      'title': 'Best online courses in the world',
      'description':
      'Now you can learn anywhere, anytime, even if there is no internet access!',
      'buttonText': 'Next',
    },
    {
      'image': AppImages.onboarding2, // Replace with your image asset
      'title': 'Explore your new skill today',
      'description':
      'Our platform is designed to help you explore new skills. Let’s learn & grow with Eduline!',
      'buttonText': 'Get Started',
    },
  ];

  void changeCurrentIndex(int index) {
    currentIndex.value = index;
  }
}