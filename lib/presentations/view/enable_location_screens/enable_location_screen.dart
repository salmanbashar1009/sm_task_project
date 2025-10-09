import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/constant/app_images.dart';
import '../../../core/route_config/route_names.dart';
import '../../../core/utils/utils.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.mapIcon, width: 120.w, height: 120.h),
                 SizedBox(height: 28.h),
                Text(
                  'Enable Location',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                 SizedBox(height: 12.h,),
                Text(
                  'Kindly allow us to access your location to provide you with suggestions for nearby salons',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                 SizedBox(height: 24.h,),
                SizedBox(
                  height: 56.h,
                  width: double.infinity,
                  child: Utils.primaryButton(onTap: (){
                    Get.toNamed(RouteNames.selectLanguageScreen);
                  },
                     buttonText: 'Enable'),
                ),
                 SizedBox(height: 24.h,),
                GestureDetector(
                  onTap: (){
                    ///call the action method
                  },
                  child: Text(
                    'Skip, Not now',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
