import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/curricula_detail_screen.dart';
import '../models/curricula.dart';

class CurriculaItem extends StatelessWidget {
  final String id;
  final String image;
  final ClassesOfSchool classesOfSchool;
  final CurriculaOfSchool curriculaOfSchool;
  final Function removeItem;

  const CurriculaItem({
    Key? key,
    required this.id,
    required this.image,
    required this.classesOfSchool,
    required this.curriculaOfSchool,
    required this.removeItem,
  }) : super(key: key);

  // String get classesOfSchoolText {
  //   switch (classesOfSchool) {
  //     case ClassesOfSchool.firstGrade:
  //       return 'FirstGrade';
  //     case ClassesOfSchool.secondGrade:
  //       return 'SecondGrade';
  //     case ClassesOfSchool.thirdGrade:
  //       return 'ThirdGrade';
  //     case ClassesOfSchool.fourthGrade:
  //       return 'FourthGrade';
  //     case ClassesOfSchool.fifthGrade:
  //       return 'FifthGrade';
  //     case ClassesOfSchool.sixthGrade:
  //       return 'SixthGrade';
  //     default:
  //       return 'Unknown';
  //   }
  // }
  //
  // String get curriculaOfSchoolText {
  //   switch (curriculaOfSchool) {
  //     case CurriculaOfSchool.arabic:
  //       return 'Arabic';
  //     case CurriculaOfSchool.english:
  //       return 'English';
  //     case CurriculaOfSchool.mathInArabic:
  //       return 'MathInArabic';
  //     case CurriculaOfSchool.mathInEnglish:
  //       return 'MathInEnglish';
  //     case CurriculaOfSchool.scienceInArabic:
  //       return 'ScienceInArabic';
  //     case CurriculaOfSchool.scienceInEnglish:
  //       return 'ScienceInEnglish';
  //     case CurriculaOfSchool.socialStudies:
  //       return 'SocialStudies';
  //     default:
  //       return 'Unknown';
  //   }
  // }
  //
  void selectCurricula(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      CurriculaDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);
    return InkWell(
      onTap: () => selectCurricula(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: id,
                    child: InteractiveViewer(
                      child: FadeInImage(
                        image: NetworkImage(image),
                        placeholder:
                            const AssetImage('assets/images/books.jfif'),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 310,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      lan.getTexts('cur-$id').toString(),
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.school_outlined),
                      const SizedBox(width: 6),
                      Text(lan.getTexts('$classesOfSchool').toString()),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.menu_book),
                      const SizedBox(width: 6),
                      Text(lan.getTexts('$curriculaOfSchool').toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
