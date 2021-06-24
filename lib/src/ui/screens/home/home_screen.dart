import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dev Quiz'),
      ),
      body: Center(
        child: Text('Quiz App'),
      ),
    );
  }
}