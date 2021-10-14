import 'package:curricula_apple/shared/style/colors.dart';
import 'package:flutter/services.dart';

import '../shared/cubit/cubit.dart';
import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/category_type.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  Color themeShadowColor(BuildContext context) {
    if (AppCubit.get(context).themeMode == 'dark') {
      return Colors.white;
    } else if (AppCubit.get(context).themeMode == 'light') {
      return Colors.black;
    } else {
      return defaultColor;
    }
  }

  SystemUiOverlayStyle themeSystemOverlayStyle(BuildContext context) {
    if (AppCubit.get(context).themeMode == 'dark') {
      return SystemUiOverlayStyle.dark;
    } else if (AppCubit.get(context).themeMode == 'light') {
      return SystemUiOverlayStyle.light;
    } else {
      return SystemUiOverlayStyle.light;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: themeShadowColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        titleSpacing: 2,
        toolbarOpacity: .5,
        bottomOpacity: .5,
        systemOverlayStyle: themeSystemOverlayStyle(context),
        // backgroundColor: Colors.green,
        title: const Text('The Classes'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(30),
        children: dummyClasses
            .map((catData) =>
                CategoryType(catData.id, catData.title, catData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.9,
          childAspectRatio: MediaQuery.of(context).size.height * 0.005,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
          mainAxisSpacing: MediaQuery.of(context).size.height * 0.03,
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
