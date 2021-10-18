import 'package:curricula_apple/models/curricula.dart';
import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../models/providers/curricula_provider.dart';
import '../widgets/curricula_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<Curricula> displayCurricula;

  void _removeCurricula(String curriculaId) => setState(() =>
      displayCurricula.removeWhere((curricula) => curricula.id == curriculaId));

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double dw = MediaQuery.of(context).size.width;
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);
    final List<Curricula> favoriteCurricula =
        Provider.of<CurriculaProvider>(context, listen: true).favoriteCurricula;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            title: favoriteCurricula.isEmpty
                ? Text(lan.getTexts('favorite_empty').toString())
                : Text(lan.getTexts('your_favorites').toString()),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                favoriteCurricula.isEmpty
                    ? Center(
                        child: Text(lan.getTexts('favorites_text').toString()),
                      )
                    : GridView.builder(
                        itemBuilder: (ctx, index) {
                          return CurriculaItem(
                            id: favoriteCurricula[index].id,
                            image: favoriteCurricula[index].image,
                            classesOfSchool:
                                favoriteCurricula[index].classesOfSchool,
                            curriculaOfSchool:
                                favoriteCurricula[index].curriculaOfSchool,
                            removeItem: _removeCurricula,
                          );
                        },
                        itemCount: favoriteCurricula.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: dw <= 400 ? 400 : 500,
                          childAspectRatio:
                              isLandscape ? dw / (dw * 0.615) : dw / (dw * 0.9),
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
