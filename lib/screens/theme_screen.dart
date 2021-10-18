import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:curricula_apple/models/providers/theme_provider.dart';
import 'package:curricula_apple/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  final bool fromOnBoarding;
  const ThemeScreen({Key? key, this.fromOnBoarding = false}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            title: fromOnBoarding
                ? null
                : Text(lan.getTexts('theme_screen_title').toString()),
            backgroundColor: fromOnBoarding
                ? Theme.of(context).canvasColor
                : Theme.of(context).primaryColor,
            elevation: fromOnBoarding ? 0 : 5,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    lan.getTexts('theme_screen_title').toString(),
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
                SizedBox(height: fromOnBoarding ? 80 : 0),
              ],
            ),
          ),
        ],
      ),
      drawer: fromOnBoarding ? null : const MainDrawer(),
    );
  }

  ListTile buildListTile(BuildContext context, String text) {
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var accentColor =
        Provider.of<ThemeProvider>(context, listen: true).accentColor;
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
