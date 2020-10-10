import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:id_mvc_app_framework/framework.dart';
import 'package:mvc_flutter_app_template/app/widgets/counter_slider/counter_slider.view.dart';
import 'package:mvc_flutter_app_template/config/config.dart';
import 'package:mvc_flutter_app_template/themes/themes.dart';

import 'home_screen.controller.dart';

class HomeScreen extends MvcScreen<HomeScreenController> {
  HomeScreen() : super();

  @override
  HomeScreenController initController() => HomeScreenController();

  @override
  Set<ScreenHandler> get screenLayouts => {
        ScreenHandler<HomeScreenController>(
          handler: ScreenHandler.landscapeScreenHandler,
          builder: getLandscapeLayout,
        ),
      };

  Widget getLandscapeLayout(
      ScreenParameters screenParameters, HomeScreenController controller) {
    return _scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _screenBody(CounterSliderOrient.vertical),
        ),
      ),
    );
  }

  @override
  Widget defaultScreenLayout(
      ScreenParameters screenParameters, HomeScreenController controller) {
    return _scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _screenBody(CounterSliderOrient.horizontal),
        ),
      ),
    );
  }

  List<Widget> _screenBody(CounterSliderOrient orient) => [
        Obx(() => ConstrainedBox(
              constraints: BoxConstraints(minWidth: 400),
              child: Center(
                child: Text(
                  '${controller.counter}',
                  style: styles.counterLabel,
                ),
              ),
            )),
        CounterSlider(
          orientation: orient,
        ),
      ];

  Widget _scaffold({Widget body}) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppConfig.appSettings.title),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: controller.goToSettingsView,
            )
          ],
        ),
        body: body,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: controller.increment,
        ),
      );

  @override
  Widget buildLoading() => _scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
