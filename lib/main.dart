import 'package:flutter/material.dart';
import 'package:learn_flame/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.routesGenerator,
      initialRoute: Routes.menu,
      navigatorKey: navigatorKey,
    );
  }
}
