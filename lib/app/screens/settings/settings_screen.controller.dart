import 'package:id_mvc_app_framework/framework.dart';
import 'package:mvc_flutter_app_template/app/screens/theme_select/theme_select.dart';
import 'package:mvc_flutter_app_template/routing/routes.dart';

class SettingScreenController extends MvcController {
  final message = 'Hello from controller';

  void selectThemes() => Get.to(ThemeSelect());
  void counterSettings() => Get.toNamed(AppRoutes.COUNTER_SETTINGS);
}
