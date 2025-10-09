import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme{
  static TextTheme  light = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: Color(0xFF2D2D2D)
    ),
    titleLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: Color(0xFF2D2D2D)
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Color(0xFF636F85)
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color:Color(0xFF2D2D2D)
    ),
  );
}