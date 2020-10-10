import 'package:id_mvc_app_framework/config.dart';
import 'package:id_mvc_app_framework/framework.dart';
import '../../../config/config.dart';
import '../../../model/counter.dart';
import '../../../routing/routes.dart';

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
