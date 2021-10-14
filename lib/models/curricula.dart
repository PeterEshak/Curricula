enum ClassesOfSchool {
  firstGrade,
  secondGrade,
  thirdGrade,
  fourthGrade,
  fifthGrade,
  sixthGrade,
}

enum CurriculaOfSchool {
  arabic,
  english,
  mathInArabic,
  mathInEnglish,
  scienceInArabic,
  scienceInEnglish,
  socialStudies,
}

class Curricula {
  final String id;
  final List<String> curricula;
  final String title;
  final String image;
  final String pdf;
  final List<String> ingredients;
  final ClassesOfSchool classesOfSchool;
  final CurriculaOfSchool curriculaOfSchool;
  final bool isArabicCurricula;
  final bool isLanguagesCurricula;
  final bool isFirstCurricula;
  final bool isSecondCurricula;
  final bool isThirdCurricula;
  final bool isFourthCurricula;
  final bool isFifthCurricula;
  final bool isSixthCurricula;

  const Curricula({
    required this.id,
    required this.curricula,
    required this.image,
    required this.title,
    required this.pdf,
    required this.ingredients,
    required this.classesOfSchool,
    required this.curriculaOfSchool,
    required this.isArabicCurricula,
    required this.isLanguagesCurricula,
    required this.isFirstCurricula,
    required this.isSecondCurricula,
    required this.isThirdCurricula,
    required this.isFourthCurricula,
    required this.isFifthCurricula,
    required this.isSixthCurricula,
  });
}

/*
Curricula c1 = const Curricula(
  id: '',
  title: '',
  curricula: [],
  image: '',
  pdf: '',
  ingredients: [],
  curriculaOfSchool: CurriculaOfSchool.arabic,
  classesOfSchool: ClassesOfSchool.firstGrade,
  isArabicCurricula: false,
  isLanguagesCurricula: false,
  isFirstCurricula: false,
  isSecondCurricula: false,
  isThirdCurricula: false,
  isFourthCurricula: false,
  isFifthCurricula: false,
  isSixthCurricula: false,
);
*/
