import 'dart:math';

import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:curricula_apple/models/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../modules/on_boarding_screen.dart';
import '../shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../main.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  List<Color> colors = [
    Colors.yellow,
    Colors.pink,
    Colors.brown,
    Colors.purple,
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.grey,
    Colors.red,
    Colors.teal,
  ];
  Random random = Random();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.darkTheme(),
      darkTheme: theme.darkTheme(),
      themeMode: Provider.of<ThemeProvider>(context, listen: true).tm,
      // themeMode:AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(body: buildSplashScreenView()),
    );
  }

  SplashScreenView buildSplashScreenView() {
    String themeMode = CacheHelper.getData(key: 'themeText') ?? 's';
    Widget? widget;
    bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
    String token = CacheHelper.getData(key: 'token') ?? '';

    if (onBoarding != null) {
      if (token != '')
        widget = MyApp(
          themeMode: themeMode,
          startWidget: widget,
        );
      else
        widget = MyApp(
          themeMode: themeMode,
          startWidget: widget,
        );
      // widget = LoginScreen();
    } else
      widget = const OnBoardingScreen();
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);
    return SplashScreenView(
      pageRouteTransition: PageRouteTransition.SlideTransition,
      navigateRoute: widget,
      speed: 300,
      duration: 3000,
      imageSize: 150,
      imageSrc: 'assets/images/download.jpg',
      text: lan.getTexts('splash_screen_text').toString(),
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(fontSize: 40.0),
      colors: [
        colors[random.nextInt(10)],
        colors[random.nextInt(10)],
        colors[random.nextInt(10)],
      ],
      backgroundColor: Colors.blueAccent,
    );
  }
}
