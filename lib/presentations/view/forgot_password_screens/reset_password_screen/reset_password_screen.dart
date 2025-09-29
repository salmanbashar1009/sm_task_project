import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/route_config/route_names.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/utils.dart';
import '../../../controllers/forgot_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});

  final ForgotPasswordController controller = Get.find();

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
                  "Reset Password",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width  * 0.8,
                  child: Text(
                    "Your password must be at least 8 characters long and include a combination of letters, numbers",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 36,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("New Password",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Color(0xFF0F172A),
                      fontWeight: FontWeight.w500
                  ),),
                ),
                const SizedBox(height: 10,),
                Obx(
                      () => TextFormField(
                    obscureText: controller.isNewPasswordHidden.value,
                    decoration: InputDecoration(
                      hintText: '********',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: AppTheme.borderColor),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.toggleNewPasswordVisibility();
                        },
                        icon: Icon(
                          controller.isNewPasswordHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("New Password",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Color(0xFF0F172A),
                      fontWeight: FontWeight.w500
                  ),),
                ),
                const SizedBox(height: 10,),
                Obx(
                      () => TextFormField(
                    obscureText: controller.isConfirmPasswordHidden.value,
                    decoration: InputDecoration(
                      hintText: '********',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: AppTheme.borderColor),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.toggleConfirmPasswordVisibility();
                        },
                        icon: Icon(
                          controller.isConfirmPasswordHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: Utils.primaryButton(onTap: (){
                    Get.toNamed(RouteNames.verifyCodeScreen);
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
