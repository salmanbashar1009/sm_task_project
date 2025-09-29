import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/route_config/route_names.dart';
import 'package:sm_task_project/presentations/view/splash_screen/splash_screen.dart';

void main() {
  testWidgets('SplashScreen shows first text widget',
          (WidgetTester tester) async {
        // Pump the widget with GetMaterialApp to support navigation
        await tester.pumpWidget(
          GetMaterialApp(
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => const SplashScreen()),
              // Fake target route to avoid navigation errors
              GetPage(
                  name: RouteNames.onBoardingScreen,
                  page: () => const Scaffold(body: Text('Onboarding'))),
            ],
          ),
        );

        // Find the first text widget by its exact string
        final firstTextFinder = find.text('Theory test in my language');

        // Verify it's present
        expect(firstTextFinder, findsOneWidget);

        // Let Future.delayed run (2 seconds in real app)
        // but here we fast-forward
        await tester.pump(const Duration(seconds: 3));

      });
}
