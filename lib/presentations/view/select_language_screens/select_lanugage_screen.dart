import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/route_config/route_names.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/utils.dart';
import '../../controllers/select_language_controller.dart';

class SelectLanguageScreen extends StatelessWidget {
  final SelectLanguageController controller = Get.find();

  final List<Map<String, String>> languages = [
    {'name': 'English (US)', 'flag': '🇺🇸'},
    {'name': 'Indonesia', 'flag': '🇮🇩'},
    {'name': 'Afghanistan', 'flag': '🇦🇫'},
    {'name': 'Algeria', 'flag': '🇩🇿'},
    {'name': 'Malaysia', 'flag': '🇲🇾'},
    {'name': 'Arabic', 'flag': '🇦🇪'},
    {'name': 'English (US)', 'flag': '🇺🇸'},
    {'name': 'Indonesia', 'flag': '🇮🇩'},
    {'name': 'Afghanistan', 'flag': '🇦🇫'},
    {'name': 'Algeria', 'flag': '🇩🇿'},
    {'name': 'Malaysia', 'flag': '🇲🇾'},
    {'name': 'Arabic', 'flag': '🇦🇪'},
  ];

  SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leadingWidth: 80.w, leading: Utils.backButton()),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is Your Mother Language',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8.h),
            Text(
              'Discover what is a podcast description and podcast summary.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 24.h),
                    child: Obx(
                      () => ListTile(
                        leading: Text(
                          language['flag']!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),

                        title: Text(
                          language['name']!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing:
                            controller.selectedLanguage.value ==
                                language['name']
                            ? GestureDetector(
                                onTap: null,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryColor,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.check, color: Colors.white,size: 16.r,),
                                      SizedBox(width:5.w),
                                      Text(
                                        'Selected',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            :GestureDetector(
                              onTap: () => controller.selectLanguage(
                                language['name']!,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEBEBEB),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  'Select',
                                  style: TextStyle(color: Color(0xFFAEAEB2)),
                                ),
                              ),
                            )


                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 56.h,
              width: double.infinity,
              child: Utils.primaryButton(
                onTap: () {
                  Get.offNamedUntil(RouteNames.postScreen, (_) => false);
                },
                buttonText: "Continue",
              ),
            ),
            SizedBox(height: 56.h),
          ],
        ),
      ),
    );
  }
}
