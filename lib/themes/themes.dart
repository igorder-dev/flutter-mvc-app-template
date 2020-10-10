import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:id_mvc_app_framework/framework.dart';
import 'theme.contract.dart';

final List<AppTheme> appThemes = [mainTheme, darkTheme, darkPinkTheme];

///Global property that gives access to linked IAppStyles implementation for
///currently selected theme.
IAppStyles get styles => Get.style<IAppStyles>();

final mainTheme = AppTheme.light().copyWith(
    themeID: 'Main theme',
    description: 'Core default theme',
    styles: MainAppStyles());

final darkTheme = AppTheme.dark().copyWith(
    themeID: 'Dark theme',
    description: 'Default dark theme',
    styles: DarkAppStyles());

final darkPinkTheme = AppTheme(
    themeID: 'Dark Pink theme',
    description: 'dark theme with pink',
    styles: DarkPinkAppStyles(),
    themeData: ThemeData.dark().copyWith(
        primaryColor: Colors.pink,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.pink,
        )));

///Implementation of IAppStyles
///Consider to move to separate file if IAppStyles contains a lot of overrides
class MainAppStyles extends IAppStyles {
  @override
  TextStyle get counterLabel => TextStyle(
        fontSize: 200.0,
        fontWeight: FontWeight.bold,
      );

  @override
  Color get infoSnackBarColor => Colors.green[200];

  @override
  Color get roundButtonHighlight => Get.themCtrl.theme.themeData.highlightColor;

  @override
  Color get roundButtonFill => Get.themCtrl.theme.themeData.primaryColor;

  @override
  Color get roundButtonIconColor =>
      Get.themCtrl.theme.themeData.scaffoldBackgroundColor;

  @override
  Color get activeTrackColor => null;

  @override
  Color get inactiveTrackColor => null;
}

class DarkAppStyles extends IAppStyles {
  @override
  TextStyle get counterLabel => TextStyle(
        fontSize: 200.0,
      );
  @override
  Color get infoSnackBarColor => Colors.green[500];

  @override
  Color get roundButtonHighlight => Get.currTheme.highlightColor;

  @override
  Color get roundButtonFill => Colors.cyanAccent;

  @override
  Color get roundButtonIconColor =>
      Get.themCtrl.theme.themeData.scaffoldBackgroundColor;

  @override
  Color get activeTrackColor => Colors.white;

  @override
  Color get inactiveTrackColor => roundButtonHighlight;
}

class DarkPinkAppStyles extends IAppStyles {
  @override
  TextStyle get counterLabel => TextStyle(
        fontSize: 200.0,
        color: Colors.pink[200],
      );
  @override
  Color get infoSnackBarColor => Colors.amberAccent[200];

  @override
  Color get roundButtonHighlight => Get.themCtrl.theme.themeData.highlightColor;

  @override
  Color get roundButtonFill => Get.themCtrl.theme.themeData.primaryColor;

  @override
  Color get roundButtonIconColor =>
      Get.themCtrl.theme.themeData.scaffoldBackgroundColor;

  @override
  Color get activeTrackColor => Colors.pink;

  @override
  Color get inactiveTrackColor => Colors.pink[200];
}
