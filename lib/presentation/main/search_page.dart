import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPAgeState();
}

class _SearchPAgeState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.search),
    );
  }
}
