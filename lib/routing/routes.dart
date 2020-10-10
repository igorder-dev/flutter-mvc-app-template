import 'package:get/get.dart';
import 'package:mvc_flutter_app_template/app/screens/counter_settings/counter_settings.bindings.dart';
import 'package:mvc_flutter_app_template/app/screens/counter_settings/counter_settings.view.dart';
import 'package:mvc_flutter_app_template/app/screens/home/home_screen.view.dart';
import 'package:mvc_flutter_app_template/app/screens/settings/setting_screen.bindings.dart';
import 'package:mvc_flutter_app_template/app/screens/settings/settings_screen.view.dart';

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
