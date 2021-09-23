class Question {
  late String questionText;
  late String questionImage;
  late bool questionAnswer;

  Question({String q = '', String i = '', bool a = true}) {
    questionText = q;
    questionImage = i;
    questionAnswer = a;
  }
}
