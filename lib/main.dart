import 'package:curricula_apple/models/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'models/providers/curricula_provider.dart';
import 'screens/category_curricula_screen.dart';
import 'screens/curricula_detail_screen.dart';
import 'shared/network/local/cache_helper.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'modules/on_boarding_screen.dart';
import 'screens/calculator/calculator_main.dart';
import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/bottom_nav_bar.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/cubit/cubit.dart';
import 'shared/cubit/states.dart';
import 'widgets/curricula_products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // login

  // 1. checkout master
  // 2. update master
  // 3. create branch from master
  // 4. code ....
  // 5. commit
  // 6. checkout master
  // 7. update master
  // 8. checkout your local branch
  // 9. merge master with my current branch
  // 10. push
  // 11. create pull request

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  print(
      'CacheHelper.getData(key: themeMode) = ${CacheHelper.getData(key: 'themeMode')}');
  String themeMode = CacheHelper.getData(key: 'themeMode') ?? 'system';
  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  String token = CacheHelper.getData(key: 'token') ?? '';
  if (onBoarding != null) {
    if (token != '')
      widget = const CategoriesScreen();
    else
      widget = const CategoriesScreen();
    // widget = LoginScreen();
  } else
    widget = const OnBoardingScreen();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider<CurriculaProvider>(
          create: (_) => CurriculaProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: MyApp(
        themeMode: themeMode,
        startWidget: widget,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? themeMode;
  final Widget? startWidget;
  const MyApp({
    Key? key,
    required this.themeMode,
    required this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primaryColor = Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var accentColor = Provider.of<ThemeProvider>(context, listen: true).accentColor;
    var tm = Provider.of<ThemeProvider>(context, listen: true).tm;
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppCubit()..changeAppMode(fromShared: themeMode!),
        ),
        ChangeNotifierProvider<Products>(create: (_) => Products()),
        ChangeNotifierProvider<CurriculaProvider>(
            create: (_) => CurriculaProvider()),
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
darkTheme: ThemeData(
  primarySwatch: Provider.of<ThemeProvider>(context).primaryColor,
  colorScheme: ColorScheme.dark(
      secondary: Provider.of<ThemeProvider>(context).accentColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  platform: TargetPlatform.android,
  unselectedWidgetColor: Colors.white,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.white,
  ),
  cardColor: const Color.fromRGBO(35, 34, 39, 1),
  shadowColor: Colors.white60,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //   backgroundColor: defaultColor,
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Provider.of<ThemeProvider>(context).primaryColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: HexColor('333739'),
    // selectedIconTheme:
    //     const IconThemeData(color: defaultColor, size: 20),
    // unselectedIconTheme: const IconThemeData(
    //   color: Colors.grey,
    //   size: 15,
    //   opacity: .5,
    // ),
    // selectedLabelStyle: const TextStyle(
    //   color: Colors.lightGreenAccent,
    //   fontSize: 20,
    //   wordSpacing: 2,
    //   letterSpacing: 2,
    //   fontWeight: FontWeight.w900,
    // ),
    // unselectedLabelStyle: const TextStyle(
    //   color: Colors.green,
    //   fontSize: 15,
    //   wordSpacing: 1,
    //   letterSpacing: 1,
    //   fontWeight: FontWeight.w500,
    // ),
    // showSelectedLabels: true,
    // showUnselectedLabels: true,
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: TextStyle(
      color: Colors.white60,
      fontSize: 20,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold,
    ),
  ),
  fontFamily: 'RobotoCondensed',
),

theme: ThemeData(
  primarySwatch: Provider.of<ThemeProvider>(context).primaryColor,
  colorScheme: ColorScheme.light(
      secondary: Provider.of<ThemeProvider>(context).accentColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  platform: TargetPlatform.android,
  scaffoldBackgroundColor: Colors.white,
  unselectedWidgetColor: Colors.black,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.black,
  ),
  cardColor: const Color.fromRGBO(185, 180, 180, 1),
  shadowColor: Colors.black54,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //   backgroundColor: defaultColor,
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Provider.of<ThemeProvider>(context).primaryColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: Colors.white,
    // selectedIconTheme: IconThemeData(color: defaultColor, size: 20),
    // unselectedIconTheme: IconThemeData(
    //   color: Colors.grey,
    //   size: 15,
    //   opacity: .5,
    // ),
    // selectedLabelStyle: TextStyle(
    //   color: Colors.lightBlueAccent,
    //   fontSize: 20,
    //   wordSpacing: 2,
    //   letterSpacing: 2,
    //   fontWeight: FontWeight.w900,
    // ),
    // unselectedLabelStyle: TextStyle(
    //   color: Colors.blueGrey,
    //   fontSize: 15,
    //   wordSpacing: 1,
    //   letterSpacing: 1,
    //   fontWeight: FontWeight.w500,
    // ),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: TextStyle(
      color: Colors.black54,
      fontSize: 20,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold,
    ),
  ),
  switchTheme: SwitchThemeData(
      // trackColor: Colors.black,
      ),
  fontFamily: 'RobotoCondensed',
),
            themeMode: tm,
            // themeMode: AppCubit.get(context).changeAppMode(fromShared: themeMode),
            // home: widget.startWidget,
            initialRoute: 'BottomNavBar',
            routes: {
              // '/': (context) => const CurvedNavDra(),
              'BottomNavBar': (context) => const BottomNavBar(),
              '/category-curricula': (context) =>
                  const CategoryCurriculaScreen(),
              '/curricula_detail': (context) => const CurriculaDetailScreen(),
              'Filters': (context) => const FiltersScreen(),
              'Calculator': (context) => const CalculatorMain(),
              'CategoriesScreen': (context) => const CategoriesScreen(),
            },
            onGenerateRoute: (settings) {
              //print(settings.arguments);
              // if (settings.name == '/meal-detail') {
              //   return ...;
              // } else if (settings.name == '/something-else') {
              //   return ...;
              // }
              // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
            },
            onUnknownRoute: (settings) =>
                MaterialPageRoute(builder: (ctx) => const CategoriesScreen()),
          );
        },
      ),
    );
  }
}
