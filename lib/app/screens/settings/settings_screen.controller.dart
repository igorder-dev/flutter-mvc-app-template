import 'package:id_mvc_app_framework/framework.dart';
import '../../../app/screens/theme_select/theme_select.dart';
import '../../../routing/routes.dart';

class SettingScreenController extends MvcController {
  final message = 'Hello from controller';

  void selectThemes() => Get.to(ThemeSelect());
  void counterSettings() => Get.toNamed(AppRoutes.COUNTER_SETTINGS);
}
