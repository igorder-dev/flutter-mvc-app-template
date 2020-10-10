import 'package:flutter/material.dart';
import '../../../app/widgets/app_scaffold.dart';
import '../../../app/widgets/themes_list/theme_list.view.dart';

class ThemeSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Themes selection',
      body: ThemesList(),
    );
  }
}
