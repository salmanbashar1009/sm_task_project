import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Initialize Hive in memory for testing
    await Hive.initFlutter();
    await Hive.openBox('postsCache');
  });

  tearDownAll(() async {
    await Hive.deleteFromDisk();
  });

  testWidgets('Hive box "postsCache" should be open', (tester) async {
    final isOpen = Hive.isBoxOpen('postsCache');
    expect(isOpen, true);
  });
}
