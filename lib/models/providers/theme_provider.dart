import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  MaterialColor primaryColor = Colors.pink;
  MaterialColor accentColor = Colors.amber;

  var tm = ThemeMode.system;
  String themeText = 's';

  onChanged(color, n) async {
    n == 1
        ? primaryColor = _toMaterialColor(color.hashCode)
        : accentColor = _toMaterialColor(color.hashCode);
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('primaryColor', primaryColor.value);
    prefs.setInt('accentColor', accentColor.value);
  }

  getThemeColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    primaryColor = _toMaterialColor(prefs.getInt('primaryColor') ?? 0xFFE91E63);
    accentColor = _toMaterialColor(prefs.getInt('accentColor') ?? 0xFFFFC107);
    notifyListeners();
  }

  MaterialColor _toMaterialColor(colorValue) {
    return MaterialColor(
      colorValue,
      <int, Color>{
        50: const Color(0xFFFCE4EC),
        100: const Color(0xFFF8BBD0),
        200: const Color(0xFFF48FB1),
        300: const Color(0xFFF06292),
        400: const Color(0xFFEC407A),
        500: Color(colorValue),
        600: const Color(0xFFD81B60),
        700: const Color(0xFFC2185B),
        800: const Color(0xFFAD1457),
        900: const Color(0xFF880E4F),
      },
    );
  }

  void themeModeChang(newThemeVal) async {
    tm = newThemeVal;
    _getThemText(tm);
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeText', themeText);
  }

  _getThemText(ThemeMode tm) {
    if (tm == ThemeMode.dark)
      themeText = 'd';
    else if (tm == ThemeMode.light)
      themeText = 'l';
    else if (tm == ThemeMode.system) themeText = 's';
  }

  getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeText = prefs.getString('themeText') ?? 's';
    if (themeText == 'd')
      tm = ThemeMode.dark;
    else if (themeText == 'l')
      tm == ThemeMode.light;
    else if (themeText == 's') tm == ThemeMode.system;
    notifyListeners();
  }


}
