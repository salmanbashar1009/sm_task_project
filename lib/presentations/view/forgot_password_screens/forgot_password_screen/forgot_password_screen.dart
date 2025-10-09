import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/route_config/route_names.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/utils.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leadingWidth: 100.w, leading: Utils.backButton()),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: 32.h,),
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                 SizedBox(height: 8.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width  * 0.8,
                  child: Text(
                    "Enter your email, we will send a verification code to email",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                 SizedBox(height: 36.h,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email Address",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.w500
                  ),),
                ),
                 SizedBox(height: 10.h,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: AppTheme.borderColor),
                    ),
                  ),
                ),
                 SizedBox(height: 40.h,),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: Utils.primaryButton(onTap: (){
                    Get.toNamed(RouteNames.resetPasswordScreen);
                  }, buttonText: "Continue"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
