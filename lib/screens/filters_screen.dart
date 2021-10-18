import 'package:curricula_apple/models/providers/language_provider.dart';

import '../models/providers/curricula_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  final bool fromOnBoarding;
  const FiltersScreen({Key? key, this.fromOnBoarding = false})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
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
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            title: widget.fromOnBoarding
                ? null
                : Text(lan.getTexts('filter').toString()),
            backgroundColor: widget.fromOnBoarding
                ? Theme.of(context).canvasColor
                : Theme.of(context).primaryColor,
            elevation: widget.fromOnBoarding ? 0 : 5,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    lan.getTexts('filters_screen_title').toString(),
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                buildSwitchListTile(
                  lan.getTexts('filter_title_arabic').toString(),
                  lan.getTexts('filter_sub_title_arabic').toString(),
                  currentFilters['arabic']!,
                  (value) {
                    setState(() => currentFilters['arabic'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                buildSwitchListTile(
                  lan.getTexts('filter_title_language').toString(),
                  lan.getTexts('filter_sub_title_language').toString(),
                  currentFilters['languages']!,
                  (value) {
                    setState(() => currentFilters['languages'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                buildSwitchListTile(
                  lan.getTexts('classesOfSchool.firstGrade').toString(),
                  lan.getTexts('filter_sub_title_first').toString(),
                  currentFilters['first']!,
                  (value) {
                    setState(() => currentFilters['first'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                buildSwitchListTile(
                  lan.getTexts('classesOfSchool.secondGrade').toString(),
                  lan.getTexts('filter_sub_title_second').toString(),
                  currentFilters['second']!,
                  (value) {
                    setState(() => currentFilters['second'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                buildSwitchListTile(
                  lan.getTexts('classesOfSchool.thirdGrade').toString(),
                  lan.getTexts('filter_sub_title_third').toString(),
                  currentFilters['third']!,
                  (value) {
                    setState(() => currentFilters['third'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                buildSwitchListTile(
                  lan.getTexts('classesOfSchool.fourthGrade').toString(),
                  lan.getTexts('filter_sub_title_fourth').toString(),
                  currentFilters['fourth']!,
                  (value) {
                    setState(() => currentFilters['fourth'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                buildSwitchListTile(
                  lan.getTexts('classesOfSchool.fifthGrade').toString(),
                  lan.getTexts('filter_sub_title_fifth').toString(),
                  currentFilters['fifth']!,
                  (value) {
                    setState(() => currentFilters['fifth'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                buildSwitchListTile(
                  lan.getTexts('classesOfSchool.sixthGrade').toString(),
                  lan.getTexts('filter_sub_title_Sixth').toString(),
                  currentFilters['sixth']!,
                  (value) {
                    setState(() => currentFilters['sixth'] = value);
                    Provider.of<CurriculaProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                SizedBox(height: widget.fromOnBoarding ? 80 : 0),
              ],
            ),
          ),
        ],
      ),
      drawer: widget.fromOnBoarding ? null : const MainDrawer(),
    );
  }
}
