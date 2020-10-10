import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:id_mvc_app_framework/config.dart';
import 'package:id_mvc_app_framework/framework.dart';
import 'package:mvc_flutter_app_template/config/config.dart';

class ThemesListController extends MvcController {
  Key unikey;
  final List<AppTheme> _themes;
  List<AppTheme> get themes => _themes;
  int get themesCount => _themes.length;
  bool isCurrentTheme(int index) => themes[index] == Get.themCtrl.theme;

  ThemeData get theme {
    return Get.themCtrl.theme.themeData;
  }

  Future<void> selectThemeItem(int index) async {
    if (isCurrentTheme(index)) return;
    unikey = UniqueKey();
    Get.themCtrl.setByAppTheme(themes[index]);
    update();

    final AppConfig config = await Config.ofF(APP);
    config.saveTheme();
  }

  ThemesListController({List<AppTheme> themes})
      : _themes = themes ?? Get.themCtrl.allThemes;
}
