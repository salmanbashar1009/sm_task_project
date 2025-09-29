import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/theme/app_theme.dart';
import 'package:sm_task_project/presentations/controllers/sign_up_controller.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
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
            hintText: 'Enter email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: AppTheme.borderColor),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Full Name',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Enter full name',
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
            onChanged: (value){
              if(value.isNotEmpty){
                controller.checkPasswordStrength(value);
              }else{
                controller.checkPasswordStrength(' ');
              }

            },
          ),
        ),
        const SizedBox(height: 16),
        Obx(() => Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 120,
              child: LinearProgressIndicator(
                value: controller.strength.value,
                backgroundColor: Colors.grey[300],
                color: controller.strength.value > 0.7 ? Colors.green :
                controller.strength.value > 0.3 ? Colors.orange : Colors.red,
                minHeight: 6,

              ),
            ),
            Spacer(),
            Text(
              controller.strength.value > 0.7 ? 'Strong' :
              controller.strength.value > 0.3 ? 'Medium' : 'Weak',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: controller.strength.value > 0.7 ? Colors.green :
                controller.strength.value > 0.3 ? Colors.orange : Colors.red,
              ),
            )

          ],
        )),
        SizedBox(height: 10),
        Obx(() => Text(
          'At least 8 characters with a combination of letters and numbers',
          style: TextStyle(
            color: controller.strength.value >= 0.7 ? Colors.green : Colors.blue,
          ),
        )),
      ],
    );
  }
}
