import 'package:flutter/material.dart';
import 'package:learn_flame/routes.dart';

class LessonMenu extends StatelessWidget {
  const LessonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: const [
          SizedBox(
            height: 350,
            child: ButtonItem(
              title: 'Lesson 1: Hello World',
              route: Routes.lesson1,
            ),
          ),
        ],
      ),
    ));
  }
}

class ButtonItem extends StatelessWidget {
  final String title;
  final String route;

  const ButtonItem({
    super.key,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(route);
          },
          child: Text(title),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
