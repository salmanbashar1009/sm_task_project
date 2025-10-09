import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sm_task_project/core/route_config/route_names.dart';
import 'package:sm_task_project/presentations/view/splash_screen/splash_screen.dart';

void main() {
  testWidgets('SplashScreen shows first text widget',
          (WidgetTester tester) async {
        // Initialize ScreenUtil with a design size for testing
        await tester.pumpWidget(
          ScreenUtilInit(
            designSize: const Size(360, 690), // Common design size, adjust if needed
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return GetMaterialApp(
                initialRoute: '/',
                getPages: [
                  GetPage(name: '/', page: () => const SplashScreen()),
                  GetPage(
                    name: RouteNames.onBoardingScreen,
                    page: () => const Scaffold(body: Text('Onboarding')),
                  ),
                ],
                home: const SplashScreen(),
              );
            },
          ),
        );

        // Allow the widget tree to build
        await tester.pumpAndSettle();

        // Find the first text widget by its exact string
        final firstTextFinder = find.text('Theory test in my language');

        // Verify it's present
        expect(firstTextFinder, findsOneWidget);

        // Fast-forward to allow any delayed animations or navigation
        await tester.pump(const Duration(seconds: 3));
      });
}