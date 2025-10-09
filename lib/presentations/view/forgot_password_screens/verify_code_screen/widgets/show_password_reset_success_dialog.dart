import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/route_config/route_names.dart';
import '../../../../../core/utils/utils.dart';



void showResetPasswordSuccessDialog({required BuildContext context}) {
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
              AppImages.passwordSuccess,
              width: 134.w,
              height: 134.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 24.h),
            Text(
              "Success",
              style: Theme.of(context).textTheme.titleLarge,
            ),
             SizedBox(height: 8.h),
            Text(
              "Your password is successfully created",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
             SizedBox(height: 24.h),
            SizedBox(
              height: 56.h,
              width: double.infinity,
              child: Utils.primaryButton(onTap: (){
                Get.offAllNamed(RouteNames.signInScreen);
              }, buttonText: 'Continue'),
            ),
             SizedBox(height: 10.h,)
          ],
        ),
      ),
    ),
  );
}
