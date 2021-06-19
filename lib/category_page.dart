import 'package:flutter/material.dart';

import 'category.dart';
import 'question_catcher.dart';
import 'quiz_page.dart';
import 'settings.dart';


class CategoryPage extends StatelessWidget {
  static final routeName = '/categories';

  final outerPadding = 24.0;
  final buttonVerticalSpacing = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategorie-Auswahl'),
        actions: [
          SettingsButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(outerPadding),
        children: [
          SizedBox(height: buttonVerticalSpacing),
          Center(
            child: Text(
              "Wähle eine Kategorie!",
              textScaleFactor: 2.0,
            ),
          ),
          SizedBox(height: buttonVerticalSpacing),
          _insertButtonLeft(context, Category.cosmos),
          _insertButtonRight(context, Category.science),
          _insertButtonLeft(context, Category.technology),
          _insertButtonRight(context, Category.programming),
          _insertButtonLeft(context, Category.logic),
          _insertButtonRight(context, Category.health),
        ],
      ),
    );
  }

  Widget _insertButtonLeft(BuildContext context, Category category) {
    return Padding(
      padding: EdgeInsets.only(top: buttonVerticalSpacing, right: 2 * outerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _insertButtonWithInfo(context, category),
      ),
    );
  }

  Widget _insertButtonRight(BuildContext context, Category category) {
    return Padding(
      padding: EdgeInsets.only(top: buttonVerticalSpacing, left: 2 * outerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _insertButtonWithInfo(context, category),
      ),
    );
  }

  List<Widget> _insertButtonWithInfo(BuildContext context, Category category) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth - 4 * outerPadding;

    return [
      SizedBox(
        width: buttonWidth,
        child: ElevatedButton(
          child: Text(
            CategoryHandler.getFullString(category),
            textScaleFactor: 1.25,
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              QuizPage.routeName,
              arguments: CategoryHandler(category),
              /*
              PageTransition(
                type: PageTransitionType.fade,
                child: QuizPage(),
              ),
               */
            );
          },
        ),
      ),
      Text(QuestionCatcher.getNumberOfQuestions(category).toString() + ' Fragen'),
    ];
  }
}
