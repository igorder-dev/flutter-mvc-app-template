import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:id_mvc_app_framework/framework.dart';
import 'package:mvc_flutter_app_template/app/screens/counter_settings/counter_settings.controller.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CounterSettings extends MvcScreen<CounterSettingsController> {
  @override
  Widget defaultScreenLayout(
      ScreenParameters screenParameters, CounterSettingsController controller) {
    return _scaffold(
      body: _settingsForm(screenParameters),
    );
  }

  Widget _settingsForm(ScreenParameters screenParameters) =>
      ReactiveFormBuilder(
        form: () => controller.formSchema,
        builder: (context, form, child) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _textField(
                  labelText: 'Counter Value',
                  formControlName: 'counterValue',
                  textInputAction: TextInputAction.next,
                ),
                if (screenParameters.screenOrientation == Orientation.portrait)
                  ..._minmaxFieldsPortrait(),
                if (screenParameters.screenOrientation == Orientation.landscape)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _minmaxFieldsLandscape(),
                  ),
                RaisedButton(
                  child: Text('Save settings'),
                  color: Get.currTheme.primaryColor,
                  onPressed: controller.saveSettings,
                ),
              ],
            ),
          ),
        ),
      );

  List<Widget> _minmaxFieldsPortrait() => [
        _textField(
          labelText: 'Minimum Value',
          formControlName: 'minValue',
          textInputAction: TextInputAction.next,
        ),
        _textField(
          labelText: 'Maximum Value',
          formControlName: 'maxValue',
          textInputAction: TextInputAction.none,
        ),
      ];

  List<Widget> _minmaxFieldsLandscape() => [
        Expanded(
          child: _textField(
            labelText: 'Minimum Value',
            formControlName: 'minValue',
            textInputAction: TextInputAction.next,
          ),
        ),
        Expanded(
          child: _textField(
            labelText: 'Maximum Value',
            formControlName: 'maxValue',
            textInputAction: TextInputAction.none,
          ),
        ),
      ];
  Widget _textField(
          {String formControlName,
          String labelText,
          TextInputAction textInputAction}) =>
      ReactiveTextField(
        formControlName: formControlName,
        textInputAction: textInputAction,
        validationMessages: {
          ValidationMessage.number: 'Value must be a number',
          ValidationMessage.required: 'Value must not be empty'
        },
        decoration: InputDecoration(
          labelText: labelText,
        ),
      );

  Widget _scaffold({Widget body}) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Counter Settings'),
        ),
        body: body,
      );
}
