import 'package:flutter/material.dart';
import 'package:id_mvc_app_framework/framework.dart';

///Interface for describing custom theme parameters to be used in app via
///Get.style<IAppStyles>();
///Please see [themes.dart] for themes environment configuration
abstract class IAppStyles implements AppThemeStyles {
  TextStyle get counterLabel;
  Color get infoSnackBarColor;
  Color get roundButtonFill;
  Color get roundButtonHighlight;
  Color get roundButtonIconColor;
  Color get activeTrackColor;
  Color get inactiveTrackColor;
}
