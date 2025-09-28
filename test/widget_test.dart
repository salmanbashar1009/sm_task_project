import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/presentations/view/splash_screen/splash_screen.dart';

void main() {
  testWidgets('SplashScreen displays the splash image', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: SplashScreen(),
      ),
    );

    // Verify splash image is shown
    expect(find.byType(Image), findsOneWidget);

    // Simulate time passing for the timer (2 seconds)
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Optionally, check navigation or next screen here
  });
}