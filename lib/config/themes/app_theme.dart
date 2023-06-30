import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schools/config/utils/constants.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

class AppTheme {
  String language;

  AppTheme(this.language);

  ThemeData get light {
    return ThemeData(
      fontFamily: getFontFamily(),
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
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      textTheme: TextTheme(
        titleMedium: getTextStyle(fontFamily: getFontFamily()),
        headlineSmall: getTextStyle(fontSize: 18,fontFamily: getFontFamily()),
        headlineMedium: getTextStyle(fontSize: 16,fontFamily: getFontFamily()),
        displaySmall: getTextStyle(fontSize: 14,fontFamily: getFontFamily()),
        displayMedium: getTextStyle(fontSize: 13,fontFamily: getFontFamily()),
        titleSmall: getTextStyle(fontSize: 13,fontFamily: getFontFamily(), fontWeight: Constants.medium),
        bodyLarge: getTextStyle(fontSize: 13, fontFamily: getFontFamily(),fontWeight: Constants.regular),
        labelLarge: getTextStyle(fontSize: 12, fontFamily: getFontFamily(),fontWeight: Constants.regular),
      ),
    );
  }

  TextStyle getTextStyle({
    double fontSize = 24,
    FontWeight fontWeight = Constants.bold,
    String fontFamily = Constants.fontFamilyEnglish,
    Color color = ColorsManager.primaryColor,
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color);
  }

  String getFontFamily() => language == "en"
      ? Constants.fontFamilyEnglish
      : Constants.fontFamilyArabic;
}
