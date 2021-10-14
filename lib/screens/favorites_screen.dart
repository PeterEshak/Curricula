import 'package:curricula_apple/models/curricula.dart';
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
    final List<Curricula> favoriteCurricula =
        Provider.of<CurriculaProvider>(context,listen: true).favoriteCurricula;
    if (favoriteCurricula.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Your favorites is empty'),
          centerTitle: true,
          // backgroundColor: Colors.pink[800],
        ),
        body: const Center(
          child: Text('You have no favorites yet - start adding some!'),
        ),
        drawer: const MainDrawer(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Your favorites'),
          centerTitle: true,
          // backgroundColor: Colors.pink[300],
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return CurriculaItem(
              id: favoriteCurricula[index].id,
              title: favoriteCurricula[index].title,
              image: favoriteCurricula[index].image,
              classesOfSchool: favoriteCurricula[index].classesOfSchool,
              curriculaOfSchool:
                  favoriteCurricula[index].curriculaOfSchool,
              removeItem: _removeCurricula,
            );
          },
          itemCount: favoriteCurricula.length,
        ),
        drawer: const MainDrawer(),
      );
    }
  }
}
