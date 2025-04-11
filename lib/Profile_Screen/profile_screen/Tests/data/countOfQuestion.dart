import 'package:flutter/material.dart';

class QuestionsCounter extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;

  const QuestionsCounter({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Question  ${currentIndex + 1}  out of  $totalQuestions", 
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}