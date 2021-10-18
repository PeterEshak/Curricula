import 'package:curricula_apple/models/providers/theme_provider.dart';

import '../models/providers/language_provider.dart';
import '../modules/setting.dart';
import '../screens/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/product_main_screen.dart';
import '../screens/app_screen.dart';
import '../shared/components/components.dart';
import 'package:flutter/material.dart';
import '../screens/calculator/calculator_main.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int selectedPageIndex = 0;

  void selectPage(int value) => setState(() => selectedPageIndex = value);

  final List<Widget> pages = [
    const BottomNavBar(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const ProductMain(),
    const CalculatorMain(),
    const TestScreen(),
    // const FiltersScreen(),
    const SettingScreen(),
    // const ThemeScreen(),
    // const AppInfoScreen(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.class_,
    Icons.star,
    Icons.add,
    Icons.calculate_outlined,
    Icons.new_releases_outlined,
    // Icons.save,
    Icons.settings,
    // Icons.color_lens,
    // Icons.add_to_home_screen,
  ];

  @override
  Widget build(BuildContext context) {
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);
    bool isEn = Provider.of<LanguageProvider>(context, listen: true).isEn;
    final List<String> titles = [
      lan.getTexts('home').toString(),
      lan.getTexts('classes').toString(),
      lan.getTexts('favorite').toString(),
      lan.getTexts('curricula').toString(),
      lan.getTexts('calculator').toString(),
      lan.getTexts('new_app').toString(),
      // lan.getTexts('filter').toString(),
      lan.getTexts('setting').toString(),
      // lan.getTexts('theme').toString(),
      // 'App Information',
    ];
    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Drawer(
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
              alignment:
                  lan.isEn ? Alignment.centerLeft : Alignment.centerRight,
              child: Center(
                child: Text(
                  lan.getTexts('drawer_name').toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(icons[index], size: 26),
                title: Text(
                  titles[index],
                  style: Theme.of(context).textTheme.headline6,
                ),
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
            // myDivider(10),
            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.only(top: 20, right: 22),
            //   child: Text(
            //     lan.getTexts('drawer_switch_title').toString(),
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     right: (lan.isEn ? 0 : 20),
            //     left: (isEn ? 20 : 0),
            //     bottom: (isEn ? 20 : 0),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Text(
            //         lan.getTexts('drawer_switch_item2').toString(),
            //         style: Theme.of(context).textTheme.headline6,
            //       ),
            //       Switch(
            //         value: Provider.of<LanguageProvider>(context, listen: true)
            //             .isEn,
            //         onChanged: (value) {
            //           Provider.of<LanguageProvider>(context, listen: false)
            //               .changeLan(value);
            //           navigatePop(context);
            //         },
            //         inactiveTrackColor:
            //             Provider.of<ThemeProvider>(context, listen: true).tm ==
            //                     'd'
            //                 ? Colors.white
            //                 : Colors.black,
            //       ),
            //       Text(
            //         lan.getTexts('drawer_switch_item1').toString(),
            //         style: Theme.of(context).textTheme.headline6,
            //       ),
            //     ],
            //   ),
            // ),
            // myDivider(10),
            // Container(
            //   alignment: Alignment.centerRight,
            //   padding: const EdgeInsets.only(top: 20, right: 22),
            //   child: Text(
            //     lan.getTexts('drawer_switch_title').toString(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
