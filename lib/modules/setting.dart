import 'package:curricula_apple/shared/cubit/cubit.dart';
import 'package:curricula_apple/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String _selectedTheme = 'System default';
  final List _theme = [
    'Dark Mode',
    'Light Mode',
    'System default',
  ];

  Stream<String> themeMode(String mode) async* {
    String themeString = mode;
    while (themeString == mode) {
      AppCubit.get(context).themeMode;
      await Future.delayed(const Duration(seconds: 1));
      yield themeString = 'dark';
    }
  }

  Offset offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<Object>(
          stream: themeMode(_selectedTheme),
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Text(
                      'Theme: ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton(
                      autofocus: true,
                      focusColor: Colors.green,
                      underline: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent,
                          backgroundBlendMode: BlendMode.multiply,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      // disabledHint: Text("Welcome"),
                      iconSize: 40,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconDisabledColor: Colors.grey,
                      iconEnabledColor: Colors.blue,
                      isDense: true,
                      dropdownColor: Colors.red[300]!.withOpacity(0.95),
                      hint: const Text('Chose Theme'),
                      value: _selectedTheme,
                      items: _theme
                          .map((item) => DropdownMenuItem(
                                child: Container(
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.center,
                                    //textHeightBehavior: TextHeightBehavior.fromEncoded(20),
                                    textWidthBasis: TextWidthBasis.parent,
                                    overflow: TextOverflow.fade,
                                    softWrap: true,
                                    style: const TextStyle(
                                      //backgroundColor: Colors.green,
                                      fontSize: 20,
                                      //color: Colors.green,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    //color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(10),
                                    //backgroundBlendMode: BlendMode.multiply,
                                  ),
                                ),
                                value: item,
                              ))
                          .toList(),
                      onChanged: (value) => setState(() {
                        _selectedTheme = value as String;
                        if (value == 'Dark Mode') {
                          // AppCubit.get(context).themeMode == 'dark';
                          //print("Dark Mode");
                        } else if (value == 'Light Mode') {
                          // AppCubit.get(context).themeMode == 'light';
                          //print("Light Mode");
                        } else {
                          // AppCubit.get(context).themeMode == 'system';
                          //print("System default");
                        }
                        //print(newValue);
                      }),
                    ),
                  ],
                ),
                if (!snapshot.hasData) const Text('!snapshot.hasData'),
              ],
            );
          }),
      drawer: const MainDrawer(),
    );
  }
}
