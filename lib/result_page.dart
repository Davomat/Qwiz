import 'package:flutter/material.dart';

import 'category_page.dart';
import 'score.dart';
import 'settings.dart';


class ResultPage extends StatefulWidget {
  static final routeName = '/result';

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final generalPadding = 24.0;

  getAsset(Score score) {
    String asset = '';
    double percentage = score.value.toDouble() / score.maxValue.toDouble();

    if (percentage < 0.5)
      asset = 'assets/AtLeastYouTried.png';
    else if (percentage < 0.8)
      asset = 'assets/ThumbsUp.gif';
    else if (percentage < 0.95)
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
      appBar: AppBar(
        title: Text('Ergebnis'),
        actions: <Widget>[
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
        child: Column(
          children: <Widget>[
            SizedBox(height: generalPadding),
            Padding(
              padding: EdgeInsets.all(generalPadding),
              child: Text(
                  'Dein Score:',
                  textScaleFactor: 1.5,
              ),
            ),
            Text(
              score.value.toString() + ' / ' + score.maxValue.toString(),
              textScaleFactor: 2.0,
            ),
            Padding(
              padding: EdgeInsets.all(generalPadding),
              child: getAsset(score),
            ),
            Padding(
              padding: EdgeInsets.all(generalPadding),
              child: SizedBox(
                child: ElevatedButton(
                  child: Text('Zurück', textScaleFactor: 1.25,),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      CategoryPage.routeName,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

