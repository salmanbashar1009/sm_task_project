import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/theme/app_theme.dart';
import 'package:sm_task_project/presentations/controllers/sign_in_controller.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final SignInController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Address',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(color: AppTheme.borderColor),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Password',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => TextFormField(
              obscureText: controller.isPasswordHidden.value,
              decoration: InputDecoration(
                hintText: '********',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: AppTheme.borderColor),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.togglePasswordVisibility();
                  },
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
             Obx(()=> IconButton(
               onPressed: () {
                 controller.toggleRememberMe();
               },
               icon: Icon(
                 controller.rememberMe.value
                     ? Icons.check_box
                     : Icons.check_box_outline_blank_outlined,
                 color: AppTheme.primaryColor,
               ),
             ),),
              const SizedBox(width: 8),
              Text(
                "Remember me",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "Forgot Password",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
