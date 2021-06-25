import 'package:flutter/material.dart';
import '../../core/providers/quiz_provider.dart';
import '../../core/models/subject.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {

  List<Widget> getSubjects(BuildContext context, QuizProvider quizProvider) {
    final subjectList = quizProvider.subjectList;
    return subjectList.map((Subject item) =>
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: MaterialButton(
              onPressed: () {
                quizProvider.selectQuizSubject(subjectList.indexOf(item));
                Navigator.of(context).pushNamed(QuizScreen.routeName);
              },
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                children: [
                  Image.asset("images/${item.icon}"),
                  Text(item.name),
                ],
              ),
            ),
          ),
        ),).toList();
  }

  @override
  Widget build(BuildContext context) {
    final quiz = QuizProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 120,
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome User',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade200,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text('Taking a quiz today?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade50,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Top Subjects',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: getSubjects(context, quiz),
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: Text('Click any of the subjects above to start',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: Text('Good luck!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}