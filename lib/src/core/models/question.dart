class Question {
  final int id;
  final String question;
  final int correctAnswerIndex;

  final List<String> answers;

  Question(this.id, this.question, this.correctAnswerIndex, this.answers);
}