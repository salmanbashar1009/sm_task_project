import 'package:get/get.dart';

class SelectLanguageController extends GetxController {
  var selectedLanguage = 'English (US)'.obs;

  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }
}