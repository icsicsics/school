import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/themes/font_family.dart';

ThemeData getApplicationTheme(String language) {
  return ThemeData(
    fontFamily: language == "en"
        ? FontFamily.fontFamilyEnglish
        : FontFamily.fontFamilyArabic,
    primaryColor: ColorsManager.primaryColor,
    splashColor: ColorsManager.whiteColor,
    toggleableActiveColor: ColorsManager.primaryColor,
    unselectedWidgetColor: ColorsManager.whiteColor,
    cardTheme: const CardTheme(
      color: ColorsManager.whiteColor,
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: ColorsManager.whiteColor,
      elevation: 0,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );
}



