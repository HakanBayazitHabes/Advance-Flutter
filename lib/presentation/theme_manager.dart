import 'package:advance_flutter/presentation/color_manager.dart';
import 'package:advance_flutter/presentation/styles_manager.dart';
import 'package:flutter/material.dart';

import 'font_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    hintColor: ColorManager.grey,
    splashColor: ColorManager.primaryOpacity70,

    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.grey,
    ),

    //app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: getRegularTextStyle(
            color: ColorManager.white, fontSize: FontSize.s12)),

    //button theme

    //text theme

    //input decoration theme (text form field)
  );
}
