import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_color.dart';
import 'theme_notifier.dart';
import 'title_screen.dart';


class SettingsPage extends StatefulWidget {
  static final routeName = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarText(context, 'Einstellungen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Theme:', textScaleFactor: 1.5),
              SizedBox(height: 16.0),
              Consumer<ThemeNotifier>(
                builder:(context, notifier, child) => SwitchListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text("Dark Mode"),
                  onChanged:(value){
                    notifier.toggleTheme();
                  } ,
                  value: notifier.darkMode,
                ),
              ),
              Consumer<ThemeNotifier>(
                builder:(context, notifier, child) => DropdownButton(
                  iconSize: 48.0,
                  isExpanded: true,
                  iconEnabledColor: Theme.of(context).primaryColor,
                  iconDisabledColor: Theme.of(context).primaryColor,
                  value: notifier.themeColor,
                  items: ColorHandler.getAllThemeColors()
                    .map<DropdownMenuItem<ThemeColor>>((ThemeColor value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(ColorHandler.stringOf(value)),
                    );
                  }).toList(),
                  onChanged: (ThemeColor? newValue) {
                    notifier.changeColor(newValue!);
                  },
                ),
              ),
              SizedBox(height: 48.0),
              Text('Special Thanks to:', textScaleFactor: 1.5),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                child: Text(
                    '• flutter.dev' + '\n' +
                    '• stackoverflow.com' + '\n' +
                    '• maiLab @YoutTube' + '\n' +
                    '• Kurzgesagt @YoutTube' + '\n' +
                    '• Veritasium @YoutTube' + '\n' +
                    '• wikipedia.org' + '\n' +
                    '\n' +
                    'Besonderer Dank geht auch an meine Freunde und Familie, die mir mit vielen Vorschlägen und Tests geholfen haben, das Quiz zu verschönern und zu vervollständigen.'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.menu,
        semanticLabel: 'settings',
      ),
      onPressed: () {
        Navigator.pushNamed(
          context,
          SettingsPage.routeName,
        );
      },
    );
  }
}

class FadeTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(_, __, animation, ___, child) => FadeTransition(opacity: animation, child: child);
}
