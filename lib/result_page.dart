import 'package:flutter/material.dart';

import 'category_page.dart';
import 'score.dart';
import 'settings.dart';
import 'title_screen.dart';


class ResultPage extends StatefulWidget {
  static final routeName = '/result';

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final outerPadding = 24.0;

  getAsset(Score score) {
    String asset = '';
    double percentage = score.value.toDouble() / score.maxValue.toDouble();

    if (percentage < 0.4)
      asset = 'assets/AtLeastYouTried.png';
    else if (percentage < 0.7)
      asset = 'assets/ThumbsUp.gif';
    else if (percentage < 0.9)
      asset = 'assets/Proud.gif';
    else
      asset = 'assets/Cheers.gif';

    return Image.asset(
      asset,
    );
  }

  @override
  Widget build(BuildContext context) {
    final score = ModalRoute.of(context)!.settings.arguments as Score;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar( // TODO - kein zurück Button
        title: Text('Ergebnis'),
        actions: [
          SettingsButton(),
        ],
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
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
                  SizedBox(height: outerPadding),
                  Text(
                      'Dein Score:',
                      textScaleFactor: 1.5,
                  ),
                  SizedBox(height: outerPadding / 4),
                  Text(
                    score.value.toString() + ' / ' + score.maxValue.toString(),
                    textScaleFactor: 2.0,
                  ),
                  SizedBox(height: 1.25 * outerPadding),
                  getAsset(score),
                  SizedBox(height: 1.25 * outerPadding),
                  SizedBox(
                    child: ElevatedButton(
                      child: Text('Zur Kategorie-Auswahl', textScaleFactor: 1.25,),
                      onPressed: () => Navigator.popUntil(context, ModalRoute.withName(CategoryPage.routeName)),
                    ),
                  ),
                ],
              ),
              TitleScreenContent.copyrightBlock(),
            ],
          ),
        ),
      ),
    );
  }
}

