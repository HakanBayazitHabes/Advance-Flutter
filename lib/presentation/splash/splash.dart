import 'package:advance_flutter/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
