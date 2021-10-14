import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dummy_data.dart';
import '../curricula.dart';

class CurriculaProvider with ChangeNotifier {
  List<Curricula> availableCurricula = dummyCurricula;
  List<Curricula> favoriteCurricula = [];
  List<String> prefsCurriculaId = [];

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
    prefsCurriculaId = prefs.getStringList('prefsCurriculaId') ?? [];
    for (var curriculaId in prefsCurriculaId) {
      final existingIndex = favoriteCurricula
          .indexWhere((curricula) => curricula.id == curriculaId);
      if (existingIndex < 0) {
        favoriteCurricula.add(dummyCurricula
            .firstWhere((curricula) => curricula.id == curriculaId));
      }
    }
    notifyListeners();
  }

  void toggleFavorite(String curriculaId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

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
    prefs.setStringList('prefsCurriculaId', prefsCurriculaId);
  }

  bool isFavorite(String curriculaId) {
    return favoriteCurricula.any((curricula) => curricula.id == curriculaId);
  }
}
