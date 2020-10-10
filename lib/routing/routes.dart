import 'package:get/get.dart';
import '../app/screens/counter_settings/counter_settings.bindings.dart';
import '../app/screens/counter_settings/counter_settings.view.dart';
import '../app/screens/home/home_screen.view.dart';
import '../app/screens/settings/setting_screen.bindings.dart';
import '../app/screens/settings/settings_screen.view.dart';

class AppRoutes {
  static const INITIAL = AppRoutes.HOME;
  static const HOME = "/home";
  static const SETTINGS = "/settings";
  static const COUNTER_SETTINGS = "/counter_settings";

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => SettingScreen(),
      transition: Transition.zoom,
      binding: SettingScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.COUNTER_SETTINGS,
      page: () => CounterSettings(),
      transition: Transition.downToUp,
      binding: CounterSettingsBinding(),
    ),
  ];
}
