import 'package:flutter/material.dart';

import 'categories.dart';
import 'question.dart';
import 'question_catcher.dart';
import 'settings.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qwiz - Fragen'), // TODO
        actions: <Widget>[
          SettingsButton(),
        ],
      ),
      body: GameBody(),
    );
  }
}

class GameBody extends StatefulWidget {
  @override
  GameBodyState createState() => GameBodyState();
}

class GameBodyState extends State {
  final questionPadding = 24.0;
  final buttonPadding = 12.0;
  String questionText = 'Wie viele XYZ sind im Themengebiet <b>asdf</b> bei KL^mn von Bedeutung?';
  String answerText1 = 'Aaaaaaaaaaa';
  String answerText2 = 'Be';
  String answerText3 = 'C\nC\nC';
  String answerText4 = 'DEV';


  changeText() {
    setState(() {
      questionText = 'New Text!!!\n50 \u00B5T';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final questionWidth = screenWidth - 2 * questionPadding;
    final questionHeight = questionWidth / 2;
    final buttonWidth = screenWidth / 2 - 2 * buttonPadding;
    final buttonHeight = buttonWidth / 2;

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: buttonPadding),
          Padding(
            padding: EdgeInsets.all(questionPadding),
            child: SizedBox(
              width: questionWidth,
              height: questionHeight,
              child: Center(
                child: Text(
                  '$questionText',
                  textScaleFactor: 1.5,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(buttonPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => changeText(),
                  child: Text(answerText1),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(buttonPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => changeText(),
                  child: Text(answerText2),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(buttonPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => changeText(),
                  child: Text(answerText3),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(buttonPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => changeText(),
                  child: Text(answerText4),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight - questionHeight - 2 * questionPadding - 2 * buttonHeight - 5 * buttonPadding - 192.0),
          ElevatedButton(
            child: Text('Abbruch'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

}
