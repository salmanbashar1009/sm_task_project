import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sm_task_project/core/route_config/app_routes.dart';
import 'package:sm_task_project/core/route_config/route_names.dart';
import 'package:sm_task_project/presentations/view/splash_screen/splash_screen.dart';

void main() {
  testWidgets('SplashScreen displays UI and navigates after delay', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 720),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            initialRoute: RouteNames.splashScreen,
            getPages:AppRoutes.routes,
            home: child,
          );
        },
        child: const SplashScreen(),
      ),
    );

    // // Settle animations and initial build
    // await tester.pumpAndSettle();

    // Check for main text
    expect(find.text('Theory test in my language'), findsOneWidget);

    // Check for description text
    expect(
      find.text('I must write the real test will be in English language and this app just helps you to understand the materials in your language'),
      findsOneWidget,
    );

    // Check for CircularProgressIndicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate waiting for navigation delay
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

  });
}