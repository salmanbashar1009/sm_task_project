import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1B6EF7);
  static const Color secondaryColor = Color(0xFF03DAC5);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFB00020);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);
  static const Color onSecondaryColor = Color(0xFF000000);
  static const Color onBackgroundColor = Color(0xFF000000);
  static const Color onSurfaceColor = Color(0xFF000000);
  static const Color onErrorColor = Color(0xFFFFFFFF);

  static const Color borderColor = Color(0xFFCBD5E1);



  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: primaryColor,
      hintColor: secondaryColor,
      scaffoldBackgroundColor: Colors.white,
      cardColor: surfaceColor,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: onPrimaryColor),
        titleTextStyle: TextStyle(
          color: onPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textTheme: AppTextTheme.light,
    );
  }

}