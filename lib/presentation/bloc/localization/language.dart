import 'package:flutter/material.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class Languages with ChangeNotifier {


  Locale _currentLocal =  Locale(SharedPreferencesManager.getAppLanguage().toString()) ;

  Locale get currentLocal => _currentLocal;

  changeLanguage(String locale) {
    this._currentLocal =  Locale(locale);
    notifyListeners();
  }
}
