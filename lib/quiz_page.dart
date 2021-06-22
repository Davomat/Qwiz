import 'package:flutter/material.dart';

import 'category.dart';
import 'question.dart';
import 'question_catcher.dart';
import 'result_page.dart';
import 'score.dart';
import 'settings.dart';


class QuizPage extends StatefulWidget {
  static final routeName = '/quiz';

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final wrongClickedColor = Colors.redAccent.shade200;
  final rightClickedColor = Colors.green;
  final unClickedColor = Colors.grey;

  bool answerButtonsAreEnabled = true;
  bool nextButtonIsEnabled = false;
  int questionCounter = 0;
  Score score = Score();
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

  setQuestions(List<Question> listOfQuestions) {
    setState(() {
      questions = listOfQuestions;
    });
  }

  setNumberOfQuestions() {
    setState(() {
      numberOfQuestions = questions.length;
    });
  }

  checkAnswer(String answerText) {
    setState(() {
      answerButtonsAreEnabled = false;
      score.increase(answerText == questions.elementAt(questionCounter).rightAnswer);
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
      buttonColor1 = buttonColor2 = buttonColor3 = buttonColor4 = Theme.of(context).primaryColor;
    });
  }

  getNextQuestion() {
    setState(() {
      if (questionCounter < numberOfQuestions - 1) {
        nextButtonIsEnabled = false;
        infoText = '';
        questionCounter++;
        answerButtonsAreEnabled = true;
      }
      else {
        Navigator.pushNamed(
          context,
          ResultPage.routeName,
          arguments: score,
        );
      }
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

  Widget answerButton(String answerText, Color buttonColor, double buttonWidth, double buttonHeight) {
    return SizedBox(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryHandler = ModalRoute.of(context)!.settings.arguments as CategoryHandler;
    final category = categoryHandler.category;

    final screenWidth = MediaQuery.of(context).size.width;
    final outerSpacing = 0.03125 * screenWidth;
    final innerSpacing = 0.046875 * screenWidth;
    final questionWidth = screenWidth - 2 * outerSpacing;
    final questionHeight = 0.25 * questionWidth;
    final buttonWidth = 0.5 * screenWidth - outerSpacing - 0.5 * innerSpacing;
    final buttonHeight = 0.5 * buttonWidth;

    if (answerButtonsAreEnabled) {
      setQuestions(QuestionCatcher.getQuestions(category));
      setNumberOfQuestions();
      resetButtonColors();
      updateAllTexts(questions);
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(0.125 * AppBar().preferredSize.height),
          child: Image.asset('assets/Logo.png'),
        ),
        title: Text('Fragen - ' + CategoryHandler.getShortString(category)),
        actions: [
          SettingsButton(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(outerSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(counterText, textScaleFactor: 1.375),
                SizedBox(height: outerSpacing),
                SizedBox(
                  //width: questionWidth,
                  height: questionHeight,
                  child: SingleChildScrollView(
                      child: Text(questionText, textScaleFactor: 1.375),
                  ),
                ),
                SizedBox(height: innerSpacing),
                Row(
                  children: [
                    answerButton(answerText1, buttonColor1, buttonWidth, buttonHeight),
                    SizedBox(width: innerSpacing),
                    answerButton(answerText2, buttonColor2, buttonWidth, buttonHeight),
                  ],
                ),
                SizedBox(height: innerSpacing),
                Row(
                  children: [
                    answerButton(answerText3, buttonColor3, buttonWidth, buttonHeight),
                    SizedBox(width: innerSpacing),
                    answerButton(answerText4, buttonColor4, buttonWidth, buttonHeight),
                  ],
                ),
                SizedBox(height: innerSpacing),
                Center(
                  child: Text('Score: ' + score.value.toString() + ' / ' + score.maxValue.toString()),
                ),
              ],
            ),
            SingleChildScrollView(
                child: Text(infoText),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 0.5 * buttonHeight,
                    child: ElevatedButton(
                      child: Text('Abbruch'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                SizedBox(width: innerSpacing),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 0.5 * buttonHeight,
                    child: ElevatedButton(
                      child: Text('Weiter'),
                      onPressed: nextButtonIsEnabled ? () => getNextQuestion() : null,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

