import 'package:flutter/material.dart';

import 'package:id_mvc_app_framework/framework.dart';
import '../../../app/widgets/counter_slider/counter_slider.controller.dart';
import '../../../themes/themes.dart';

enum CounterSliderOrient { horizontal, vertical }

class CounterSlider extends MvcWidget<CounterSliderController> {
  CounterSlider({
    Key key,
    this.orientation = CounterSliderOrient.horizontal,
  }) : super(key: key);

  final CounterSliderOrient orientation;

  @override
  Widget buildMain() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: _orientationLayout(
          children: [
            _roundButton(
              icon: Icons.expand_more,
              callback: controller.decrement,
            ),
            Obx(
              () => SliderTheme(
                child: Slider(
                  value: controller.counterAsDouble,
                  onChanged: controller.setValue,
                  min: controller.counter.minValue.toDouble(),
                  max: controller.counter.maxValue.toDouble(),
                ),
                data: SliderTheme.of(Get.context).copyWith(
                  thumbColor: styles.roundButtonFill,
                  overlayColor: styles.roundButtonHighlight,
                  activeTrackColor: styles.activeTrackColor,
                  inactiveTrackColor: styles.inactiveTrackColor,
                ),
              ),
            ),
            _roundButton(
              icon: Icons.expand_less,
              callback: controller.increment,
            ),
          ],
        ),
      );

  Widget _roundButton({IconData icon, VoidCallback callback}) =>
      FloatingActionButton(
        heroTag: UniqueKey(),
        child: Icon(
          icon,
          size: 40,
          color: styles.roundButtonIconColor,
        ),
        focusColor: styles.roundButtonHighlight,
        backgroundColor: styles.roundButtonFill,
        onPressed: callback,
      );

  Widget _orientationLayout({List<Widget> children}) =>
      orientation == CounterSliderOrient.horizontal
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children.reversed.toList(),
            );

  @override
  Widget buildLoading() => Center(
        child: CircularProgressIndicator(),
      );

  @override
  CounterSliderController initController() => CounterSliderController();
}
