import 'question.dart';

class Subject {
  final int id;
  final String name;
  final String icon;
  List<Question> questions;

  Subject(this.id, this.name, this.icon, this.questions);
}