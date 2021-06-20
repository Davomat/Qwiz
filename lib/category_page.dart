import 'package:flutter/material.dart';

import 'category.dart';
import 'question_catcher.dart';
import 'quiz_page.dart';
import 'settings.dart';


class CategoryPage extends StatelessWidget {
  static final routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final outerSpacing = screenWidth * 0.0625;

    return Scaffold(
      appBar: AppBar(
        title: Text('Kategorie-Auswahl'),
        actions: [
          SettingsButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(outerSpacing),
        children: [
          SizedBox(height: outerSpacing),
          Center(
            child: Text(
              "Wähle eine Kategorie!",
              textScaleFactor: 2.0,
            ),
          ),
          SizedBox(height: outerSpacing),
          _insertButtonLeft( context, outerSpacing, Category.cosmos),
          _insertButtonRight(context, outerSpacing, Category.science),
          _insertButtonLeft( context, outerSpacing, Category.technology),
          _insertButtonRight(context, outerSpacing, Category.programming),
          _insertButtonLeft( context, outerSpacing, Category.logic),
          _insertButtonRight(context, outerSpacing, Category.biology),
        ],
      ),
    );
  }

  Widget _insertButtonLeft(BuildContext context, double outerSpacing, Category category) {
    return Padding(
      padding: EdgeInsets.only(top: 0.5 * outerSpacing, right: 2 * outerSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _insertButtonWithInfo(context, outerSpacing, category),
      ),
    );
  }

  Widget _insertButtonRight(BuildContext context, double outerSpacing, Category category) {
    return Padding(
      padding: EdgeInsets.only(top: 0.5 * outerSpacing, left: 2 * outerSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _insertButtonWithInfo(context, outerSpacing, category),
      ),
    );
  }

  List<Widget> _insertButtonWithInfo(BuildContext context, double outerSpacing, Category category) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth - 4 * outerSpacing;

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
            );
          },
        ),
      ),
      Text(QuestionCatcher.getNumberOfQuestions(category).toString() + ' Fragen'),
    ];
  }
}
