import 'package:id_mvc_app_framework/config.dart';
import 'package:id_mvc_app_framework/framework.dart';
import 'package:mvc_flutter_app_template/config/config.dart';
import 'package:mvc_flutter_app_template/model/counter.dart';
import 'package:mvc_flutter_app_template/routing/routes.dart';

class HomeScreenController extends MvcController {
  get counter => Counter().value;

  void increment() {
    Counter().value++;
  }

  void goToSettingsView() {
    Get.toNamed(AppRoutes.SETTINGS);
  }

  @override
  void onInit() async {
    await _loadData();
  }

  @override
  void onReady() async {}

  Future<void> _loadData() async {
    isLoading = true;
    final AppConfig config = await Config.ofF(APP);
    config.loadTheme();
    await Counter().load();
    await Future.delayed(3.seconds, () {});
    isLoading = false;
  }
}
