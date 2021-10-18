import 'package:curricula_apple/models/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'colors.dart';

late BuildContext context;
ThemeData darkTheme = ThemeData(
  primarySwatch: Provider.of<ThemeProvider>(context).primaryColor,
  colorScheme: ColorScheme.dark(
      secondary: Provider.of<ThemeProvider>(context).accentColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  platform: TargetPlatform.android,
  unselectedWidgetColor: Colors.white,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.white,
  ),
  cardColor: const Color.fromRGBO(35, 34, 39, 1),
  shadowColor: Colors.white60,
  appBarTheme: AppBarTheme(
    centerTitle: true,
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
    selectedItemColor: defaultColor,
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
    headline6: TextStyle(
      color: Colors.white60,
      fontSize: 20,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold,
    ),
  ),
  fontFamily: 'RobotoCondensed',
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Provider.of<ThemeProvider>(context).primaryColor,
  colorScheme: ColorScheme.light(
      secondary: Provider.of<ThemeProvider>(context).accentColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  platform: TargetPlatform.android,
  scaffoldBackgroundColor: Colors.white,
  unselectedWidgetColor: Colors.black,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.black,
  ),
  cardColor: const Color.fromRGBO(185, 180, 180, 1),
  shadowColor: Colors.black54,
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
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
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
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: TextStyle(
      color: Colors.black54,
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

// ThemeMode themeDataMode(BuildContext context) {
//   if (AppCubit.get(context).themeMode == 'dark') {
//     return ThemeMode.dark;
//   } else if (AppCubit.get(context).themeMode == 'light') {
//     return ThemeMode.light;
//   } else {
//     return ThemeMode.system;
//   }
// }

// String themeDataString(BuildContext context) {
//   if (AppCubit.get(context).theme == ThemeMode.dark) {
//     return 'dark';
//   } else if (AppCubit.get(context).theme == ThemeMode.light) {
//     return 'light';
//   } else {
//     return 'system';
//   }
// }
