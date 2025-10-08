import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/models/post_model.dart';
import 'core/services/cache_service.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize hive
  // final appDocumentDir = await getApplicationDocumentsDirectory();
  // await Hive.initFlutter(appDocumentDir.path);
  await Hive.initFlutter();
  Hive.registerAdapter(PostAdapter());
  // // await Hive.openBox("postsCache");
  await CacheService.cacheService.init();



  runApp(const MyApp());
}


