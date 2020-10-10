import 'package:flutter/material.dart';
import 'package:id_mvc_app_framework/config.dart';
import 'package:id_mvc_app_framework/framework.dart';
import '../routing/routes.dart';
import '../themes/themes.dart';

const String config_json_file = 'config.json';

const String APP = 'APP';

class AppConfig extends JsonConfigManager {
  static const String theme = 'theme';
  static const String counter = "counter";
  static const String counterMin = "counterMin";
  static const String counterMax = "counterMax";

  AppConfig({bool reset = false})
      : super.fromAsset(config_json_file, reset: reset);

  static final MvcAppSettings appSettings = MvcAppSettings(
    title: 'Sample mvc app',
    initialRoute: AppRoutes.INITIAL,
    getPages: AppRoutes.routes,
  );

  Future<void> saveTheme() async {
    final themeId = Get.themCtrl.theme.themeID;
    this.set(AppConfig.theme, themeId);
    await this.save();
    Get.snackbar('Info', 'theme saved.',
        backgroundColor: styles.infoSnackBarColor, icon: Icon(Icons.info));
  }

  void loadTheme() {
    try {
      Get.themCtrl.setTheme(this.getString(AppConfig.theme, mainTheme.themeID));
    } catch (E) {} finally {
      Get.rootController.restartApp();
    }
  }
}
