import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/constant/app_images.dart';
import 'package:sm_task_project/core/utils/utils.dart';
import 'package:sm_task_project/presentations/view/sign_in_screen/widgets/sign_in_form.dart';

import '../../../core/route_config/route_names.dart';
import '../../../core/theme/app_theme.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.signInImage, width: 70.w, height: 70.h),
               SizedBox(height: 16.h),
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
               SizedBox(height: 8.h),
              Text(
                'Please login first to start your Theory Test.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
               SizedBox(height: 40.h),
              SignInForm(),
               SizedBox(height: 24.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  height: 56.h,
                  width: double.infinity,
                  child: Utils.primaryButton(
                    onTap: () {
                      Get.offNamedUntil(RouteNames.postScreen, (_) => false);
                    },
                    buttonText: "Sign In",
                  ),
                ),
              ),
               SizedBox(height: 16.h,),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Don’t have an account? ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: ' Create Account',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w500
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Get.toNamed(RouteNames.signUpScreen);
                    },
                  ),
                ]
              ))
            ],
          ),
        ),
      ),
    );
  }
}
