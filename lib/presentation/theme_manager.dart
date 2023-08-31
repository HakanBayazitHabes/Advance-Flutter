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

      buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70,
      ),

      //elevated Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularTextStyle(color: ColorManager.white),
          primary: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
      ),

      //text theme
      textTheme: TextTheme(
        headline1: getSemiBoldTextStyle(
            color: ColorManager.darkPrimary, fontSize: FontSize.s16),
        subtitle1: getMediumTextStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
        caption: getRegularTextStyle(color: ColorManager.grey),
        bodyText1: getRegularTextStyle(color: ColorManager.grey1),
      )

      //input decoration theme (text form field)


      );
}
