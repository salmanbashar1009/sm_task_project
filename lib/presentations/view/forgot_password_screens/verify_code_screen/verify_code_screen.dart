import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/presentations/controllers/forgot_password_controller.dart';
import 'package:sm_task_project/presentations/view/forgot_password_screens/verify_code_screen/widgets/otp_text_field.dart';
import '../../../../core/utils/utils.dart';

class VerifyCodeScreen extends StatefulWidget {
   const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
   final ForgotPasswordController controller = Get.find();

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.startTimer();
    });
  }

  @override
  void dispose() {
    controller.disposeTimer();
    controller.dispose();
    super.dispose();
  }

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
                  "Verify Code",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width  * 0.8,
                  child: Text(
                    "Please enter the code we just sent to email pristia@gmail.com",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 44,),
                 OtpTextField(),
                const SizedBox(height: 150,),

                Obx(()=>RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Resend code in ',
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                      TextSpan(
                        text: '00:${controller.seconds.value}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ]
                  ),
                )),
                // const SizedBox(height: 30,),
                // SizedBox(
                //   width: double.infinity,
                //   height: 56,
                //   child: Utils.primaryButton(onTap: (){
                //     Get.toNamed(RouteNames.resetPasswordScreen);
                //   }, buttonText: "Continue"),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
