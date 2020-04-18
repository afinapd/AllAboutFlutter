import 'package:flutter/material.dart';
import 'package:flutter_app/answer.dart';
import 'package:flutter_app/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  var _questionIndex = 0;

  void answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Favorite Color',
        'answers': ['Blue', 'Yellow', 'Green', 'Red']
      },
      {
        'questionText': 'Favorite Animal',
        'answers': ['Cat', 'Rabbit']
      },
      {
        'questionText': 'Favorite Song',
        'answers': ['Jazz', 'Heavy Metal', 'Pop', 'Classic']
      }
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.red[800],
              leading: Icon(Icons.home),
              title: Text('Hallo')
          ),
          body: _questionIndex < questions.length
              ? Column(
              children: <Widget>[
          Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>)
          .map((answer){
          return Answer(answerQuestion, answer);
    }),
//            Answer(answerQuestion),
//            Answer(answerQuestion),
//            Answer(answerQuestion),
      ],
    ): Center(child:Text('You did it'),),
    ),
    );
  }
}
