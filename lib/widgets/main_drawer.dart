import 'package:curricula_apple/modules/setting.dart';
import 'package:curricula_apple/screens/theme_screen.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/product_main_screen.dart';
import '../screens/app_screen.dart';
import '../shared/components/components.dart';
import 'package:flutter/material.dart';
import '../screens/calculator/calculator_main.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int selectedPageIndex = 0;

  void selectPage(int value) => setState(() => selectedPageIndex = value);

  final List<Widget> pages = [
    const CategoriesScreen(),
    const FavoritesScreen(),
    const ProductMain(),
    const CalculatorMain(),
    const TestScreen(),
    const FiltersScreen(),
    // const SettingScreen(),
    const ThemeScreen(),
    // const AppInfoScreen(),
  ];

  final List<String> titles = [
    'The Classes',
    'Your favorites',
    'My Curricula',
    'Calculator',
    'New Apps',
    'Filter',
    // 'Setting',
    'Themes',
    // 'App Information',
  ];

  final List<IconData> icons = [
    Icons.class_,
    Icons.star,
    Icons.add,
    Icons.calculate_outlined,
    Icons.new_releases_outlined,
    Icons.save,
    // Icons.settings,
    Icons.color_lens,
    // Icons.add_to_home_screen,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueAccent,
                  offset: Offset.zero,
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
                BoxShadow(
                  color: Colors.yellow,
                  offset: Offset.zero,
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.green,
                  offset: Offset.zero,
                  blurRadius: 60,
                  spreadRadius: 5,
                ),
              ],
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Center(
              child: Text(
                'مناهج',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(icons[index], size: 26),
              title: Text(titles[index],style: Theme.of(context).textTheme.headline6,),
              onTap: () {
                selectPage;
                navigateAndFinish(context, pages[index]);
              },
            ),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsetsDirectional.only(
                start: 20,
                top: 5,
              ),
            ),
            // separatorBuilder: (context, index) => Padding(
            //   padding: const EdgeInsetsDirectional.only(start: 20),
            //   child: Container(
            //     width: double.infinity,
            //     height: 4,
            //     color: Colors.grey[300],
            //   ),
            // ),
            itemCount: pages.length,
          ),
          // buildDivider(Colors.orange),
        ],
      ),
    );
  }
}
