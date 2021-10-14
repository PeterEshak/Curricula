import 'package:curricula_apple/models/providers/theme_provider.dart';
import 'package:curricula_apple/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your theme'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your theme selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildRadioListTile(
            ThemeMode.system,
            'System Default Theme',
            Icons.ad_units_rounded,
            context,
          ),
          buildRadioListTile(
            ThemeMode.light,
            'Light Theme',
            Icons.ac_unit_outlined,
            context,
          ),
          buildRadioListTile(
            ThemeMode.dark,
            'Dark Theme',
            Icons.mode_night_outlined,
            context,
          ),
          buildListTile(context, 'primary'),
          buildListTile(context, 'accent'),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

  ListTile buildListTile(BuildContext context, String text) {
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var accentColor =
        Provider.of<ThemeProvider>(context, listen: true).accentColor;
    return ListTile(
        title: Text(
          'Choose your $text color',
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
