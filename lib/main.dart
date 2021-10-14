import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'shared/style/themes.dart';
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
  // print('CacheHelper.getData(key: themeMode) = ${CacheHelper.getData(key: 'themeMode')}');
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
      ],
      child: MyApp(
        themeMode: themeMode,
        startWidget: widget,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final String? themeMode;
  final Widget? startWidget;
  const MyApp({
    Key? key,
    required this.themeMode,
    required this.startWidget,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppCubit()..changeAppMode(fromShared: widget.themeMode!),
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
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).changeAppMode(fromShared: 'light'),
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
