import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_color.dart';
import 'theme_provider.dart';


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
        title: Text('Einstellungen'),
      ),
      body: Padding(
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
                value: notifier.darkTheme,
              ),
            ),
            Consumer<ThemeNotifier>(
              builder:(context, notifier, child) => DropdownButton(
                iconSize: 48.0,
                isExpanded: true,
                iconEnabledColor: Theme.of(context).primaryColor,
                iconDisabledColor: Theme.of(context).primaryColor,
                value: notifier.themeColor,
                items: getAllColors()
                  .map<DropdownMenuItem<ThemeColor>>((ThemeColor value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(stringOf(value)),
                  );
                }).toList(),
                onChanged: (ThemeColor? newValue) {
                  notifier.changeColor(newValue!);
                },
              ),
            ),
          ],
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
