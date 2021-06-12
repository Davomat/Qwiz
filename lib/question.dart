
class Question {
  String questionText;
  String rightAnswer;
  String wrongAnswer1;
  String wrongAnswer2;
  String wrongAnswer3;
  String additionalInformation;

  Question({required this.questionText,
            required this.rightAnswer,
            required this.wrongAnswer1,
            required this.wrongAnswer2,
            required this.wrongAnswer3,
                     this.additionalInformation = ''});

}
