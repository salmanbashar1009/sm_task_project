import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding:  EdgeInsets.all(30.r),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                Image.asset(
                  AppImages.splashCar,
                  width: 124.w,
                  height: 124.h,
                ),
                 SizedBox(height: 16.h),

                Text(
                  'Theory test in my language',
                  style: textTheme.titleLarge,
                ),
                 SizedBox(height: 16.h),

                Text(
                  'I must write the real test will be in English language and this app just helps you to understand the materials in your language',
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),

                const Spacer(flex: 3),

                // Loading Indicator
                const CircularProgressIndicator(color: AppTheme.primaryColor),

                 SizedBox(height: 56.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
