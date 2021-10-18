import 'package:curricula_apple/models/providers/curricula_provider.dart';
import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/category_type.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  // Color themeShadowColor(BuildContext context) {
  //   if (Provider.of<ThemeProvider>(context).themeText == 'd') {
  //     return Colors.white;
  //   } else if (Provider.of<ThemeProvider>(context).themeText == 'l') {
  //     return Colors.black;
  //   } else {
  //     return defaultColor;
  //   }
  // }

  // SystemUiOverlayStyle themeSystemOverlayStyle(BuildContext context) {
  //   if (Provider.of<ThemeProvider>(context).themeText == 'd') {
  //     return SystemUiOverlayStyle.dark;
  //   } else if (Provider.of<ThemeProvider>(context).themeText == 'l') {
  //     return SystemUiOverlayStyle.light;
  //   } else {
  //     return SystemUiOverlayStyle.light;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        // shadowColor: themeShadowColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        titleSpacing: 2,
        toolbarOpacity: .5,
        bottomOpacity: .5,
        // systemOverlayStyle: themeSystemOverlayStyle(context),
        // backgroundColor: Colors.green,
        title: Text(lan.getTexts('classes').toString()),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(30),
        children: Provider.of<CurriculaProvider>(context)
            .availableClasses
            .map((catData) => CategoryType(catData.id, catData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: dw <= 400 ? 400 : 500,
          childAspectRatio:
              isLandscape ? (dw) / (dh * .4) : (dh * .8) / (dw * .4),
          crossAxisSpacing: isLandscape ? (dw * .09) : (dh * 0.2),
          mainAxisSpacing: isLandscape ? (dw * .06) : (dh * 0.05),
        ),

        // ScrollController? controller,
        // ScrollPhysics? physics,
        // ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
        // String? restorationId,
      ),
      drawer: const MainDrawer(),
    );
  }
}
