import 'package:curricula_apple/models/classes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dummy_data.dart';
import '../curricula.dart';

class CurriculaProvider with ChangeNotifier {
  List<Curricula> availableCurricula = dummyCurricula;
  List<Curricula> favoriteCurricula = [];
  List<String> prefsCurriculaId = [];
  List<Classes> availableClasses = [];
  Map<String, bool> filters = {
    'arabic': false,
    'languages': false,
    'first': false,
    'second': false,
    'third': false,
    'fourth': false,
    'fifth': false,
    'sixth': false,
  };

  void setFilters() async {
    availableCurricula = dummyCurricula.where((curricula) {
      if (filters['arabic']! && !curricula.isArabicCurricula) return false;
      if (filters['languages']! && !curricula.isLanguagesCurricula)
        return false;
      if (filters['first']! && !curricula.isFirstCurricula) return false;
      if (filters['second']! && !curricula.isSecondCurricula) return false;
      if (filters['third']! && !curricula.isThirdCurricula) return false;
      if (filters['fourth']! && !curricula.isFourthCurricula) return false;
      if (filters['fifth']! && !curricula.isFifthCurricula) return false;
      if (filters['sixth']! && !curricula.isSixthCurricula) return false;
      return true;
    }).toList();

    List<Classes> ac = [];
    for (Curricula curricula in availableCurricula) {
      for (String curId in curricula.curricula) {
        for (Classes cla in dummyClasses) {
          if (cla.id == curId) {
            if (!ac.any((cla) => cla.id == curId)) ac.add(cla);
          }
        }
      }
    }
    availableClasses = ac;

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('arabic', filters['arabic']!);
    prefs.setBool('languages', filters['languages']!);
    prefs.setBool('first', filters['first']!);
    prefs.setBool('second', filters['second']!);
    prefs.setBool('third', filters['third']!);
    prefs.setBool('fourth', filters['fourth']!);
    prefs.setBool('fifth', filters['fifth']!);
    prefs.setBool('sixth', filters['sixth']!);
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    filters['arabic'] = prefs.getBool('arabic') ?? false;
    filters['languages'] = prefs.getBool('languages') ?? false;
    filters['first'] = prefs.getBool('first') ?? false;
    filters['second'] = prefs.getBool('second') ?? false;
    filters['third'] = prefs.getBool('third') ?? false;
    filters['fourth'] = prefs.getBool('fourth') ?? false;
    filters['fifth'] = prefs.getBool('fifth') ?? false;
    filters['sixth'] = prefs.getBool('sixth') ?? false;
    setFilters();
    prefsCurriculaId = prefs.getStringList('prefsCurriculaId') ?? [];
    for (var curriculaId in prefsCurriculaId) {
      final existingIndex = favoriteCurricula
          .indexWhere((curricula) => curricula.id == curriculaId);
      if (existingIndex < 0) {
        favoriteCurricula.add(dummyCurricula
            .firstWhere((curricula) => curricula.id == curriculaId));
      }
    }
    List<Curricula> fc = [];
    for (Curricula favCurricula in favoriteCurricula) {
      for (Curricula avCurricula in availableCurricula) {
        if (favCurricula.id == avCurricula.id) fc.add(favCurricula);
      }
    }
    favoriteCurricula = fc;

    notifyListeners();
  }

  void toggleFavorite(String curriculaId) async {
    final existingIndex = favoriteCurricula
        .indexWhere((curricula) => curricula.id == curriculaId);
    if (existingIndex >= 0) {
      favoriteCurricula.removeAt(existingIndex);
      prefsCurriculaId.remove(curriculaId);
    } else {
      favoriteCurricula.add(dummyCurricula
          .firstWhere((curricula) => curricula.id == curriculaId));
      prefsCurriculaId.add(curriculaId);
    }
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('prefsCurriculaId', prefsCurriculaId);
  }

  bool isFavorite(String curriculaId) {
    return favoriteCurricula.any((curricula) => curricula.id == curriculaId);
  }
}
