import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/route_config/route_names.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/utils.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leadingWidth: 100, leading: Utils.backButton()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32,),
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width  * 0.6,
                  child: Text(
                    "Enter your email, we will send a verification code to email",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 36,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email Address",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.w500
                  ),),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: AppTheme.borderColor),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                SizedBox(
                  width: double.infinity,
                  height: 56,
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
