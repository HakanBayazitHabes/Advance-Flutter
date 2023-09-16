import 'package:advance_flutter/presentation/main/search_page.dart';
import 'package:advance_flutter/presentation/main/settings_page.dart';
import 'package:advance_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'notification_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    NotificationPage(),
    SettingPage(),
  ];

  var _title = AppStrings.home;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: pages[_currentIndex],
    );
  }
}
