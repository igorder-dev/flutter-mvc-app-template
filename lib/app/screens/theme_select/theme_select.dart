import 'package:flutter/material.dart';
import 'package:mvc_flutter_app_template/app/widgets/themes_list/theme_list.view.dart';

class ThemeSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _scaffold(body: ThemesList());
  }

  Widget _scaffold({Widget body}) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Themes selection'),
        ),
        body: body,
      );
}
