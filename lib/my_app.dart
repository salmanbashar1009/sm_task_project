import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/state_controller_binders/state_controller_binder.dart';
import 'package:sm_task_project/presentations/controllers/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SMT Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeController().theme,
      home: PostView(),
      initialBinding: StateControllerBinder(),
    );
  }
}
class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

