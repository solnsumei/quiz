import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../../core/providers/quiz_provider.dart';
import '../widgets/constants.dart';


class ResultScreen extends StatelessWidget {
  static const routeName = '/resultScreen';

  void gotoHomeScreen(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/home'));
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
                child: Image.asset(quiz.passScore()
                    ? 'images/icon_winner.png'
                    : 'images/icon_loss.png', height: 150),
              ),
              Text(quiz.resultMessage(),
                  style: kBoldDarkTextStyle.copyWith(
                    fontSize: 22,
                    color: quiz.passScore() ? Colors.green : Colors.red,
                  ),
                ),
              SizedBox(height: 40.0),
              Text('YOU SCORED',
                style: kNormalTextStyle,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${quiz.score}',
                    style: kBoldDarkTextStyle.copyWith(fontSize: 30.0),
                  ),
                  Text(' / ${quiz.numberOfQuestions}',
                    style: kNormalTextStyle.copyWith(
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text('DURATION',
                style: kNormalTextStyle,
              ),
              SizedBox(height: 8.0),
              Text('${quiz.quizDuration()} secs',
                style: kDarkTextStyle,
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
                            vertical: 16.0,
                            horizontal: 20.0,
                          ),
                        ),
                        icon: Icon(Icons.share, size: 16.0,),
                        label: Text('Share Result', style: TextStyle(
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
                            vertical: 16.0,
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