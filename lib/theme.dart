import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier{
  ThemeData _themeData;

  AppTheme(this._themeData);

  ThemeData getTheme() => _themeData;

  setTheme(ThemeData themeData){
    _themeData = themeData;

    notifyListeners();
  }
}