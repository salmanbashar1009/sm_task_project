

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const Color red = Color(0xFFE11E1B);
const Color black = Color(0xFF070707);
const Color brandColor = Color(0xFF382F2C);
const Color ligtGrey = Color(0xFFD0D5DD);
const Color mediumGrey = Color(0xFF667085);
const Color white = Color(0xFFFFFFFF);

PinTheme pinTheme(){
  return PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(12.r),
      fieldHeight: 56.h,
      fieldWidth: 56.w,
      activeFillColor: Colors.white,
      activeColor: Colors.green,
      inactiveFillColor: white,
      inactiveColor: ligtGrey,
      selectedFillColor: white,
      selectedColor: red

  );
}