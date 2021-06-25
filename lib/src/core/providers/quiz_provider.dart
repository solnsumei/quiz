import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/subject.dart';
import '../models/question.dart';
import '../utils/data.dart';
import '../utils/helpers.dart';


class QuizProvider with ChangeNotifier {
  int? _selectedSubjectIndex;
  int? selectedAnswerIndex;
  bool isRunning = false;
  int _score = 0;
  DateTime? startTime;
  DateTime? endTime;
  int questionIndex = 0;
  List<Question> questionList = [];

  int get selectedSubjectIndex => _selectedSubjectIndex!;
  int get score => _score;
  List<Subject> get subjectList => subjects;

  Subject get selectedQuizSubject => subjects[_selectedSubjectIndex!];
  int get numberOfQuestions => selectedQuizSubject.questions.length;

  void selectQuizSubject(int index) {
    clearValues();
    _selectedSubjectIndex = index;
    questionList = selectedQuizSubject.questions;
    startQuiz();
  }

  void startQuiz() {
    clearValues();
    resetTime();
    isRunning = true;
    notifyListeners();
  }

  void clearValues() {
    _score = 0;
    questionIndex = 0;
    selectedAnswerIndex = null;
    clearTime();
  }

  resetTime() {
    startTime = DateTime.now();
    endTime = null;
  }

  clearTime() {
    startTime = null;
    endTime = null;
  }

  void selectAnswer(int optionIndex) {
    selectedAnswerIndex = optionIndex;
    notifyListeners();
  }

  bool gotoNextQuestion() {
    final Question question = questionList[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      _score += 1;
    }

    if (questionIndex < questionList.length - 1) {
      selectedAnswerIndex = null;
      questionIndex += 1;
      notifyListeners();
      return isRunning;
    }

    endQuiz();
    return false;
  }

  Question getQuestion() {
    return questionList[questionIndex];
  }

  int quizDuration() {
    final Duration difference = endTime!.difference(startTime!);
    return difference.inSeconds;
  }

  void endQuiz() {
    endTime = DateTime.now();
    selectedAnswerIndex = null;
    questionIndex = 0;
    isRunning = false;
  }

  void resetQuiz() {
    clearValues();
    _selectedSubjectIndex = null;
    notifyListeners();
  }

  bool passScore() {
    return (score * 100.0 / selectedQuizSubject.questions.length) > 50.0;
  }

  String resultMessage() {
    return computeResultMessage(passScore());
  }

  static of(BuildContext context, {bool listen: true}) {
    return Provider.of<QuizProvider>(context, listen: listen);
  }
}