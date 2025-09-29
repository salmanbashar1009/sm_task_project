import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.mapIcon, width: 120, height: 120),
                const SizedBox(height: 28),
                Text(
                  'Enable Location',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12,),
                Text(
                  'Kindly allow us to access your location to provide you with suggestions for nearby salons',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24,),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Utils.primaryButton(onTap: (){
                    Get.toNamed(RouteNames.selectLanguageScreen);
                  },
                     buttonText: 'Enable'),
                ),
                const SizedBox(height: 24,),
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
