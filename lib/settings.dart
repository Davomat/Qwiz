import 'package:code_labs/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SettingsPage extends StatelessWidget {
  static final routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Einstellungen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer<ThemeNotifier>(
              builder:(context, notifier, child) => SwitchListTile(
                title: Text("Dark Mode"),
                onChanged:(value){
                  notifier.toggleTheme();
                } ,
                value: notifier.darkTheme,
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
