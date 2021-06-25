import 'package:flutter/material.dart';
import '../../core/providers/quiz_provider.dart';
import 'result_screen.dart';
import '../widgets/constants.dart';


class QuizScreen extends StatelessWidget {
  static const routeName = '/quizScreen';


  @override
  Widget build(BuildContext context) {
    final quiz = QuizProvider.of(context);
    final question = quiz.getQuestion();

    return Scaffold(
      appBar: AppBar(
        title: Text("${quiz.selectedQuizSubject!.name} Quiz"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Question',
                        style: kDarkTextStyle,
                      ),
                      SizedBox(width: 4.0),
                      Text('${quiz.questionIndex + 1}',
                        style: kDarkTextStyle.copyWith(fontSize: 22),
                      ),
                      Text('/${quiz.questionList.length}',
                        style: kNormalTextStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: quiz.questionList.map<Widget>((item) {
                      final bool shouldHighlight =
                          quiz.questionList.indexOf(item) + 1 == question.id;

                      return Expanded(
                        child: Container(
                        color: shouldHighlight
                        ? Colors.grey[800]
                        : Colors.grey,
                    height: shouldHighlight
                        ? 3.0
                        : 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                  ),);
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
              width: double.infinity,
              child: Text(question.question,
                style: kDarkTextStyle.copyWith(fontSize: 18),
              ),
            ),
            SizedBox(height: 25.0),
            Expanded(
              child: ListView.builder(
                itemCount: question.answers.length,
                itemBuilder: (context, index) {
                  bool isSelected = quiz.selectedAnswerIndex != null
                      && quiz.selectedAnswerIndex == index;

                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: isSelected ? 1.5 : 0.8,
                        color: isSelected ? Colors.green : Colors.grey,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(!isSelected
                          ? Icons.circle_outlined
                          : Icons.check_circle_rounded,
                          color: isSelected ? Colors.green: Colors.grey),
                      title: Text(question.answers[index],
                          style: TextStyle(fontSize: 15.0)),
                      enableFeedback: true,
                      onTap: () {
                        quiz.selectAnswer(index);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: quiz.isRunning && quiz.selectedAnswerIndex != null
                         ? () {
                            final quizResult = quiz.gotoNextQuestion();
                            if (!quizResult) {
                              Navigator.of(context).pushNamed(ResultScreen.routeName);
                            }
                         } : null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ),
                        child: Text('Next'),
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
    );
  }
}