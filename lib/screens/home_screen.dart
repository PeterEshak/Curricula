import 'package:carousel_slider/carousel_slider.dart';
import '../shared/components/components.dart';
import 'package:flutter/material.dart';

import 'calculator/calculator_main.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import 'filters_screen.dart';
import 'product_main_screen.dart';
import 'app_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _x = GlobalKey<ScaffoldState>();
  String str = 'Carousel Slid Image';
  int currentIndex = 0;

  final List<Widget> pages = [
    const CategoriesScreen(),
    const FavoritesScreen(),
    const ProductMain(),
    const CalculatorMain(),
    const TestScreen(),
    const FiltersScreen(),
    // const AppInfoScreen(),
  ];

  final List<String> texts = [
    'The Classes',
    'Your favorites',
    'My Curricula',
    'Calculator',
    'New Apps',
    'Filter',
    // 'App Information',
  ];

  final List<IconData> icons = [
    Icons.class_,
    Icons.star,
    Icons.add,
    Icons.calculate_outlined,
    Icons.new_releases_outlined,
    Icons.settings,
    // Icons.add_to_home_screen,
  ];

  final List<Color> colors = [
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.brown,
  ];

  final List<String> imgList = [
    'assets/images/s1.jpg',
    'assets/images/s2.jpg',
    'assets/images/s3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _x,
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ListView(
              //   // physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   children: [
              //     const SizedBox(height: 30),
              //     const Text(
              //       "Slider 1: Initial Page Index 0 \n\n",
              //       textAlign: TextAlign.center,
              //     ),
              //     CarouselSlider(
              //       options: CarouselOptions(
              //         onPageChanged: (index, _) => setState(() => currentIndex = index),
              //         autoPlayInterval: const Duration(seconds: 3),
              //         autoPlay: true,
              //         enlargeCenterPage: true,
              //         height: 180,
              //         initialPage: 0,
              //       ),
              //       items: imgList.map(
              //             (imageUrl) => SizedBox(
              //               width: double.infinity,
              //               child: Image.asset(imageUrl, fit: BoxFit.fill),
              //             ),
              //           ).toList(),
              //     ),
              //     const SizedBox(height: 30),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         buildContainer(0),
              //         buildContainer(1),
              //         buildContainer(2),
              //       ],
              //     ),
              //   ],
              // ),
/*
                ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Slider 1: Initial Page Index 0 \n\n",
                      textAlign: TextAlign.center,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, _) => setState(() => currentIndex = index),
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: 180,
                        initialPage: 0,
                      ),
                      items: icons.map(
                            (iconUrl) => SizedBox(
                              width: double.infinity,
                              child: Icon(iconUrl),
                            ),
                          ).toList(),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildContainer(0),
                        buildContainer(1),
                        buildContainer(2),
                        buildContainer(3),
                        buildContainer(4),
                        buildContainer(5),
                        buildContainer(6),
                      ],
                    ),
                  ],
                ),
*/
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, _) =>
                            setState(() => currentIndex = index),
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: 60,
                        initialPage: 0,
                      ),
                      items: texts
                          .map((text) =>
                              Text(text, style: const TextStyle(fontSize: 25)))
                          .toList(),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, _) =>
                            setState(() => currentIndex = index),
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: 60,
                        initialPage: 0,
                      ),
                      items: icons
                          .map((iconData) => Icon(iconData, size: 60))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildContainer(0),
                        buildContainer(1),
                        buildContainer(2),
                        buildContainer(3),
                        buildContainer(4),
                        buildContainer(5),
                        buildContainer(6),
                      ],
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Container(
                    width: double.infinity,
                    height: 4,
                    color: Colors.grey[300],
                  ),
                ),
                itemCount: 1,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Slider 1: Initial Page Index 0 \n\n',
                      textAlign: TextAlign.center,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, _) =>
                            setState(() => currentIndex = index),
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: 180,
                        initialPage: 0,
                      ),
                      items: imgList
                          .map(
                            (imageUrl) => SizedBox(
                              width: double.infinity,
                              child: Image.asset(imageUrl, fit: BoxFit.fill),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildContainer(0),
                        buildContainer(1),
                        buildContainer(2),
                      ],
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Container(
                    width: double.infinity,
                    height: 4,
                    color: Colors.grey[300],
                  ),
                ),
                itemCount: 1,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => MaterialButton(
                  onPressed: () => navigateTo(context, pages[index]),
                  child: Row(
                    children: [
                      Icon(icons[index]),
                      const SizedBox(width: 10),
                      Text(texts[index]),
                    ],
                  ),
                  disabledColor: Colors.grey[200],
                  disabledTextColor: Colors.grey[800],
                  color: colors[index],
                  clipBehavior: Clip.antiAlias,
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Container(
                    width: double.infinity,
                    height: 4,
                    color: Colors.grey[300],
                  ),
                ),
                itemCount: texts.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(int index) => Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Colors.blue : Colors.grey,
        ),
      );
}
