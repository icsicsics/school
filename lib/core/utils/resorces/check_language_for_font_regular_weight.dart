import 'dart:ui';

import 'package:schools/core/utils/themes/font_family.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';


Future<FontWeight> languageFontRegularWeight() async {
  // String? _language = await SharedPreferencesManager.getAppLanguage();
  return FontFamily.fontWeightRegularEnglish;
      // : FontFamily.fontWeightRegularArabic;
}
