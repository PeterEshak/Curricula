import '../shared/components/components.dart';
import '../widgets/main_drawer.dart';

import '../layout/news_app/news_layout.dart';

import '../layout/bmi_app/bmi_layout.dart';

import '../layout/todo_app/todo_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  /*
  Map<String, dynamic> pages = [
    {
      'page': BMIHomeScreen(),
    },
    {
      'page': DatabaseHomeScreen(),
    },
  ]as Map<String, dynamic>;
  List<Widget> pages1 = [
    BMIHomeScreen(),
    DatabaseHomeScreen(),
  ];
  Map<String, String> title = [
    {
      'title': 'BMI Screen',
    },
    {
      'title': 'Database Screen',
    },
  ] as Map<String, String>;
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Apps'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('لو انت عاوز تروح علي برنامج Todo دوس علي الزرار'),
            MaterialButton(
              child: const Text(
                'Todo App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              onPressed: () => navigateTo(context, const TodoLayout()),
            ),
            const SizedBox(height: 50),
            const Text('لو انت عاوز تروح علي برنامج BMI دوس علي الزرار'),
            MaterialButton(
              child: const Text(
                'BMI App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              onPressed: () => navigateTo(context, const BmiLayout()),
            ),
            const SizedBox(height: 50),
            const Text('لو انت عاوز تروح علي برنامج News دوس علي الزرار'),
            MaterialButton(
              child: const Text(
                'News App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              onPressed: () => navigateTo(context, const NewsLayout()),
            ),
          ],
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
