import 'package:get/get.dart';

import 'settings_screen.controller.dart';

class SettingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingScreenController());
  }
}
