import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/constant/app_images.dart';
import 'package:sm_task_project/core/route_config/route_names.dart';
import '../../../core/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      /// Remove all previous screens before navigating
      Get.offAllNamed(RouteNames.onBoardingScreen);
    });
  }



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              Image.asset(
                AppImages.splashCar,
                width: 124,
                height: 124,
              ),
              const SizedBox(height: 16),

              Text(
                'Theory test in my language',
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              Text(
                'I must write the real test will be in English language and this app just helps you to understand the materials in your language',
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const Spacer(flex: 3),

              // Loading Indicator
              const CircularProgressIndicator(color: AppTheme.primaryColor),

              const SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }
}
