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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final outerSpacing = 0.0625 * screenWidth;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(0.125 * AppBar().preferredSize.height),
          child: Image.asset('assets/Logo.png'),
        ),
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
                  SizedBox(height: outerSpacing),
                  Text(
                      'Dein Score:',
                      textScaleFactor: 1.5,
                  ),
                  SizedBox(height: 0.25 * outerSpacing),
                  Text(
                    score.value.toString() + ' / ' + score.maxValue.toString(),
                    textScaleFactor: 2.0,
                  ),
                  SizedBox(height: 1.5 * outerSpacing),
                  getAsset(score),
                  SizedBox(height: 1.5 * outerSpacing),
                  SizedBox(
                    child: ElevatedButton(
                      child: Text('Zurück zu den Kategorien', textScaleFactor: 1.25,),
                      onPressed: () => Navigator.popUntil(context, ModalRoute.withName(CategoryPage.routeName)),
                    ),
                  ),
                ],
              ),
              TitleScreen.copyrightBlock(0.375 * outerSpacing),
            ],
          ),
        ),
      ),
    );
  }
}

