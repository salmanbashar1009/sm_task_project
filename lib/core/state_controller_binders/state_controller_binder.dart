import 'package:get/get.dart';
import 'package:sm_task_project/presentations/controllers/theme_controller.dart';



class StateControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}