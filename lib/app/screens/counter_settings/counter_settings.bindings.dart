import 'package:get/get.dart';
import 'counter_settings.controller.dart';

class CounterSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterSettingsController());
  }
}
