import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/utils/utils.dart';
import 'package:sm_task_project/presentations/view/sign_up_screen/widgets/show_registration_dialog.dart';
import 'package:sm_task_project/presentations/view/sign_up_screen/widgets/sign_up_form.dart';

import '../../../core/route_config/route_names.dart';
import '../../../core/theme/app_theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Utils.backButton(),

      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height: 32.h),
                Text(
                  'Welcome to Edduline!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                 SizedBox(height: 8.h),
                Text(
                  'Let’s join to Eduline learning ecosystem & meet our professional mentor. It’s Free!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                 SizedBox(height: 40.h),
                SignUpForm(),
                 SizedBox(height: 24.h),
                SizedBox(
                  height: 56.h,
                  width: double.infinity,
                  child: Utils.primaryButton(
                    onTap: () {
                      showRegistrationDialog(context: context);
                    },
                    buttonText: "Sign Up",
                  ),
                ),
                 SizedBox(height: 16.h,),
                Align(
                  alignment: Alignment.center,
                  child: RichText(text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: ' Sign In',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.w500
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.offAndToNamed(RouteNames.signInScreen);
                          },
                        ),
                      ]
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
