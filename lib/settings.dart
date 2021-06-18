import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  static final routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Einstellungen'),
      ),
      body: Center(
        child: Text('Einstellungen'),
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
          /*
          PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.topRight,
            child: SettingsPage(),
          ),
           */
        );
      },
    );
  }
}
