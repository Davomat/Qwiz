import 'package:code_labs/game.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'categories.dart';
import 'question_catcher.dart';
import 'settings.dart';


class CategoryPage extends StatelessWidget {
  final buttonPadding = 24.0;
  final buttonVerticalSpacing = 12.0;
  final buttonSideSpacing = 48.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategorie-Auswahl'),
        actions: <Widget>[
          SettingsButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(buttonPadding),
        children: <Widget>[
          SizedBox(height: buttonVerticalSpacing),
          Center(
            child: Text(
              "Wähle eine Kategorie!",
              textScaleFactor: 2.0,
            ),
          ),
          SizedBox(height: buttonVerticalSpacing),
          SizedBox(height: buttonVerticalSpacing),
          _insertButtonLeft(context, 'Kosmos und Physik', Category.cosmos),
          SizedBox(height: buttonVerticalSpacing),
          _insertButtonRight(context, 'Naturwissenschaften', Category.science),
          SizedBox(height: buttonVerticalSpacing),
          _insertButtonLeft(context, 'Technik / Ingenieurswissen', Category.technology),
          SizedBox(height: buttonVerticalSpacing),
          _insertButtonRight(context, 'Informatik / Programmierung', Category.programming),
          SizedBox(height: buttonVerticalSpacing),
          _insertButtonLeft(context, 'Logik und Mathematik', Category.logic),
          SizedBox(height: buttonVerticalSpacing),
          _insertButtonRight(context, 'Ernährung und Fitness', Category.fitness),
        ],
      ),
    );
  }

  Widget _insertButtonLeft(BuildContext context, String buttonText, Category category) {
    return Padding(
      padding: EdgeInsets.only(right: buttonSideSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _insertButtonWithInfo(context, buttonText, category),
      ),
    );
  }

  Widget _insertButtonRight(BuildContext context, String buttonText, Category category) {
    return Padding(
      padding: EdgeInsets.only(left: buttonSideSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _insertButtonWithInfo(context, buttonText, category),
      ),
    );
  }

  List<Widget> _insertButtonWithInfo(BuildContext context, String buttonText, Category category) {
    final screenWidth = MediaQuery.of(context).size.width;

    return [
      SizedBox(
        width: screenWidth - 2 * buttonPadding - buttonSideSpacing,
        child: ElevatedButton(
          child: Text(
            buttonText,
            textScaleFactor: 1.25,
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: GamePage(),
              ),
            );
          },
        ),
      ),
      Text(QuestionCatcher.getNumberOfQuestions(category).toString() + ' Fragen'),
    ];
  }
}
