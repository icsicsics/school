import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/domain/usecases/save_language_use_case.dart';
import 'package:schools/domain/usecases/get_language_use_case.dart';


final Locale defaultSupportedLocale = S.delegate.supportedLocales.first;

class LocalizationCubit extends Cubit<Locale> {
  final SaveLanguageCodeUseCase _saveLanguageCodeUseCase;
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;

  LocalizationCubit(this._getLanguageCodeUseCase, this._saveLanguageCodeUseCase)
      : super(defaultSupportedLocale) {
    _setDefaultLanguage();
  }

  void _setDefaultLanguage() async {
    String language = await _getLanguageCodeUseCase() ?? "en";
    await _saveLanguageCodeUseCase(language);
    emit(Locale(language));

  }
}
