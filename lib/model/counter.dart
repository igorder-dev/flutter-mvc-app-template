import 'package:flutter/material.dart';
import 'package:id_mvc_app_framework/config.dart';
import 'package:id_mvc_app_framework/model.dart';
import 'package:get/get.dart';
import 'package:mvc_flutter_app_template/config/config.dart';
import 'package:mvc_flutter_app_template/themes/themes.dart';

enum ValueRangeCheck { ok, belowMin, aboveMax }

class Counter with ModelStateProvider {
  static final Counter _counter = Get.put(Counter._(), permanent: true);
  var value = 0.obs;
  var minValue = 0;
  var maxValue = 100;
  var _loaded = false;

  Counter._();

  bool get isLoaded => _loaded;

  Future<void> load() async {
    var config = await Config.ofF(APP);
    minValue = config.get(AppConfig.counterMin, 0);
    maxValue = config.get(AppConfig.counterMax, 100);
    value.value =
        capValueByMinMax(config.get(AppConfig.counter, 0), minValue, maxValue);

    _loaded = true;
    debounce(value, (val) async {
      await save();
    }, time: 3.seconds);

    ever(value, (val) {
      final check = checkValue(value.value, minValue, maxValue);
      if (check == ValueRangeCheck.ok) return;
      Get.log('counter changed to $val');
      final ex = CounterException(check == ValueRangeCheck.belowMin
          ? 'Counter value cannot be below $minValue'
          : 'Counter value cannot be above $maxValue');
      value.value = capValueByMinMax(val, minValue, maxValue);
      throw ex;
    });
  }

  int capValueByMinMax(int value, int min, int max) =>
      value >= min ? (value > max ? max : value) : min;

  ValueRangeCheck checkValue(int value, int min, int max) {
    return value >= min
        ? (value > max ? ValueRangeCheck.aboveMax : ValueRangeCheck.ok)
        : ValueRangeCheck.belowMin;
  }

  Future<void> save() async {
    var config = await Config.ofF(APP);
    value.value = capValueByMinMax(value.value, minValue, maxValue);
    config.set(AppConfig.counter, value.value);
    config.set(AppConfig.counterMax, maxValue);
    config.set(AppConfig.counterMin, minValue);

    await config.save();
    Get.snackbar('Info', 'counter saved.',
        backgroundColor: styles.infoSnackBarColor, icon: Icon(Icons.info));
  }

  factory Counter() {
    return _counter;
  }
}

class CounterException implements Exception {
  final _message;

  CounterException(this._message);

  String toString() {
    return "$_message";
  }
}
