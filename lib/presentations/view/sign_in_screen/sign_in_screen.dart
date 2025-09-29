import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
              Image.asset(AppImages.signInImage, width: 70, height: 70),
              const SizedBox(height: 16),
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Please login first to start your Theory Test.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 40),
              SignInForm(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Utils.primaryButton(
                    onTap: () {
                      Get.offNamedUntil(RouteNames.postScreen, (_) => false);
                    },
                    buttonText: "Sign In",
                  ),
                ),
              ),
              const SizedBox(height: 16,),
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
