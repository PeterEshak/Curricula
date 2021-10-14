import 'package:curricula_apple/modules/setting.dart';
import 'package:curricula_apple/screens/theme_screen.dart';

import '../screens/product_main_screen.dart';
import 'app_screen.dart';
import '../shared/components/components.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'calculator/calculator_main.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import 'filters_screen.dart';
import 'bottom_nav_bar.dart';

class CurvedNavDra extends StatefulWidget {
  const CurvedNavDra({Key? key}) : super(key: key);

  @override
  CurvedNavDraState createState() => CurvedNavDraState();
}

class CurvedNavDraState extends State<CurvedNavDra>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;
  final GlobalKey _bottomNavigationKey = GlobalKey();
  int _selectedPageIndex = 0;
  List<Map<String, Widget>>? _pages;
  List<Map<String, String>>? _titles;

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen()},
      {'page': const FavoritesScreen()},
      {'page': const ProductMain()},
      {'page': const CalculatorMain()},
      {'page': const TestScreen()},
      {'page': const SettingScreen()},
      {'page': const ThemeScreen()},
    ];
    _titles = [
      {'title': 'The Classes'},
      {'title': 'Your favorites'},
      {'title': 'My Curricula'},
      {'title': 'الة حاسبه'},
      {'title': 'New Apps'},
      {'title': 'Setting'},
      {'title': 'Theme'},
    ];
    _controller = FancyDrawerController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() => setState(() {}));
    super.initState();
  }

  void _selectPage(int value) => setState(() => _selectedPageIndex = value);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Flutter")),
      body: FancyDrawerWrapper(
        itemGap: 5,
        hideOnContentTap: false,
        cornerRadius: 25,
        backgroundColor: Colors.white,
        controller: _controller,
        drawerItems: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'مناهج',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          buildListTile(
            'الصفحة الرئسية',
            Icons.home,
            () => navigateAndFinish(context, const BottomNavBar()),
          ),
          buildListTile(
            'المناهج الدراسيه',
            Icons.restaurant,
            () => navigateAndFinish(context, const CategoriesScreen()),
          ),
          buildListTile(
            'فلتر',
            Icons.settings,
            () => navigateAndFinish(context, const FiltersScreen()),
          ),
          buildListTile(
            'الة حاسبة',
            Icons.calculate_outlined,
            () => navigateAndFinish(context, const CalculatorMain()),
          ),
          buildListTile(
            'New Apps',
            Icons.new_releases_outlined,
            () => navigateAndFinish(context, const TestScreen()),
          ),
          buildListTile(
            'Setting',
            Icons.calculate_outlined,
            () => navigateAndFinish(context, const SettingScreen()),
          ),
          buildListTile(
            'Theme',
            Icons.new_releases_outlined,
            () => navigateAndFinish(context, const ThemeScreen()),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 4.0,
            title: Text(
              _titles![_selectedPageIndex]['title']!,
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => _controller.toggle(),
            ),
          ),
          body: _pages![_selectedPageIndex]['page'],
          bottomNavigationBar: CurvedNavigationBar(
            onTap: _selectPage,
            key: _bottomNavigationKey,
            index: 0,
            height: 50.0,
            items: [
              Icon(Icons.category,
                  color: Colors.blue[700], size: 30, semanticLabel: 'Category'),
              Icon(Icons.star,
                  color: Colors.blue[700], size: 30, semanticLabel: 'Favorite'),
              Icon(Icons.add,
                  color: Colors.blue[700],
                  size: 30,
                  semanticLabel: 'Add product'),
              Icon(Icons.calculate_outlined,
                  color: Colors.blue[700],
                  size: 30,
                  semanticLabel: 'Calculator'),
              Icon(Icons.new_releases_outlined,
                  color: Colors.blue[700], size: 30, semanticLabel: 'New Apps'),
            ],
            color: Colors.red[200]!,
            buttonBackgroundColor: Colors.green[200],
            backgroundColor: Colors.red,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
          ),
        ),
        // child: Scaffold(
        //   appBar: AppBar(
        //     elevation: 4.0,
        //     title: const Text(
        //       "Animated Navigation Drawer",
        //       style: TextStyle(color: Colors.black),
        //     ),
        //     backgroundColor: Colors.white,
        //     leading: IconButton(
        //       icon: const Icon(
        //         Icons.menu,
        //         color: Colors.black,
        //       ),
        //       onPressed: () => _controller.toggle(),
        //     ),
        //   ),
        //   body: const BottomNavBar(favoriteCurricula: []),
        // ),
      ),
    );
  }

  Widget buildListTile(
          String title, IconData icon, void Function()? tapHandler) =>
      ListTile(
        leading: Icon(icon, size: 26),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHandler,
      );

  Widget buildDivider(Color color) => Divider(
        height: 10,
        thickness: 10,
        indent: 10,
        endIndent: 50,
        color: color,
      );
}
