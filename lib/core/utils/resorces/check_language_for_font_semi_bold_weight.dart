import 'dart:ui';

import 'package:schools/core/utils/themes/font_family.dart';


Future<FontWeight> languageFontSemiBoldWeight() async {
  // String? _language = await SharedPreferencesManager.getAppLanguage();
  return  FontFamily.fontWeightSemiBoldEnglish;

    // _language == 'en'
    //   ?
    //   : FontFamily.fontWeightSemiBoldArabic;
}
