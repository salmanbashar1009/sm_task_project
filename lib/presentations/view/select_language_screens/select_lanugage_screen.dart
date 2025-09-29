import 'package:flutter/material.dart';
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
      appBar: AppBar(leadingWidth: 80, leading: Utils.backButton()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is Your Mother Language',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Text(
              'Discover what is a podcast description and podcast summary.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Obx(
                      () => ListTile(
                        leading: Text(
                          language['flag']!,
                          style: TextStyle(fontSize: 24),
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
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.check, color: Colors.white,size: 16,),
                                      SizedBox(width:5),
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
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEBEBEB),
                                  borderRadius: BorderRadius.circular(8),
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
            SizedBox(height: 16),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Utils.primaryButton(
                onTap: () {
                  Get.offNamedUntil(RouteNames.postScreen, (_) => false);
                },
                buttonText: "Continue",
              ),
            ),
            SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}
