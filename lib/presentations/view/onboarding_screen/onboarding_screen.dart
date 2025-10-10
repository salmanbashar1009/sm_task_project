import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/presentations/view/onboarding_screen/widgets/onboarding_page.dart';

import '../../../core/route_config/route_names.dart';
import '../../../core/utils/utils.dart';
import '../../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: controller.onboardingData.length,
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      controller.changeCurrentIndex(index);
                    });
                  },
                  itemBuilder: (context, index) {
                    final data = controller.onboardingData[index];
                    return OnboardingPage(
                      image: data['image']!,
                      title: data['title']!,
                      description: data['description']!,
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              // Page indicator
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(controller.onboardingData.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      height: 10,
                      width: controller.currentIndex.value == index ? 20.w : 10.w,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == index
                            ? Colors.blue
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Obx(() {
                  final isLastPage = controller.currentIndex.value ==
                      controller.onboardingData.length - 1;
                  return SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: Utils.primaryButton(
                      onTap: () {
                        controller.nextPage();
                        if (!isLastPage) {
                          controller.changeCurrentIndex(controller.currentIndex.value + 1);
                        } else {
                          Get.offAllNamed(RouteNames.signInScreen);
                        }
                      },
                      buttonText: controller.onboardingData[controller.currentIndex.value]
                      ['buttonText']!,
                    ),
                  );
                }),
              ),
              SizedBox(height: 56.h),
            ],
          ),
        ),
      ),
    );
  }
}
