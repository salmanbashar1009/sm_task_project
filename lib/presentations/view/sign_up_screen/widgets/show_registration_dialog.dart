import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_images.dart';
import '../../../../core/route_config/route_names.dart';
import '../../../../core/utils/utils.dart';

void showRegistrationDialog({required BuildContext context}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
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
              width: 200.w,
              fit: BoxFit.contain,
            ),
             SizedBox(height: 24.h),
            Text(
              "Successfully Registered",
              style: Theme.of(context).textTheme.titleLarge,
            ),
             SizedBox(height: 8.h),
            Text(
              "Your account has been registered successfully, now let’s enjoy our features!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
             SizedBox(height: 24.h),
            SizedBox(
              height: 56.h,
              width: double.infinity,
              child: Utils.primaryButton(onTap: (){
                Get.offAllNamed(RouteNames.enableLocationScreen);
              }, buttonText: 'Continue'),
            ),
             SizedBox(height: 10.h,)
          ],
        ),
      ),
    ),
  );
}
