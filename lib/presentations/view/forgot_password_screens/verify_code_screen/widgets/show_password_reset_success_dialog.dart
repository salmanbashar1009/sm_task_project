import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/route_config/route_names.dart';
import '../../../../../core/utils/utils.dart';



void showResetPasswordSuccessDialog({required BuildContext context}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        // height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close),
              ),
            ),
            Image.asset(
              AppImages.passwordSuccess,
              width: 134,
              height: 134,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Text(
              "Success",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "Your password is successfully created",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Utils.primaryButton(onTap: (){
                Get.offAllNamed(RouteNames.signInScreen);
              }, buttonText: 'Continue'),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    ),
  );
}
