import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/presentations/view/onboarding_screen/widgets/onboarding_page.dart';

import '../../controllers/onboarding_controller.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: controller.onboardingData.length,
                  onPageChanged: controller.changeCurrentIndex,
                  itemBuilder: (context, index) {
                    final data = controller.onboardingData[index];
                    return OnboardingPage(image: data['image']!, title: data['title']!, description: data['description']!);
                  },
                ),
              ),
              SizedBox(height: 16),
              // Page Indicator
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(controller.onboardingData.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 10,
                      width: controller.currentIndex.value == index ? 20 : 10,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == index
                            ? Colors.blue
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 24),
              Obx(
                    () {
                  final isLastPage =
                      controller.currentIndex.value == controller.onboardingData.length - 1;
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!isLastPage) {
                          controller.changeCurrentIndex(controller.currentIndex.value + 1);
                        } else {
                          // Navigate to login or home screen
                          // Get.toNamed('/login');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        controller.onboardingData[controller.currentIndex.value]['buttonText']!,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }
}

