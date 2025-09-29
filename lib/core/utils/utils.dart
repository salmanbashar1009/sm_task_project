
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class Utils{
 static Widget primaryButton ({required VoidCallback onTap,required String buttonText}){
   return ElevatedButton(
     onPressed: onTap,
     style: ElevatedButton.styleFrom(
       backgroundColor: AppTheme.primaryColor,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(100)),
     ),
     child: Text(
       buttonText,
       style: TextStyle(color: Colors.white, fontSize: 16),
     ),
   );
 }
}