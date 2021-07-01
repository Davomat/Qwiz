import 'package:flutter/material.dart';

import 'category.dart';
import 'question_provider.dart';
import 'quiz_page.dart';
import 'settings.dart';
import 'title_screen.dart';


class CategoryPage extends StatelessWidget {
  static final routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final outerSpacing = screenWidth * 0.0625;

    return Scaffold(
      appBar: AppBar(
        title: appBarText(context, 'Kategorie-Auswahl'),
        actions: [
          SettingsButton(),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(outerSpacing),
          children: _orderedCategoryButtonsWithHeading(context, outerSpacing, CategoryHandler.getCategoryList()),
        ),
      ),
    );
  }

  List<Widget> _orderedCategoryButtonsWithHeading(BuildContext context, double outerSpacing, List<Category> listOfCategories) {
    List<Widget> widgets = List<Widget>.empty(growable: true);

    widgets.add(SizedBox(height: outerSpacing));
    widgets.add(Center(child: Text("Wähle eine Kategorie!", textScaleFactor: 2.0)));
    widgets.add(SizedBox(height: outerSpacing));

    for (int i=0; i < listOfCategories.length; i++) {
      if (i % 2 == 0)
        widgets.add(_insertButtonLeft(context, outerSpacing, listOfCategories[i]));
      else
        widgets.add(_insertButtonRight(context, outerSpacing, listOfCategories[i]));
    }

    return widgets;
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
          Text(QuestionProvider.getNumberOfQuestions(category).toString() + ' Fragen'),
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
          Text(QuestionProvider.getNumberOfQuestions(category).toString() + ' Fragen'),
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
