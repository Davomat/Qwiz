import 'package:code_labs/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'category_page.dart';
import 'settings.dart';


class TitleScreen extends StatelessWidget {
  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qwiz',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: TitleScreen.routeName,
      routes: {
        SettingsPage.routeName: (context) => SettingsPage(),
        CategoryPage.routeName: (context) => CategoryPage(),
        QuizPage.routeName: (context) => QuizPage(),
      },
      home: TitleScreenContent(),
    );
  }
}

class TitleScreenContent extends StatelessWidget {
  final logoPadding = 48.0;
  final buttonPadding = 24.0;
  final innerMadePadding = 12.0;
  final madeLogosSize = 16.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final logoWidth = screenWidth - 2 * logoPadding;
    final logoHeight = logoWidth / 2;
    final buttonWidth = screenWidth - 2 * buttonPadding;
    final buttonHeight = buttonWidth / 8;
    final copyrightWidth = screenWidth / 2 - 2 * buttonPadding;
    final copyrightHeight = copyrightWidth / 2;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightGreen.shade400,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: logoPadding),
            Padding(
              padding: EdgeInsets.all(logoPadding),
              child: Image.asset(
                'assets/Logo.png',
                height: logoHeight,
                width: logoWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(buttonPadding),
              child: SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  child: Text('START', textScaleFactor: 1.25,),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      CategoryPage.routeName,
                      /*
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: CategoryPage(),
                      ),
                       */
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(buttonPadding),
              child: SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TextButton(
                  child: Text('Einstellungen', textScaleFactor: 1.25,),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      SettingsPage.routeName,
                      /*
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: SettingsPage(),
                      ),
                       */
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight
                - logoHeight - 3 * logoPadding
                - 2 * buttonHeight - 4 * buttonPadding
                - copyrightHeight - 2 * buttonPadding
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(buttonPadding, buttonPadding, 0.0, buttonPadding),
                  child: SizedBox(
                    height: copyrightHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('made with:'),
                        SizedBox(height: innerMadePadding),
                        Text('made by:'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: innerMadePadding),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, buttonPadding, buttonPadding, buttonPadding),
                  child: SizedBox(
                    height: copyrightHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FlutterLogo(size: madeLogosSize),
                            Text(' Flutter / Dart'),
                          ],
                        ),
                        SizedBox(height: innerMadePadding),
                        Row(
                          children: [
                            Image.asset('assets/D.png', height: madeLogosSize,),
                            Text(' Daveloper - \u00a9 David Lange'),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
