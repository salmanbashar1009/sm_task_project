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
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed(RouteNames.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 120,),
                Image.asset(AppImages.splashCar, width: 124, height: 124),
                const SizedBox(height: 16),
                Text(
                  'Theory test in my language',
                  style: Theme.of(context).textTheme.titleLarge,

                ),
                const SizedBox(height: 16),
                Text(
                  'I must write the real test will be in English language and this app just helps you to understand the materials in your language',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                CircularProgressIndicator(color: AppTheme.primaryColor,),
                const SizedBox(height: 56),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
