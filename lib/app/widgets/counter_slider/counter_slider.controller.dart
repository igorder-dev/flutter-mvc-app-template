import 'package:id_mvc_app_framework/framework.dart';
import '../../../model/counter.dart';

class CounterSliderController extends MvcController {
  Counter get counter => Counter();
  double get counterAsDouble => counter.value.toDouble();

  void increment() => Counter().value++;
  void decrement() => Counter().value--;
  void setValue(double val) {
    counter.value.value = val.toInt();
    update();
  }

  @override
  void onReady() {
    isLoading = !Counter().isLoaded;
    once(Counter().value, (val) {
      Get.log(Counter().value.string);
      isLoading = !Counter().isLoaded;
    });
  }
}
