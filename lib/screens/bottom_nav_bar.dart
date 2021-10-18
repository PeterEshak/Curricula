import 'package:curricula_apple/models/providers/curricula_provider.dart';
import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:curricula_apple/models/providers/theme_provider.dart';
import 'package:curricula_apple/screens/theme_screen.dart';
import 'package:curricula_apple/shared/style/colors.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import 'calculator/calculator_main.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import 'product_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey _bottomNavigationKey = GlobalKey();
  int _selectedPageIndex = 0;
  List<Map<String, Widget>>? _pages;
  @override
  void initState() {
    Provider.of<CurriculaProvider>(context, listen: false).getData();
    Provider.of<ThemeProvider>(context, listen: false).getThemeMode();
    Provider.of<ThemeProvider>(context, listen: false).getThemeColors();
    Provider.of<LanguageProvider>(context, listen: false).getLan();
    _pages = [
      {'page': const CategoriesScreen()},
      {'page': const FavoritesScreen()},
      // {'page': const ProductMain()},
      {'page': const CalculatorMain()},
      {'page': const ThemeScreen()},
    ];
    super.initState();
  }

  void _selectPage(int value) => setState(() => _selectedPageIndex = value);

  @override
  Widget build(BuildContext context) {
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);

    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: _pages![_selectedPageIndex]['page'],
        bottomNavigationBar: CurvedNavigationBar(
          onTap: _selectPage,
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: [
            Icon(Icons.category,
                color: Colors.blue[700],
                size: 30,
                semanticLabel: lan.getTexts('curricula').toString()),
            Icon(Icons.star,
                color: Colors.blue[700],
                size: 30,
                semanticLabel: lan.getTexts('favorite').toString()),
            // Icon(Icons.add,
            //     color: Colors.blue[700], size: 30, semanticLabel: 'Add product'),
            Icon(Icons.calculate_outlined,
                color: Colors.blue[700],
                size: 30,
                semanticLabel: lan.getTexts('calculator').toString()),
            Icon(Icons.new_releases_outlined,
                color: Colors.blue[700],
                size: 30,
                semanticLabel: lan.getTexts('new_app').toString()),
          ],
          color: Colors.red[200]!,
          buttonBackgroundColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).primaryColor,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
