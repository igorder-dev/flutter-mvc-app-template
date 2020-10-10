import 'package:flutter/material.dart';
import 'package:id_mvc_app_framework/framework.dart';
import '../../../app/widgets/app_scaffold.dart';

import 'settings_screen.controller.dart';

class SettingScreen extends MvcScreen<SettingScreenController> {
  SettingScreen() : super();
  @override
  Widget defaultScreenLayout(
      ScreenParameters screenParameters, SettingScreenController controller) {
    return AppScaffold(
      title: 'Settings',
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.format_paint),
            title: Text('Select Theme'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: controller.selectThemes,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Counter Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: controller.counterSettings,
          ),
        ],
      ),
    );
  }
}
