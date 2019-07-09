import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier{
  Brightness _themeBrightness;

  AppTheme(this._themeBrightness);

  Brightness getBrightness() => _themeBrightness;

  setBrightness(Brightness themeData){
    _themeBrightness = themeData;

    notifyListeners();
  }
}