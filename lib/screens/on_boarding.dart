import 'package:curricula_apple/main.dart';
import 'package:curricula_apple/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:curricula_apple/models/providers/theme_provider.dart';
import 'package:curricula_apple/screens/bottom_nav_bar.dart';
import 'package:curricula_apple/screens/filters_screen.dart';
import 'package:curricula_apple/screens/theme_screen.dart';
import 'package:curricula_apple/shared/components/components.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    MaterialColor primaryColor =
        Provider.of<ThemeProvider>(context).primaryColor;
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/books.jfif'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      color: Theme.of(context).shadowColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        lan.getTexts('drawer_name').toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'RobotoCondensed',
                          fontWeight: FontWeight.bold,
                          color: useWhiteForeground(primaryColor)
                              ? Colors.white
                              : Colors.black,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Container(
                      width: 350,
                      color: Theme.of(context).shadowColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Text(
                            lan.getTexts('drawer_switch_title').toString(),
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'RobotoCondensed',
                              fontWeight: FontWeight.bold,
                              color: useWhiteForeground(primaryColor)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                lan.getTexts('drawer_switch_item2').toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                  fontWeight: FontWeight.bold,
                                  color: useWhiteForeground(primaryColor)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Switch(
                                value: lan.isEn,
                                onChanged: (value) =>
                                    Provider.of<LanguageProvider>(context,
                                            listen: false)
                                        .changeLan(value),
                              ),
                              Text(
                                lan.getTexts('drawer_switch_item1').toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'RobotoCondensed',
                                  fontWeight: FontWeight.bold,
                                  color: useWhiteForeground(primaryColor)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ThemeScreen(fromOnBoarding: true),
              const FiltersScreen(fromOnBoarding: true),
            ],
            onPageChanged: (value) => setState(() => _currentIndex = value),
          ),
          Indicator(index: _currentIndex),
          Builder(
            builder: (context) => Align(
              alignment: const Alignment(0, .91),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  padding: lan.isEn
                      ? const EdgeInsets.all(4)
                      : const EdgeInsets.all(0),
                  color: primaryColor,
                  onPressed: () async {
                    navigateAndFinish(
                        context,
                        MyApp(
                          startWidget: const BottomNavBar(),
                          themeMode:
                              CacheHelper.getData(key: 'themeText') ?? 's',
                        ));
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('watched', true);
                  },
                  child: Text(
                    lan.getTexts('start').toString(),
                    style: TextStyle(
                      color: useWhiteForeground(primaryColor)
                          ? Colors.white
                          : Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int index;
  const Indicator({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(context, 0),
          buildContainer(context, 1),
          buildContainer(context, 2),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext context, int i) {
    return index == i
        ? Icon(
            Icons.star,
            color: Theme.of(context).primaryColor,
          )
        : Container(
            margin: const EdgeInsets.all(4),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
          );
  }
}
