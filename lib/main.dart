import 'package:flutter/material.dart';

import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain=QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [
   ];
 // List<String> questions=[
 //   'You can lead a cow down stairs but not up stairs.',
 //   'Approximately one quarter of human bones are in the feet.',
  //  'A slug\'s blood is green.',


 // ];

 // List<bool> answer=[
 //   false,
  //  true,
  //  true,
 // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex:5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                bool correctAnswer=quizBrain.getCorrectAnswer();
                setState(() {
                if(correctAnswer==true){
                  scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                }
                else{
                  scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                }

                  if(quizBrain.isFinished()){
                    Alert(context: context,title: 'Finished',desc: 'You reached end of quiz').show();
                    quizBrain.reset();
                    scoreKeeper=[];
                  }else{
                quizBrain.nextQuestion();}

                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                bool correctAnswer=quizBrain.getCorrectAnswer();
                setState(() {
                  if(correctAnswer==false){
                    scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                  }
                  else{
                    scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                  }

                  if(quizBrain.isFinished()){
                    Alert(context: context,title: 'Finished',desc: 'You reached end of quiz').show();
                    quizBrain.reset();
                    scoreKeeper=[];
                  }else{
                    quizBrain.nextQuestion();}

                });
              },
            ),
          ),
        ),
        Row(
          children:scoreKeeper,
        )

      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
