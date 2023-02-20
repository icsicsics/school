import 'dart:ui';

import 'package:schools/core/utils/themes/font_family.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';


Future<FontWeight> languageFontMediumWeight() async {
  // String? _language = await SharedPreferencesManager.getAppLanguage();
  return FontFamily.fontWeightMediumEnglish;

    // _language == 'en'
    //   ?
    //   : FontFamily.fontWeightMediumArabic;
}
