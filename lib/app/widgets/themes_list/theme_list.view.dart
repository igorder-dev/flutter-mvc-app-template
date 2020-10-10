import 'package:flutter/material.dart';
import 'package:id_mvc_app_framework/framework.dart';
import 'theme_list.controller.dart';

class ThemesList extends MvcWidget<ThemesListController> {
  static const MIN_WIDTH = 100.0;
  static const MIN_HEIGHT = 100.0;
  static const CIRCLE_RADIUS = 40.0;

  final minWidth;
  final minHeight;
  final List<AppTheme> themes;

  ThemesList({
    this.themes,
    this.minWidth = MIN_WIDTH,
    this.minHeight = MIN_HEIGHT,
  }) : super();

  @override
  Widget buildMain() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth, minHeight: minHeight),
      child: ListView.builder(
        key: controller.unikey,
        itemCount: controller.themesCount,
        itemBuilder: _getThemeItem,
      ),
    );
  }

  Widget _getThemeItem(BuildContext context, int index) => ListTile(
        onTap: () => controller.selectThemeItem(index),
        key: UniqueKey(),
        title: Text(
          controller.themes[index].themeID,
          style: Get.textTheme.headline6
              .copyWith(color: controller.theme.textTheme.headline6.color),
        ),
        subtitle: Text(
          controller.themes[index].description,
          style: Get.textTheme.caption
              .copyWith(color: controller.theme.textTheme.caption.color),
        ),
        leading: _getThemeCircePreview(index),
        trailing: controller.isCurrentTheme(index)
            ? Icon(
                Icons.check,
                size: CIRCLE_RADIUS,
              )
            : null,
        selected: controller.isCurrentTheme(index),
        selectedTileColor: controller.theme.focusColor,
      );

  Widget _getThemeCircePreview(int index) => Container(
        child: SizedBox(
          width: CIRCLE_RADIUS,
          height: CIRCLE_RADIUS,
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: controller.themes[index].themeData.primaryColor,
            border: Border.all(
              color:
                  controller.themes[index].themeData.textTheme.subtitle1.color,
              width: 5,
            )),
      );

  @override
  ThemesListController initController() =>
      ThemesListController(themes: this.themes);
}
