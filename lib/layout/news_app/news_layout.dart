import '../../shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Egypt News'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.newsScreens[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              print('FloatingActionButton Clicked');//ignore:avoid_print
              DioHelper.getData(
                url: 'v2/top-headlines',
                query: {
                  'country': 'eg',
                  'category': 'business',
                  'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
                },
              )
                  .then((value) => print(value.data.toString()))
                  .catchError((error) => print(error.toString()));
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottomNavBar(index),
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
