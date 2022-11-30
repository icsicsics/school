import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schools/core/utils/resorces/check_language_for_font_family.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';


class AppTheme {
  MaterialColor kPrimaryColor = const MaterialColor(
    0xFF4F008C,
    <int, Color>{
      50: ColorsManager.primaryColor,
      100: ColorsManager.primaryColor,
      200: ColorsManager.primaryColor,
      300: ColorsManager.primaryColor,
      400: ColorsManager.primaryColor,
      500: ColorsManager.primaryColor,
      600: ColorsManager.primaryColor,
      700: ColorsManager.primaryColor,
      800: ColorsManager.primaryColor,
      900: ColorsManager.primaryColor,
    },
  );

  Future<ThemeData> get themeDataLight async {
    return ThemeData(
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: ColorsManager.backgroundColor,
      brightness: Brightness.light,
      primaryColor: ColorsManager.primaryColor,
      secondaryHeaderColor: ColorsManager.secondaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: ColorsManager.secondaryColor, // Your accent color
      ),
      primarySwatch: kPrimaryColor,
      fontFamily: await languageFontFamily(),
    );
  }

  AppBarTheme get appBarTheme {
    return const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          systemStatusBarContrastEnforced: false),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorsManager.primaryColor),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: ColorsManager.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
