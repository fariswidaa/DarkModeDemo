import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:DarkModeDemo/theme_pref.dart';

class ThemeChanger extends ChangeNotifier {

  ThemeModePreferences themeModePreferences = ThemeModePreferences();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void darkThemeSetter(bool value) {
    _darkTheme = value;
    print('the value from the darkThemeSetter $_darkTheme');
    themeModePreferences.setDarkTheme(value);
    notifyListeners();
  }
  
}