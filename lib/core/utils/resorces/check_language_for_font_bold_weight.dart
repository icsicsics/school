import 'dart:ui';

import 'package:schools/core/utils/themes/font_family.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/domain/usecases/get_language_use_case.dart';


Future<FontWeight> languageFontBoldWeight() async {

  return FontFamily.fontWeightSemiBoldEnglish;
}
