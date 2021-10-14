import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// import 'package:conditional_builder/conditional_builder.dart';

class TodoLayout extends StatefulWidget {
  const TodoLayout({Key? key}) : super(key: key);
  @override
  State<TodoLayout> createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) Navigator.pop(context);
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(title: Text(cubit.titles[cubit.currentIndex])),
/*
            body: ConditionalBuilder(
              builder: (context) => cubit.screens[cubit.currentIndex],
              condition: state is! AppGetDatabaseLoadingState,
              fallback: (context) => const Center(child: CircularProgressIndicator()),
            ),
*/
            body: Container(
              child: state is! AppGetDatabaseLoadingState
                  ? cubit.screens[cubit.currentIndex]
                  : const Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                //insertToDatabase();
                if (cubit.isBottomSheetShow) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );
                    //   insertToDatabase(
                    //     title: titleController.text,
                    //     time: timeController.text,
                    //     date: dateController.text,
                    //   ).then((value) {
                    //     getDataFromDatabase(database).then((value) {
                    //       Navigator.pop(context);
                    //       // setState((){
                    //       //   isBottomSheetShow = false;
                    //       //   fabIcon = Icons.edit;
                    //       //   tasks = value;
                    //       // });
                    //     });
                    //   });
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultFormField(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  label: 'Task Title',
                                  prefix: Icons.title,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      'title must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                defaultFormField(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text =
                                          value!.format(context).toString();
                                      print(value.format(
                                          context)); //ignore: avoid_print
                                    });
                                  },
                                  label: 'Task Time',
                                  prefix: Icons.watch_later_outlined,
                                  validate: (value) {
                                    if (value!.isEmpty)
                                      'time must not be empty';
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                defaultFormField(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2021-09-03'),
                                    ).then((value) {
                                      // print(DateFormat.yMMMd().format(value));// Aug 18, 2021
                                      // print(DateFormat.yMd().format(value));// 8/18/2021
                                      // print(DateFormat.yMMMEd().format(value));// Wed, Aug 18, 2021
                                      // print(DateFormat.yQQQQ().format(value));// 3rd quarter 2021
                                      // print(DateFormat.jms().format(value));// 12:00:00 AM
                                      dateController.text =
                                          DateFormat.yMd().format(value!);
                                    });
                                  },
                                  label: 'Task Date',
                                  prefix: Icons.calendar_today,
                                  validate: (value) {
                                    if (value!.isEmpty)
                                      'date must not be empty';
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 20,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }

                // try {
                //   var name = await getName();
                //   print(name);
                //   print("Abdo");
                //   throw ("Some error !!!!!!");
                // } catch (error) {
                //   print("Error: ${error.toString()}");
                // }

                // getName().then((value) {
                //   print(value);
                //   print("Abdo");
                //   throw("Some Error !!!");
                // }).catchError((error){
                //   print("Error : ${error.toString()}");
                // });

                // getName().whenComplete(() {
                //   print("Complete!!");
                // });
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeIndex(index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archived'),
              ],
            ),
          );
        },
      ),
    );
/*
    return Scaffold(
      appBar: AppBar(title: Text("Null Safety")),
      body: Column(
        children: [
          Text(text1),
          Text(text2??''),
          Text(text3),
        ],
      ),
    );
*/
  }
}
