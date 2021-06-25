import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/providers/quiz_provider.dart';
import '../../core/models/subject.dart';
import 'quiz_screen.dart';
import '../widgets/constants.dart';

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
                  SizedBox(height: 8.0),
                  Text(item.name, style: kDarkTextStyle.copyWith(fontSize: 16),),
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
                height: 380,
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome User!',
                      style: kBoldDarkTextStyle.copyWith(
                        fontSize: 28,
                        color: Colors.blue.shade50,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text('Choose a test to begin your quiz',
                      style: kDarkTextStyle.copyWith(
                        fontSize: 18,
                        color: Colors.blue.shade200,
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    SizedBox(
                      height: 220,
                      child: SvgPicture.asset('images/online_test.svg'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Available Tests',
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: getSubjects(context, quiz),
                ),
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}