import 'package:id_mvc_app_framework/framework.dart';
import 'package:id_mvc_app_framework/model.dart';
import '../../../model/counter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CounterSettingsController extends MvcController {
  Counter get counter => Counter();

  FormGroup _form;
  FormGroup get formSchema => _form ??= fb.group({
        'counterValue': FormControl(
          value: '${counter.value.value}',
          validators: [Validators.required, Validators.number],
        ),
        'minValue': FormControl(
          value: '${counter.minValue}',
          validators: [Validators.required, Validators.number],
        ),
        'maxValue': FormControl(
          value: '${counter.maxValue}',
          validators: [Validators.required, Validators.number],
        ),
      });

  void saveSettings() async {
    if (_form == null) throw Exception('Form is not initialized');
    Get.log('form valid: ${_form.valid}');
    if (!_form.valid) return;
    final obj = JsonObject.fromMap(_form.value);
    counter.value.value = int.parse(obj['counterValue']);
    counter.maxValue = int.parse(obj['maxValue']);
    counter.minValue = int.parse(obj['minValue']);
    Get.back();
    await counter.save();
  }
}
