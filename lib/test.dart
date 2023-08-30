import 'package:advance_flutter/app/app.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  void updateAppState() {
    Myapp.instance.appState++;
  }

  void getAppState() {
    print(Myapp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
