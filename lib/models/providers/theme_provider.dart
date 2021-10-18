import 'package:curricula_apple/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  MaterialColor primaryColor = Colors.pink;
  MaterialColor accentColor = Colors.amber;
  ThemeMode tm = ThemeMode.system;
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

  getThemeColors() async {
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

  ThemeData darkTheme() => ThemeData(
        // primarySwatch: primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor)
            .copyWith(secondary: accentColor),
        // colorScheme: ColorScheme.dark(secondary: accentColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        platform: TargetPlatform.android,
        unselectedWidgetColor: Colors.white,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
        ),
        canvasColor: const Color.fromRGBO(14, 22, 33, 1),
        cardColor: const Color.fromRGBO(35, 34, 39, 1),
        shadowColor: Colors.white60,
        appBarTheme: AppBarTheme(
          // centerTitle: true,
          titleSpacing: 20,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: HexColor('333739'),
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //   backgroundColor: defaultColor,
        // ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          elevation: 20,
          backgroundColor: HexColor('333739'),
          // selectedIconTheme:
          //     const IconThemeData(color: defaultColor, size: 20),
          // unselectedIconTheme: const IconThemeData(
          //   color: Colors.grey,
          //   size: 15,
          //   opacity: .5,
          // ),
          // selectedLabelStyle: const TextStyle(
          //   color: Colors.lightGreenAccent,
          //   fontSize: 20,
          //   wordSpacing: 2,
          //   letterSpacing: 2,
          //   fontWeight: FontWeight.w900,
          // ),
          // unselectedLabelStyle: const TextStyle(
          //   color: Colors.green,
          //   fontSize: 15,
          //   wordSpacing: 1,
          //   letterSpacing: 1,
          //   fontWeight: FontWeight.w500,
          // ),
          // showSelectedLabels: true,
          // showUnselectedLabels: true,
        ),
        scaffoldBackgroundColor: HexColor('333739'),
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          headline4: TextStyle(
            color: Colors.white60,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Colors.white60,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.white60,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'RobotoCondensed',
      );

  ThemeData lightTheme() => ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor)
            .copyWith(secondary: accentColor),
        // primarySwatch: primaryColor,
        // colorScheme: ColorScheme.light(secondary: accentColor),
        canvasColor: const Color.fromRGBO(225, 254, 229, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: Colors.white,
        unselectedWidgetColor: Colors.black,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.black87,
        ),
        cardColor: const Color.fromRGBO(185, 180, 180, 1),
        shadowColor: white7,
        iconTheme: const IconThemeData(color: Colors.black),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleSpacing: 20,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //   backgroundColor: defaultColor,
        // ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          elevation: 20,
          backgroundColor: Colors.white,
          // selectedIconTheme: IconThemeData(color: defaultColor, size: 20),
          // unselectedIconTheme: IconThemeData(
          //   color: Colors.grey,
          //   size: 15,
          //   opacity: .5,
          // ),
          // selectedLabelStyle: TextStyle(
          //   color: Colors.lightBlueAccent,
          //   fontSize: 20,
          //   wordSpacing: 2,
          //   letterSpacing: 2,
          //   fontWeight: FontWeight.w900,
          // ),
          // unselectedLabelStyle: TextStyle(
          //   color: Colors.blueGrey,
          //   fontSize: 15,
          //   wordSpacing: 1,
          //   letterSpacing: 1,
          //   fontWeight: FontWeight.w500,
          // ),
        ),
        
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          headline4: TextStyle(
            color: Colors.black87,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Colors.black87,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        switchTheme: SwitchThemeData(
            // trackColor: Colors.black,
            ),
        fontFamily: 'RobotoCondensed',
      );
}
