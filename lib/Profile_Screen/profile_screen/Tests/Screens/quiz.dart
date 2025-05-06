import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/tests/Screens/result.dart';
import '../component/nextButton.dart';
import '../data/countOfQuestion.dart';
import '../data/functions.dart';
import '../data/listQuestions.dart';
import '../data/options.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizLogic quizLogic = QuizLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCF4E6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AAA8A),
        title: const Text(
          "quiz0",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              QuestionsCounter(
                currentIndex: quizLogic.currentIndex,
                totalQuestions: questions.length,
              ),
              const SizedBox(height: 23),
              Text(
                questions[quizLogic.currentIndex]["question"],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Options(
                options: questions[quizLogic.currentIndex]["options"]
                    as List<String>,
                selectedAnswer: quizLogic.selectedAnswer,
                onOptionSelected: (option) {
                  setState(() {
                    quizLogic.selectedAnswer = option;
                  });
                },
              ),
              const SizedBox(height: 100),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: NextButton(
                    onPressed: () {
                      if (quizLogic.selectedAnswer != null) {
                        setState(() {
                          quizLogic.checkAnswer(
                              questions[quizLogic.currentIndex]
                                  ["correctAnswer"]);

                          if (quizLogic.currentIndex == questions.length - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  correctAnswer: quizLogic.correctAnswer,
                                  wrongAnswer: quizLogic.wrongAnswer,
                                  result:
                                      questions.length - quizLogic.wrongAnswer,
                                  totalOfQuestions: questions.length,
                                  quizIndex: 0,
                                  onReset: () {
                                    setState(() {
                                      quizLogic.resetQuiz();
                                    });
                                  },
                                ),
                              ),
                            );
                          } else {
                            quizLogic.nextQuestion(questions.length);
                          }
                        });
                      }
                    },
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
