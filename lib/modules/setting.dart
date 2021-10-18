import 'package:curricula_apple/models/providers/curricula_provider.dart';
import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:curricula_apple/models/providers/theme_provider.dart';
import 'package:curricula_apple/shared/components/components.dart';
import 'package:curricula_apple/shared/style/colors.dart';
import 'package:curricula_apple/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Widget buildRadioListTile(
    ThemeMode themeValue,
    String text,
    IconData icon,
    BuildContext context,
  ) =>
      RadioListTile(
        title: Text(text),
        secondary: Icon(icon),
        value: themeValue,
        groupValue: Provider.of<ThemeProvider>(context, listen: true).tm,
        onChanged: (newThemeValue) =>
            Provider.of<ThemeProvider>(context, listen: false)
                .themeModeChang(newThemeValue),
      );
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
    bool isEn = Provider.of<LanguageProvider>(context, listen: true).isEn;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            title: Text(lan.getTexts('setting').toString()),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(
                  lan.getTexts('setting').toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        lan.getTexts('theme_screen_title').toString(),
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                      const Divider(
                        height: 50,
                        color: grey,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          lan.getTexts('theme_mode_title').toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      buildRadioListTile(
                        ThemeMode.system,
                        lan.getTexts('System_default_theme').toString(),
                        Icons.ad_units_rounded,
                        context,
                      ),
                      buildRadioListTile(
                        ThemeMode.light,
                        lan.getTexts('light_theme').toString(),
                        Icons.ac_unit_outlined,
                        context,
                      ),
                      buildRadioListTile(
                        ThemeMode.dark,
                        lan.getTexts('dark_theme').toString(),
                        Icons.mode_night_outlined,
                        context,
                      ),
                      buildListTile(context, 'primary'),
                      buildListTile(context, 'accent'),
                    ],
                  ),
                ),
                const Divider(
                  height: 30,
                  color: black,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        lan.getTexts('filters_appBar_title').toString(),
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                      const Divider(
                        height: 50,
                        color: grey,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          lan.getTexts('filters_screen_title').toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          buildSwitchListTile(
                            lan.getTexts('filter_title_arabic').toString(),
                            lan.getTexts('filter_sub_title_arabic').toString(),
                            currentFilters['arabic']!,
                            (value) {
                              setState(() => currentFilters['arabic'] = value);
                              Provider.of<CurriculaProvider>(context,
                                      listen: false)
                                  .setFilters();
                            },
                          ),
                          buildSwitchListTile(
                            lan.getTexts('filter_title_language').toString(),
                            lan
                                .getTexts('filter_sub_title_language')
                                .toString(),
                            currentFilters['languages']!,
                            (value) {
                              setState(
                                  () => currentFilters['languages'] = value);
                              Provider.of<CurriculaProvider>(context,
                                      listen: false)
                                  .setFilters();
                            },
                          ),
                          buildSwitchListTile(
                            lan
                                .getTexts('classesOfSchool.firstGrade')
                                .toString(),
                            lan.getTexts('filter_sub_title_first').toString(),
                            currentFilters['first']!,
                            (value) {
                              setState(() => currentFilters['first'] = value);
                              Provider.of<CurriculaProvider>(context,
                                      listen: false)
                                  .setFilters();
                            },
                          ),
                          buildSwitchListTile(
                            lan
                                .getTexts('classesOfSchool.secondGrade')
                                .toString(),
                            lan.getTexts('filter_sub_title_second').toString(),
                            currentFilters['second']!,
                            (value) {
                              setState(() => currentFilters['second'] = value);
                              Provider.of<CurriculaProvider>(context,
                                      listen: false)
                                  .setFilters();
                            },
                          ),
                          buildSwitchListTile(
                            lan
                                .getTexts('classesOfSchool.thirdGrade')
                                .toString(),
                            lan.getTexts('filter_sub_title_third').toString(),
                            currentFilters['third']!,
                            (value) {
                              setState(() => currentFilters['third'] = value);
                              Provider.of<CurriculaProvider>(context,
                                      listen: false)
                                  .setFilters();
                            },
                          ),
                          buildSwitchListTile(
                            lan
                                .getTexts('classesOfSchool.fourthGrade')
                                .toString(),
                            lan.getTexts('filter_sub_title_fourth').toString(),
                            currentFilters['fourth']!,
                            (value) {
                              setState(() => currentFilters['fourth'] = value);
                              Provider.of<CurriculaProvider>(context,
                                      listen: false)
                                  .setFilters();
                            },
                          ),
                          buildSwitchListTile(
                            lan
                                .getTexts('classesOfSchool.fifthGrade')
                                .toString(),
                            lan.getTexts('filter_sub_title_fifth').toString(),
                            currentFilters['fifth']!,
                            (value) {
                              setState(() => currentFilters['fifth'] = value);
                              Provider.of<CurriculaProvider>(context,
                                      listen: false)
                                  .setFilters();
                            },
                          ),
                          buildSwitchListTile(
                            lan
                                .getTexts('classesOfSchool.sixthGrade')
                                .toString(),
                            lan.getTexts('filter_sub_title_Sixth').toString(),
                            currentFilters['sixth']!,
                            (value) {
                              setState(() => currentFilters['sixth'] = value);
                              Provider.of<CurriculaProvider>(context,
                                      listen: false)
                                  .setFilters();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 30,
                  color: black,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 20, right: 22),
                        child: Text(
                          lan.getTexts('drawer_switch_title').toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: (lan.isEn ? 0 : 20),
                          left: (isEn ? 20 : 0),
                          bottom: (isEn ? 20 : 0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              lan.getTexts('drawer_switch_item2').toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Switch(
                              value: Provider.of<LanguageProvider>(context,
                                      listen: true)
                                  .isEn,
                              onChanged: (value) {
                                Provider.of<LanguageProvider>(context,
                                        listen: false)
                                    .changeLan(value);
                                navigatePop(context);
                              },
                              inactiveTrackColor: Provider.of<ThemeProvider>(
                                              context,
                                              listen: true)
                                          .tm ==
                                      'd'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            Text(
                              lan.getTexts('drawer_switch_item1').toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                      myDivider(10),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(top: 20, right: 22),
                        child: Text(
                          lan.getTexts('drawer_switch_title').toString(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

  ListTile buildListTile(BuildContext context, String text) {
    MaterialColor primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    MaterialColor accentColor =
        Provider.of<ThemeProvider>(context, listen: true).accentColor;
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);
    return ListTile(
        title: Text(
          lan.getTexts(text).toString(),
          style: Theme.of(context).textTheme.headline6,
        ),
        trailing: CircleAvatar(
          backgroundColor: text == 'primary' ? primaryColor : accentColor,
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              elevation: 4,
              titlePadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: text == 'primary'
                      ? Provider.of<ThemeProvider>(context, listen: true)
                          .primaryColor
                      : Provider.of<ThemeProvider>(context, listen: true)
                          .accentColor,
                  onColorChanged: (newColor) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .onChanged(newColor, text == 'primary' ? 1 : 2),
                  colorPickerWidth: 300,
                  pickerAreaHeightPercent: 0.7,
                  enableAlpha: false,
                  displayThumbColor: true,
                  showLabel: false,
                ),
              ),
            ),
          );
        });
  }
}
