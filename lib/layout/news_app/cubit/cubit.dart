import 'states.dart';
import '../../../modules/news_app/business/business_screen.dart';
import '../../../modules/news_app/science/science_screen.dart';
import '../../../modules/news_app/sports/sports_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<Widget> newsScreens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  // void changeBottomNavBar(int index) {
  //   currentIndex = index;
  //   emit(NewsBottomNavState());
  // }

  List<dynamic> business = [];
  void getBusiness() async {
    emit(GetBusinessDataLoadingState());
    await DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'a8680b71f3164c0cac163bfe5b9d9ad9'
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(GetBusinessDataSuccessState());
    }).catchError((error) {
      emit(GetBusinessDataErrorState());
      print(error.toString());
    });
  }

  List<dynamic> sports = [];
  void getSports() async {
    emit(GetSportsDataLoadingState());
    await DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'a8680b71f3164c0cac163bfe5b9d9ad9'
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(GetSportsDataSuccessState());
    }).catchError((error) {
      emit(GetSportsDataErrorState());
      print(error.toString());
    });
  }

  List<dynamic> science = [];
  void getScience() async {
    emit(GetScienceDataLoadingState());
    await DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'a8680b71f3164c0cac163bfe5b9d9ad9'
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(GetScienceDataErrorState());
    }).catchError((error) {
      emit(GetScienceDataErrorState());
      print(error.toString());
    });
  }

  List<dynamic> search = [];

  void getSearch(String word) async {
    //https://newsapi.org/v2/everything?q=tesla&apiKey=a8680b71f3164c0cac163bfe5b9d9ad9
    emit(GetSearchDataLoadingState());
    await DioHelper.getData(
        url: 'v2/everything',
        query: {'q': word,  'apiKey': 'a8680b71f3164c0cac163bfe5b9d9ad9'})
        .then((value) {
      search = value.data['articles'];
      // print(searchData[0]['title']);
      emit(GetSearchDataErrorState());
    }).catchError((error) {
      emit(GetSearchDataErrorState());
      print(error.toString());
    });
  }

}
