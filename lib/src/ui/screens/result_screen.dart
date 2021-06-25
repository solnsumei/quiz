import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../../core/providers/quiz_provider.dart';


class ResultScreen extends StatelessWidget {
  static const routeName = '/resultScreen';

  void gotoHomeScreen(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }

  String resultMessage(int score) {
    if (score >= 3) {
      return 'CONGRATULATIONS';
    }

    return 'YOU FAILED';
  }

  @override
  Widget build(BuildContext context) {
    final quiz = QuizProvider.of(context);
    final quizSubject = quiz.selectedQuizSubject;

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Result"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          gotoHomeScreen(context);
          return true;
        },
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                width: double.infinity,
                child: Image.asset(quiz.score >= 3
                    ? 'images/icon_winner.png'
                    : 'images/icon_loss.png', height: 150),
              ),
              Text(resultMessage(quiz.score),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: quiz.score >= 3 ? Colors.green : Colors.red,
                  ),
                ),
              SizedBox(height: 40.0),
              Text('YOU SCORED',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${quiz.score}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text('/${quizSubject.questions.length}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text('DURATION',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8.0),
              Text('${quiz.quizDuration()} secs',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10.0),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          await Share.share(
                            'I scored ${quiz.score} out of ${quizSubject.questions.length} in ${quizSubject.name} Quiz',
                            subject: 'My Quiz Result',
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 20,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 20.0,
                          ),
                        ),
                        icon: Icon(Icons.share, size: 16.0,),
                        label: Text('Share', style: TextStyle(
                          fontSize: 16.0,
                        ),),
                      ),
                    ),
                    SizedBox(width: 16.0,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          quiz.startQuiz();
                          Navigator.of(context).pop();
                          },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 20.0,
                          ),
                          child: Text('Retake Quiz'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0,),
            ],
          ),
        ),
      ),
    );
  }
}