import 'package:curricula_apple/models/providers/curricula_provider.dart';
import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../widgets/curricula_item.dart';
import '../models/curricula.dart';

class CategoryCurriculaScreen extends StatefulWidget {
  static const routeName = '/category-curricula';

  const CategoryCurriculaScreen({Key? key}) : super(key: key);

  @override
  _CategoryCurriculaScreenState createState() =>
      _CategoryCurriculaScreenState();
}

class _CategoryCurriculaScreenState extends State<CategoryCurriculaScreen> {
  late List<Curricula> displayCurricula;
  bool _loadedInitData = false;
  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final List<Curricula> availableCurricula =
        Provider.of<CurriculaProvider>(context, listen: true)
            .availableCurricula;

    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      displayCurricula = availableCurricula.where((curricula) {
        return curricula.curricula.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    // final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final categoryId = routeArgs['id'];
    // categoryTitle = routeArgs['title']!;
    // displayCurricula = availableCurricula
    //     .where((curricula) => curricula.curricula.contains(categoryId))
    //     .toList();
    super.didChangeDependencies();
  }

  void _removeCurricula(String curriculaId) => setState(() =>
      displayCurricula.removeWhere((curricula) => curricula.id == curriculaId));

  @override
  Widget build(BuildContext context) {
    // print(displayCurricula.length);
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double dw = MediaQuery.of(context).size.width;
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text('${lan.getTexts('cur-${displayCurricula[0].id}')} ${lan.getTexts('cur-${displayCurricula[0].id}')} : ${displayCurricula.length} كتب'),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemBuilder: (ctx, index) {
          return CurriculaItem(
            id: displayCurricula[index].id,
            image: displayCurricula[index].image,
            classesOfSchool: displayCurricula[index].classesOfSchool,
            curriculaOfSchool: displayCurricula[index].curriculaOfSchool,
            removeItem: _removeCurricula,
          );
        },
        itemCount: displayCurricula.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: dw <=400? 400:500,
          childAspectRatio: isLandscape ? dw / (dw*0.615) : dw / (dw*0.9),
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
      ),
    );
  }
}
