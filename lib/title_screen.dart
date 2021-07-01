import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'category_page.dart';
import 'quiz_page.dart';
import 'result_page.dart';
import 'settings.dart';
import 'theme_color.dart';
import 'theme_notifier.dart';


class TitleScreenRoot extends StatelessWidget {
  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: 'Qwiz',
            theme: ThemeData(
              brightness: notifier.darkMode ? Brightness.dark : Brightness.light,
              primaryColor: ColorHandler.colorOf(notifier.themeColor, notifier.darkMode),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: ColorHandler.colorOf(notifier.themeColor, notifier.darkMode),
                  onPrimary: notifier.darkMode ? Colors.white : Colors.black,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: ColorHandler.colorOf(notifier.themeColor, notifier.darkMode),
                ),
              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: notifier.darkMode ? Colors.white : Colors.black,
                ),
              ),
              pageTransitionsTheme: PageTransitionsTheme(builders: {
                TargetPlatform.iOS: FadeTransitionBuilder(),
                TargetPlatform.android: FadeTransitionBuilder(),
              }),
            ),
            initialRoute: TitleScreenRoot.routeName,
            routes: {
              SettingsPage.routeName: (context) => SettingsPage(),
              CategoryPage.routeName: (context) => CategoryPage(),
              QuizPage.routeName: (context) => QuizPage(),
              ResultPage.routeName: (context) => ResultPage(),
            },
            home: TitleScreen(),
          );
        },
      ),
    );
  }
}


class TitleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final outerSpacing = screenWidth * 0.0625;
    final logoWidth = screenWidth - 4 * outerSpacing;
    final logoHeight = 0.5 * logoWidth;
    final buttonWidth = screenWidth - 2 * outerSpacing;
    final buttonHeight = 0.125 * buttonWidth;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).canvasColor,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(outerSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 2 * outerSpacing),
                  Padding(
                    padding: EdgeInsets.all(outerSpacing),
                    child: Image.asset(
                      getLogo(Theme.of(context).brightness),
                      height: logoHeight,
                      width: logoWidth,
                    ),
                  ),
                  SizedBox(height: 2 * outerSpacing),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: Text('Start'.toUpperCase(), textScaleFactor: 1.25),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          CategoryPage.routeName,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 2 * outerSpacing),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: TextButton(
                      child: Text('Einstellungen', textScaleFactor: 1.25),
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
              copyrightBlock(0.375 * outerSpacing),
            ],
          ),
        ),
      ),
    );
  }

  static String getLogo(Brightness brightness) {
    return brightness == Brightness.light
        ? 'assets/LogoBlack.png'
        : 'assets/LogoWhite.png';
  }

  static Widget copyrightBlock(double spacing) {
    final madeLogosSize = 16.0;

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('made with:'),
            SizedBox(height: spacing),
            Text('made by:'),
          ],
        ),
        SizedBox(width: spacing),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FlutterLogo(size: madeLogosSize),
                Text(' Flutter / Dart'),
              ],
            ),
            SizedBox(height: spacing),
            Row(
              children: [
                Image.asset('assets/D.png', height: madeLogosSize,),
                Text(' Daveloper - © David Lange'),
              ],
            ),
          ],
        )
      ],
    );
  }
}

Widget appBarText(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white
    ),
  );
}
