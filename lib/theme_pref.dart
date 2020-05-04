import 'package:shared_preferences/shared_preferences.dart';

class ThemeModePreferences {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
    print('the setter method from theme pref');
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('getting the value of theme pref ${prefs.getBool(THEME_STATUS)}');
    return prefs.getBool(THEME_STATUS)?? false  ;
  }
}
