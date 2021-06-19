import 'package:flutter/material.dart';

import 'category_page.dart';
import 'quiz_page.dart';
import 'result_page.dart';
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
        ResultPage.routeName: (context) => ResultPage(),
      },
      home: TitleScreenContent(),
    );
  }
}

class TitleScreenContent extends StatelessWidget {
  static final outerPadding = 24.0;
  static final innerMadePadding = 12.0;
  static final madeLogosSize = 16.0;

  static Widget copyrightBlock() {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('made with:'),
            SizedBox(height: innerMadePadding),
            Text('made by:'),
          ],
        ),
        SizedBox(width: innerMadePadding),
        Column(
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
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final logoWidth = screenWidth - 4 * outerPadding;
    final logoHeight = logoWidth / 2;
    final buttonWidth = screenWidth - 2 * outerPadding;
    final buttonHeight = buttonWidth / 8;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.lightGreen.shade400,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(outerPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 2 * outerPadding),
                  Padding(
                    padding: EdgeInsets.all(outerPadding),
                    child: Image.asset(
                      'assets/Logo.png',
                      height: logoHeight,
                      width: logoWidth,
                    ),
                  ),
                  SizedBox(height: 2 * outerPadding),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: Text('START', textScaleFactor: 1.25,),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          CategoryPage.routeName,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 2 * outerPadding),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: TextButton(
                      child: Text('Einstellungen', textScaleFactor: 1.25,),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          SettingsPage.routeName,
                        );
                      },
                    ),
                  ),
                ],
              ),
              copyrightBlock(),
            ],
          ),
        ),
      ),
    );
  }
}
