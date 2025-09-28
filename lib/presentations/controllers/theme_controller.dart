import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final RxBool isDarkMode = false.obs;

  @override
  void init() {
    super.onInit();
    _loadTheme();
  }

  Future<void> _loadTheme() async{
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('dark_mode') ?? false;
  }

  Future<void> toggleTheme()async{
  isDarkMode.value = !isDarkMode.value;
  // update();
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('dark_mode', isDarkMode.value);
  }

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

}
