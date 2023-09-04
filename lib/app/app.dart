import 'package:advance_flutter/presentation/resources/routes_manager.dart';
import 'package:advance_flutter/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class Myapp extends StatefulWidget {
  Myapp._internal(); // private named constructor
  int appState = 0;
  static final Myapp instance = Myapp._internal(); // singleton instance

  factory Myapp() => instance; // factory for instance

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
