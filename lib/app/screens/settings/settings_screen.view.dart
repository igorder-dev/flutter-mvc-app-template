import 'package:flutter/material.dart';
import 'package:id_mvc_app_framework/framework.dart';

import 'settings_screen.controller.dart';

class SettingScreen extends MvcScreen<SettingScreenController> {
  SettingScreen() : super();
  @override
  Widget defaultScreenLayout(
      ScreenParameters screenParameters, SettingScreenController controller) {
    return _scaffold(
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

  Widget _scaffold({Widget body}) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings'),
        ),
        body: body,
      );
}
