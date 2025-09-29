
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

 static Widget backButton(){
   return GestureDetector(
     onTap: (){
       Get.back();
     },
     child: Container(
       width: 44,
       height: 44,
       decoration: BoxDecoration(
         shape: BoxShape.circle,
         border: Border.all(color: Color(0xFFE2E8F0))
       ),
       child: Padding(
         padding: const EdgeInsets.only(left: 8.0),
         child: Icon(Icons.arrow_back_ios,color: Colors.black54,),
       ),
     ),
   );
 }

}