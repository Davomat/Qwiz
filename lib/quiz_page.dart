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
  final questionPadding = 12.0;
  final buttonPadding = 12.0;
  final questionTextScaleFactor = 1.4;
  final unClickedColor = Colors.grey.shade300;
  final wrongClickedColor = Colors.redAccent.shade200;
  final rightClickedColor = Colors.green;

  bool answerButtonsAreEnabled = true;
  bool nextButtonIsEnabled = false;
  int questionCounter = 0;
  int currentScore = 0;
  int possibleScore = 0;
  int numberOfQuestions = 0;
  String counterText = '';
  String questionText = '';
  String answerText1 = '';
  String answerText2 = '';
  String answerText3 = '';
  String answerText4 = '';
  String infoText = '';
  Color buttonColor1 = Colors.lightGreen;
  Color buttonColor2 = Colors.lightGreen;
  Color buttonColor3 = Colors.lightGreen;
  Color buttonColor4 = Colors.lightGreen;
  List<Question> questions = List.empty();

  setNumberOfQuestions() {
    setState(() {
      numberOfQuestions = questions.length;
    });
  }

  setQuestions(List<Question> listOfQuestions) {
    setState(() {
      questions = listOfQuestions;
    });
  }

  checkAnswer(String answerText) {
    setState(() {
      answerButtonsAreEnabled = false;
      if (answerText == questions.elementAt(questionCounter).rightAnswer)
        currentScore++;
      possibleScore++;
      setButtonColors(answerText);
      infoText = questions.elementAt(questionCounter).additionalInformation;
      nextButtonIsEnabled = true;
    });
  }

  setButtonColors(String answerText) {
    setState(() {
      buttonColor1 = buttonColor2 = buttonColor3 = buttonColor4 = unClickedColor;
      if (answerText1 == answerText) buttonColor1 = wrongClickedColor;
      if (answerText2 == answerText) buttonColor2 = wrongClickedColor;
      if (answerText3 == answerText) buttonColor3 = wrongClickedColor;
      if (answerText4 == answerText) buttonColor4 = wrongClickedColor;
      if (answerText1 == questions.elementAt(questionCounter).rightAnswer) buttonColor1 = rightClickedColor;
      if (answerText2 == questions.elementAt(questionCounter).rightAnswer) buttonColor2 = rightClickedColor;
      if (answerText3 == questions.elementAt(questionCounter).rightAnswer) buttonColor3 = rightClickedColor;
      if (answerText4 == questions.elementAt(questionCounter).rightAnswer) buttonColor4 = rightClickedColor;
    });
  }

  resetButtonColors() {
    setState(() {
      buttonColor1 = buttonColor2 = buttonColor3 = buttonColor4 = Colors.lightGreen;
    });
  }

  getNextQuestion() {
    setState(() {
      nextButtonIsEnabled = false;
      resetButtonColors();
      infoText = '';
      questionCounter++;
      answerButtonsAreEnabled = true;
    });
  }

  updateAllTexts(List<Question> questions) {
    setState(() {
      counterText = 'Frage ' + (questionCounter + 1).toString() + ' von ' + numberOfQuestions.toString() + ':';
      Question currentQuestion = questions.elementAt(questionCounter);
      questionText = currentQuestion.questionText;
      List<String> answers = QuestionCatcher.getRandomAnswerList(currentQuestion);
      answerText1 = answers.removeLast();
      answerText2 = answers.removeLast();
      answerText3 = answers.removeLast();
      answerText4 = answers.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryHandler = ModalRoute.of(context)!.settings.arguments as CategoryHandler;
    final category = categoryHandler.category;

    final appBarHeight = AppBar().preferredSize.height;
    final appBarPadding = MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final questionWidth = screenWidth - 2 * questionPadding;
    final questionHeight = 3 * questionWidth / 8;
    final buttonWidth = screenWidth / 2 - 2 * buttonPadding;
    final buttonHeight = buttonWidth / 2;

    Widget answerButton(String answerText, Color buttonColor) {
      return Padding(
        padding: EdgeInsets.all(buttonPadding),
        child: SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: buttonColor,
            ),
            onPressed: () {
              if (answerButtonsAreEnabled)
                checkAnswer(answerText);
            },
            child: Text(answerText),
          ),
        ),
      );
    }

    if (answerButtonsAreEnabled) {
      setQuestions(QuestionCatcher.getQuestions(category));
      setNumberOfQuestions();
      updateAllTexts(questions);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Fragen - ' + CategoryHandler.getShortString(category)),
        actions: <Widget>[
          SettingsButton(),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(questionPadding),
            child: SizedBox(
              width: questionWidth,
              height: questionHeight,
              child: Text(counterText + '\n\n' + questionText, textScaleFactor: questionTextScaleFactor),
            ),
          ),
          Row(
            children: <Widget>[
              answerButton(answerText1, buttonColor1),
              answerButton(answerText2, buttonColor2),
            ],
          ),
          Row(
            children: <Widget>[
              answerButton(answerText3, buttonColor3),
              answerButton(answerText4, buttonColor4),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(buttonPadding),
            child: SizedBox(
              height: buttonHeight / 4,
              child: Text('Score: ' + currentScore.toString() + ' / ' + possibleScore.toString())
            ),
          ),
          Padding(
            padding: EdgeInsets.all(buttonPadding),
            child: SizedBox(
              height: buttonHeight,
              width: screenWidth - 2 * buttonPadding,
              child: Text(infoText),
            ),
          ),
          SizedBox(height: screenHeight
              - appBarPadding
              - appBarHeight
              - questionHeight - 2 * questionPadding
              - buttonHeight - 2 * buttonPadding
              - buttonHeight - 2 * buttonPadding
              - 0.25 * buttonHeight - buttonPadding
              - buttonHeight - 3 * buttonPadding
              - 0.5 * buttonHeight - 2 * buttonPadding
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(buttonPadding),
                  child: SizedBox(
                    height: buttonHeight / 2,
                    child: ElevatedButton(
                      child: Text('Weiter'),
                      onPressed: nextButtonIsEnabled ? () => getNextQuestion() : null,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(buttonPadding),
                  child: SizedBox(
                    height: buttonHeight / 2,
                    child: ElevatedButton(
                      child: Text('Abbruch'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

