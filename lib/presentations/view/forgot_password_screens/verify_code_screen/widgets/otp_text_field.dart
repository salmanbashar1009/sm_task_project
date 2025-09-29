import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sm_task_project/presentations/view/forgot_password_screens/verify_code_screen/widgets/pin_theme.dart';
import 'package:sm_task_project/presentations/view/forgot_password_screens/verify_code_screen/widgets/show_password_reset_success_dialog.dart';

class OtpTextField extends StatelessWidget {
  OtpTextField({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obscureText: true,
      animationType: AnimationType.fade,
      pinTheme: pinTheme(),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: otpController,
      onCompleted: (v) {
        debugPrint("Completed");
      },
      onChanged: (value) {
        if (value.length == 4) {
          showResetPasswordSuccessDialog(context: context);
        }
      },
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        return true;
      },
      appContext: context,
    );
  }
}