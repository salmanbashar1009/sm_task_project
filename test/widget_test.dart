import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/presentations/view/splash_screen/splash_screen.dart';

void main() {
  testWidgets('SplashScreen shows correct title text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(
        home: SplashScreen(),
      ),
    );

    // Verify the text widget appears
    expect(find.text('Theory test in my language'), findsOneWidget);
  });
}