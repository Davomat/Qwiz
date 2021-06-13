import 'dart:math';

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
  int numberOfQuestions = 0;
  String counterText = '';
  String questionText = '';
  String answerText1 = '';
  String answerText2 = '';
  String answerText3 = '';
  String answerText4 = '';
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

  List<String> myRandomAnswerList(Question q) {
    final answers = List<String>.empty(growable: true);
    final temp = List<String>.empty(growable: true);

    temp.add(q.rightAnswer);
    temp.add(q.wrongAnswer1);
    temp.add(q.wrongAnswer2);
    temp.add(q.wrongAnswer3);

    answers.add(temp.removeAt(Random().nextInt(4)));
    answers.add(temp.removeAt(Random().nextInt(3)));
    answers.add(temp.removeAt(Random().nextInt(2)));
    answers.add(temp.removeAt(0));

    return answers;
  }

  increaseQuestionCounter() {
    setState(() {
      questionCounter++;
    });
  }

  updateAllTexts(List<Question> questions) {
    setState(() {
      counterText = 'Frage ' + (questionCounter + 1).toString() + ' von ' + numberOfQuestions.toString() + ':';
      Question currentQuestion = questions.elementAt(questionCounter);
      questionText = currentQuestion.questionText;
      List<String> answers = myRandomAnswerList(currentQuestion);
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

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final questionWidth = screenWidth - 2 * questionPadding;
    final questionHeight = questionWidth / 2;
    final buttonWidth = screenWidth / 2 - 2 * buttonPadding;
    final buttonHeight = buttonWidth / 2;

    setQuestions(QuestionCatcher.getQuestions(category));
    setNumberOfQuestions();
    updateAllTexts(questions);

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
                  onPressed: () => increaseQuestionCounter(),
                  child: Text(answerText1),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(buttonPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => increaseQuestionCounter(),
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
                  onPressed: () => increaseQuestionCounter(),
                  child: Text(answerText3),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(buttonPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => increaseQuestionCounter(),
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

