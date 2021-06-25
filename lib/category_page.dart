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
          _insertButtonLeft(context, outerSpacing, Category.biology),
          _insertButtonRight( context, outerSpacing, Category.logic),
        ],
      ),
    );
  }

  Widget _insertButtonLeft(BuildContext context, double outerSpacing, Category category) {
    return Padding(
      padding: EdgeInsets.only(top: 0.75 * outerSpacing),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _insertButton(context, outerSpacing, category),
                Image.asset(CategoryHandler.getIcon(category), width: 1.5 * outerSpacing),
              ],
            ),
            Text(QuestionCatcher.getNumberOfQuestions(category).toString() + ' Fragen'),
          ]
      ),
    );
  }

  Widget _insertButtonRight(BuildContext context, double outerSpacing, Category category) {
    return Padding(
      padding: EdgeInsets.only(top: 0.5 * outerSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(CategoryHandler.getIcon(category), width: 1.5 * outerSpacing),
              _insertButton(context, outerSpacing, category),
            ],
          ),
          Text(QuestionCatcher.getNumberOfQuestions(category).toString() + ' Fragen'),
        ]
      ),
    );
  }

  Widget _insertButton(BuildContext context, double outerSpacing, Category category) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth - 4 * outerSpacing;

    return SizedBox(
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
    );
  }
}
