import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/presentations/view/splash_screen/splash_screen.dart';
import 'package:sm_task_project/core/constant/app_images.dart';

void main() {
  testWidgets('SplashScreen displays the splash image', (WidgetTester tester) async {
    // Wrap the widget in GetMaterialApp because your SplashScreen uses Get.offAndToNamed
    await tester.pumpWidget(
      GetMaterialApp(
        home: SplashScreen(),
      ),
    );

    // Find the image by its asset path
    final splashImageFinder = find.byWidgetPredicate(
          (widget) =>
      widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == AppImages.splashCar,
    );

    // Verify that the splash image is displayed
    expect(splashImageFinder, findsOneWidget);
  });
}
