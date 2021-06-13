import 'package:flutter/material.dart';

import 'category.dart';
import 'question.dart';
import 'question_catcher.dart';
import 'settings.dart';

class QuizPage extends StatefulWidget {
  static final routeName = '/quiz';

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final questionPadding = 24.0;
  final buttonPadding = 12.0;

  int questionCounter = 0;
  int numberOfQuestions = 99;
  String counterText = 'Frage 0 von 99:';
  String questionText = 'Wie viele XYZ sind im Themengebiet <b>asdf</b> bei KL^mn von Bedeutung?';
  String answerText1 = 'Aaaaaaaaaaa';
  String answerText2 = 'Be';
  String answerText3 = 'C\nC\nC';
  String answerText4 = 'DEV';

  setNumberOfQuestions(int n) {
    setState(() {
      numberOfQuestions = n;
    });
  }

  increaseQuestionCounter() {
    setState(() {
      questionCounter++;
    });
  }

  updateCounterText() {
    setState(() {
      counterText = 'Frage ' + questionCounter.toString() + ' von ' + numberOfQuestions.toString() + ':';
    });
  }

  changeQuestionText() {
    setState(() {
      questionText = 'New Text!!!\n50 \u00B5T';
    });
  }

  changeTexts() {
    increaseQuestionCounter();
    updateCounterText();
    changeQuestionText();
  }

  @override
  Widget build(BuildContext context) {
    final categoryHandler = ModalRoute.of(context)!.settings.arguments as CategoryHandler;
    final category = categoryHandler.category;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final questionWidth = screenWidth - 2 * questionPadding;
    final questionHeight = questionWidth / 2;
    final buttonWidth = screenWidth / 2 - 2 * buttonPadding;
    final buttonHeight = buttonWidth / 2;

    final questions = QuestionCatcher.getQuestions(category);
    setNumberOfQuestions(questions.length);
    changeTexts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Fragen - ' + CategoryHandler.getShortString(category)),
        actions: <Widget>[
          SettingsButton(),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: buttonPadding),
          Padding(
            padding: EdgeInsets.all(questionPadding),
            child: SizedBox(
              width: questionWidth,
              height: questionHeight,
              child: Center(
                child: Text(
                  counterText + '\n' + questionText,
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
                  onPressed: () => changeTexts(),
                  child: Text(answerText1),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(buttonPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => changeTexts(),
                  child: Text(answerText2),
                ),
              ),
            ],
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
                  onPressed: () => changeTexts(),
                  child: Text(answerText3),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(buttonPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => changeTexts(),
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

