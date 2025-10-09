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
            designSize: const Size(360, 690), // Adjust if needed
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

        // Allow the widget tree to build and settle any animations or async operations
        await tester.pumpAndSettle();

        // Debug: Print the widget tree to inspect what's rendered
        debugDumpApp();

        // Find the text widget by its exact string
        final firstTextFinder = find.text('Theory test in my language');

        // Check if the text is found
        if (firstTextFinder.evaluate().isEmpty) {
          // Debug: List all Text widgets to see what's actually rendered
          final allTextWidgets = find.byType(Text).evaluate().map((e) => (e.widget as Text).data).toList();
          debugPrint('Found Text widgets: $allTextWidgets');
        }

        // Verify the text is present
        expect(firstTextFinder, findsOneWidget, reason: 'Expected to find "Theory test in my language" but found none.');

        // Fast-forward to allow delayed animations or navigation (e.g., Future.delayed)
        await tester.pump(const Duration(seconds: 5));
      });
}