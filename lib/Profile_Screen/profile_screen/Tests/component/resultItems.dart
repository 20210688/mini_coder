import 'package:flutter/material.dart';

class ItemsData extends StatelessWidget {
  const ItemsData(
      {super.key,
      required this.correctAnswer,
      required this.wrongAnswer,
      required this.result,
      required this.totalOfQuestions});
  final int correctAnswer;
  final int wrongAnswer;
  final int result;
  final int totalOfQuestions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 208, 227, 238),
                  borderRadius: BorderRadius.circular(13)),
              width: 170,
              height: 80,
              child: Text(
                "Correct Answers: ${this.correctAnswer}",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 208, 227, 238),
                  borderRadius: BorderRadius.circular(13)),
              width: 170,
              height: 80,
              child: Text(
                "Wrong Answers: $wrongAnswer",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        const SizedBox(height: 50),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 131, 196, 234),
              borderRadius: BorderRadius.circular(15)),
          width: 300,
          height: 70,
          child: Center(
            child: Text(
              "Your Degree is :    $result  /  $totalOfQuestions  ",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 18, 18, 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
