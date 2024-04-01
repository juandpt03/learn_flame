import 'package:flutter/material.dart';
import 'package:learn_flame/lesson_menu.dart';
import 'package:learn_flame/my_game.dart';

class Routes {
  static const String menu = '/';
  static const String lesson1 = '/lesson1';

  static Route routesGenerator(RouteSettings settings) {
    MaterialPageRoute buildRoute(Widget widget) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => widget,
      );
    }

    switch (settings.name) {
      case menu:
        return buildRoute(const LessonMenu());
      case lesson1:
        return buildRoute(MyGameWidget(game: MyGame()));
      default:
        return buildRoute(const LessonMenu());
    }
  }
}
