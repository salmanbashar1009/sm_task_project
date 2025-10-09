import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/theme/app_theme.dart';
import 'package:sm_task_project/presentations/controllers/sign_in_controller.dart';

import '../../../../core/route_config/route_names.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final SignInController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
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
           SizedBox(height: 10.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide(color: AppTheme.borderColor),
              ),
            ),
          ),
           SizedBox(height: 16.h),
          Text(
            'Password',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w500,
            ),
          ),
           SizedBox(height: 10.h),
          Obx(
            () => TextFormField(
              obscureText: controller.isPasswordHidden.value,
              decoration: InputDecoration(
                hintText: '********',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.r),
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
           SizedBox(height: 16.h),
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
               SizedBox(width: 8.w),
              Text(
                "Remember me",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteNames.forgotPasswordScreen);
                },
                child: Text(
                  "Forgot Password",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
