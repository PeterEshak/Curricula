import 'package:curricula_apple/models/providers/curricula_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // bool _arabic = false;
  // bool _languages = false;
  // bool _first = false;
  // bool _second = false;
  // bool _third = false;
  // bool _fourth = false;
  // bool _fifth = false;
  // bool _sixth = false;

  // @override
  // initState() {
  //   final Map<String, bool> currentFilters =
  //       Provider.of<CurriculaProvider>(context, listen: false).filters;

  //   _arabic = currentFilters['arabic']!;
  //   _languages = currentFilters['languages']!;
  //   _first = currentFilters['first']!;
  //   _second = currentFilters['second']!;
  //   _third = currentFilters['third']!;
  //   _fourth = currentFilters['fourth']!;
  //   _fifth = currentFilters['fifth']!;
  //   _sixth = currentFilters['sixth']!;
  //   super.initState();
  // }

  Widget buildSwitchListTile(
    String title,
    String description,
    bool type,
    Function updateNewValue,
  ) =>
      SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: type,
        onChanged: (bool value) => updateNewValue(value),
        inactiveTrackColor: Colors.black,
      );

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilters =
        Provider.of<CurriculaProvider>(context, listen: true).filters;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.save),
        //     onPressed: () {
        //       final selectedFilters = {
        //         'arabic': _arabic,
        //         'languages': _languages,
        //         'first': _first,
        //         'second': _second,
        //         'third': _third,
        //         'fourth': _fourth,
        //         'fifth': _fifth,
        //         'sixth': _sixth,
        //       };
        //       Provider.of<CurriculaProvider>(context, listen: false)
        //           .setFilters(selectedFilters);
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Arabic',
                  'Arabic Language',
                  currentFilters['arabic']!,
                  (value) {
                    setState(() => currentFilters['arabic'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false).setFilters();
                  },
                ),
                buildSwitchListTile(
                  'Language',
                  'English Language',
                  currentFilters['languages']!,
                  (value) {
                    setState(() => currentFilters['languages'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false).setFilters();
                  },
                ),
                buildSwitchListTile(
                  'First',
                  'First grade primary',
                  currentFilters['first']!,
                  (value) {
                    setState(() => currentFilters['first'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false).setFilters();
                  },
                ),
                buildSwitchListTile(
                  'Second',
                  'Second grade primary',
                  currentFilters['second']!,
                  (value) {
                    setState(() => currentFilters['second'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false).setFilters();
                  },
                ),
                buildSwitchListTile(
                  'Third',
                  'Third grade primary',
                  currentFilters['third']!,
                  (value) {
                    setState(() => currentFilters['third'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false).setFilters();
                  },
                ),
                buildSwitchListTile(
                  'fourth',
                  'Fourth grade primary',
                  currentFilters['fourth']!,
                  (value) {
                    setState(() => currentFilters['fourth'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false).setFilters();
                  },
                ),
                buildSwitchListTile(
                  'Fifth',
                  'Fifth grade primary',
                  currentFilters['fifth']!,
                  (value) {
                    setState(() => currentFilters['fifth'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false).setFilters();
                  },
                ),
                buildSwitchListTile(
                  'Sixth',
                  'Sixth grade primary',
                  currentFilters['sixth']!,
                  (value) {
                    setState(() => currentFilters['sixth'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false).setFilters();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
