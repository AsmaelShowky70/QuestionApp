import 'question.dart';

class AppBrain {
  int _questionNumber = 0;

  List<Question> _questionGrop = [
    //عرض واضافة الاسئله
    Question(
        q: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
        i: 'images/image-1.jpg',
        a: true),
    Question(q: 'القطط هي حيوانات لاحمة', i: 'images/image-2.jpg', a: true),
    Question(
        q: 'الصين موجودة في القارة الإفريقية',
        i: 'images/image-3.jpg',
        a: false),
    Question(q: 'الأرض مسطحة وليست كروية', i: 'images/image-4.jpg', a: false),
    Question(
        q: 'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
        i: 'images/image-5.jpg',
        a: true),
    Question(
        q: 'الشمس تدور حول الأرض والأرض تدور حول القمر',
        i: 'images/image-6.jpg',
        a: false),
    Question(q: 'الحيوانات لا تشعر بالألم', i: 'images/image-7.jpg', a: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionGrop.length - 1) {
      //لتنقل بين الاسئله بدون توقف الابرنامج
      _questionNumber++;
    }
  }

  String getQustionText() {
    //لتغليف والحمايه
    return _questionGrop[_questionNumber].questionText;
  }

  String getQustionImage() {
    //لتغليف والحمايه
    return _questionGrop[_questionNumber].questionImage;
  }

  bool getQustionAnswer() {
    //لتغليف والحمايه
    return _questionGrop[_questionNumber].questionAnswer;
  }

  //لاختبار هل تم انهاء الاسئله ولا لا
  bool isFinished() {
    if (_questionNumber >= _questionGrop.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  // bool anserReset() {
  //   if (_questionNumber == 4) {
  //     return true;
  //   } else {                            //في حالة الاسئله كثييير
  //     return false;
  //   }
  // }
}
