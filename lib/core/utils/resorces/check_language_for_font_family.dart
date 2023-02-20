import 'package:schools/core/utils/themes/font_family.dart';


Future<String> languageFontFamily() async {
  // String? _language = await SharedPreferencesManager.getAppLanguage();
  return FontFamily.fontFamilyEnglish;
    //
    // _language == 'en'
    //   ?
    //   : FontFamily.fontFamilyArabic;
}
