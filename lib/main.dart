import 'package:id_mvc_app_framework/config.dart';
import 'package:id_mvc_app_framework/framework.dart';

import 'config/config.dart';
import 'config/exceptions_config.dart';
import 'themes/themes.dart';

void main() {
  Config.add(key: APP, config: AppConfig(reset: false), initOnAdd: false);
  Get.defineThemes(themes: appThemes);
  runMVCApp(
    exceptionsHandlingConfig: AppErrorConfig(),
    appSetup: AppConfig.appSettings,
  );
}
