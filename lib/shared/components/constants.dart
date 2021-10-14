// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/everything?q=test&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// Register 
// name: Abdullah mansour Ali
// email: abullah@gmail.com
// password: 123456
// phone: 789456123

import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';

import 'components.dart';

const loginTitle = 'login';
const homeTitle = 'home';
const getCategoriesTitle = 'categories';
const favouritesTitle = 'favorites';
const registerTitle = 'register';
const profileTitle = 'profile';
const updateProfileTitle = 'update-profile';
const cartsTitle = 'carts';
String? token = '';
bool? isArabic = false;
String language = isArabic == true ? 'ar' : 'en';
bool? isDark = false;
void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) navigateAndFinish(context, LoginScreen());
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
