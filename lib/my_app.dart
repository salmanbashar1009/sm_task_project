import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task_project/core/state_controller_binders/state_controller_binder.dart';
import 'package:sm_task_project/presentations/view/splash_screen/splash_screen.dart';
import 'core/route_config/app_routes.dart';
import 'core/route_config/route_names.dart';
import 'core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SMT Task',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
      initialRoute: RouteNames.splashScreen,
      getPages: AppRoutes.routes,
      initialBinding: StateControllerBinder(),
    );
  }
}

