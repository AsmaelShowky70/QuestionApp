import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();
void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("اختبار"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightAnswer = 0; //لتخزين الاسئله الصحيحه
  void checkAnswer(bool whatUserPicked) {
    //لعمل اختبار للاسئله

    bool corectAnswer = appBrain.getQustionAnswer();
    setState(() {
      //كل ما يحدث عند الضغط علي الزر
      if (whatUserPicked == corectAnswer) {
        rightAnswer++;
        answerResult.add(
          Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        );
      } else {
        answerResult.add(
          Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        );
      }
      if (appBrain.isFinished() == true) {
        Alert(
          //لعرض نافذه الانتهاء
          context: context,
          title: "انتهاء الاختبار",
          desc: "لقد اجبت علي $rightAnswer اسئله من اصل 7",
          buttons: [
            DialogButton(
              child: Text(
                "ابدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answerResult = [];
        rightAnswer = 0;
      } else {
        appBrain.nextQuestion(); //لزيادة الرقم وتغير السؤال
      }

      // if (appBrain.anserReset() == true) {                      //في حالة الاسئله كثير
      //   //لتفريغ الايكونات في الاسئله الكثيره
      //   answerResult = [];
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
          //استدعاء اليست
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(
                  appBrain.getQustionImage()), //لاستدعاء الصور من الملف الاخر
              SizedBox(
                height: 20.0,
              ),
              Text(
                appBrain.getQustionText(), //لاستدعاء السؤال من الملف الاخر
                //لاختيار رقم السؤال
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              )
            ],
          ),
        ),
        Expanded(
          //button1
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo),
              ),
              child: Text(
                'صح',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          //button2
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepOrange),
                //لون خلفية الزر لازرار الجديده
              ),
              child: Text(
                'خطأ',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
