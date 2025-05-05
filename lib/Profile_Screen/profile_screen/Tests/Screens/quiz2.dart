import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/tests/Screens/result.dart';
import '../component/nextButton.dart';
import '../data/countOfQuestion.dart';
import '../data/functions.dart';
import '../data/listQuestions2.dart';
import '../data/options.dart';

class QuizScreen2 extends StatefulWidget {
  const QuizScreen2({super.key});

  @override
  State<QuizScreen2> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen2> {
  final QuizLogic quizLogic = QuizLogic(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCF4E6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AAA8A),
        title: const Text(
          "Quiz2",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
           
            QuestionsCounter(
              currentIndex: quizLogic.currentIndex,
              totalQuestions: questions2.length,
            ),
            const SizedBox(height: 23),
            
            Text(
              questions2[quizLogic.currentIndex]
                  ["question"], 
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:Colors.black ,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
           
            Column(
              children: [
                Options(
                  options: questions2[quizLogic.currentIndex]["options"]
                      as List<String>,
                  selectedAnswer: quizLogic.selectedAnswer,
                  onOptionSelected: (option) {
                    setState(() {
                      quizLogic.selectedAnswer = option;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: NextButton(
                  onPressed: () {
                    if (quizLogic.selectedAnswer != null) {
                      setState(() {
                        
                        quizLogic.checkAnswer(
                            questions2[quizLogic.currentIndex]["correctAnswer"]);

                        
                        if (quizLogic.currentIndex == questions2.length - 1) {
                         
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                correctAnswer: quizLogic.correctAnswer,
                                wrongAnswer: quizLogic.wrongAnswer,
                                result:
                                    questions2.length - quizLogic.wrongAnswer,
                                totalOfQuestions: questions2.length,
                                onReset: () {
                                  setState(() {
                                    quizLogic.resetQuiz();
                                  });
                                },
                              ),
                            ),
                          );
                        } else {
                          
                          quizLogic.nextQuestion(questions2.length);
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
    );
  }
}
