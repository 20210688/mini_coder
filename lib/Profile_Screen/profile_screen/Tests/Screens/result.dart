/*
import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/tests/Screens/tests.dart';

import '../component/nextquizButton.dart';
import '../component/resetButton.dart';
import '../component/resultItems.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswer;
  final int wrongAnswer;
  final int result;
  final int totalOfQuestions;
  final VoidCallback onReset;
  const ResultPage(
      {super.key,
      required this.correctAnswer,
      required this.wrongAnswer,
      required this.result,
      required this.totalOfQuestions,
      required this.o, required int quizIn, required int quizIndexdexnReset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF2AAA8A),
          title: const Text(" Result",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemsData(
                    correctAnswer: correctAnswer,
                    wrongAnswer: wrongAnswer,
                    result: result,
                    totalOfQuestions: totalOfQuestions,
                  )),
            ),

            ButtonData(onResete: onReset),
            NextQuizButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const  Tests();
                  },
                ),
              );
            },),
          ],
        ));
  }
}
*/

import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/tests/Screens/tests.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../component/nextquizButton.dart';
import '../component/resetButton.dart';
import '../component/resultItems.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswer;
  final int wrongAnswer;
  final int result;
  final int totalOfQuestions;

  final int quizIndex;
  final VoidCallback onReset;

  const ResultPage({
    super.key,
    required this.correctAnswer,
    required this.wrongAnswer,
    required this.result,
    required this.totalOfQuestions,
    required this.quizIndex,
    required this.onReset,
  });

  Future<void> _updateUserQuizResult() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String quizField = 'quiz${quizIndex + 1}';
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        '$quizField.completed': true,
        '$quizField.score': result,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // تأكد من حفظ النتيجة عند عرض الصفحة
    _updateUserQuizResult();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF2AAA8A),
        title: const Text(" Result",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ItemsData(
                correctAnswer: correctAnswer,
                wrongAnswer: wrongAnswer,
                result: result,
                totalOfQuestions: totalOfQuestions,
              ),
            ),
          ),
          ButtonData(onResete: onReset),
          NextQuizButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tests()),
              );
            },
          ),
        ],
      ),
    );
  }
}
