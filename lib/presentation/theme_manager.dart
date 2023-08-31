import 'package:advance_flutter/presentation/color_manager.dart';
import 'package:flutter/material.dart';

import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      hintColor: ColorManager.grey,

      //card view theme
      cardTheme: CardTheme(
        color: ColorManager.white,
        elevation: AppSize.s4,
        shadowColor: ColorManager.grey,
      )

      //app bar theme

      //button theme

      //text theme

      //input decoration theme (text form field)
      );
}
