import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_images.dart';
import '../../../../core/route_config/route_names.dart';
import '../../../../core/utils/utils.dart';

void showRegistrationDialog({required BuildContext context}) {
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
              AppImages.registrationSuccess,
              width: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Text(
              "Successfully Registered",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "Your account has been registered successfully, now let’s enjoy our features!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Utils.primaryButton(onTap: (){
                Get.offAllNamed(RouteNames.enableLocationScreen);
              }, buttonText: 'Continue'),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    ),
  );
}
