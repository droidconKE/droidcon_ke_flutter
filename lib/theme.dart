import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme with ChangeNotifier {
  Brightness _themeBrightness;
  SharedPreferences prefs;

  AppTheme(this._themeBrightness) {
    init();
  }

  init() async {
    prefs = await SharedPreferences.getInstance();
    var isDark = prefs.getBool("DARK_THEME") ?? false;
    _themeBrightness = isDark ? Brightness.dark : Brightness.light;
    notifyListeners();
  }

  Brightness getBrightness() => _themeBrightness;

  setBrightness(Brightness themeData) {
    _themeBrightness = themeData;
    prefs.setBool("DARK_THEME", _themeBrightness == Brightness.dark);
    notifyListeners();
  }
}
