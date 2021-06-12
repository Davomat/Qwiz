import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class SettingsPage extends StatelessWidget {
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
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.topRight,
            child: SettingsPage(),
          ),
        );
      },
    );
  }
}
