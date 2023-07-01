import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/domain/usecases/get_language_use_case.dart';
import 'dart:ui' as ui;


final Locale defaultSupportedLocale = ui.window.locale;

class LocalizationCubit extends Cubit<Locale> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;

  LocalizationCubit(this._getLanguageCodeUseCase)
      : super(defaultSupportedLocale) {
    _setDefaultLanguage();
  }

  void _setDefaultLanguage() async {
    String language = await _getLanguageCodeUseCase() ?? defaultSupportedLocale.languageCode;
    await SharedPreferencesManager.setLanguageCode(language);
    emit(Locale(language));

  }
}
