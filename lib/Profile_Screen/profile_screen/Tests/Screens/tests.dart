import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/tests/Screens/quiz.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/tests/Screens/quiz1.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/tests/Screens/quiz2.dart';

class Tests extends StatelessWidget {
  static String routeName = "Tests";

  const Tests({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2AAA8A),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          title: const Text(
            "Tests",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),

        /*
        appBar: AppBar(
          backgroundColor: Color(0xFF2AAA8A),
          title: const Text(" tests",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),

         */

        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "test your knowledge",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(const Color(0xFF2AAA8A)),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    elevation: WidgetStateProperty.all<double>(20),
                    shadowColor: WidgetStateProperty.all<Color>(
                        Colors.black.withOpacity(0.9)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const QuizScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Go to Quiz0",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(const Color(0xFF2AAA8A)),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    elevation: WidgetStateProperty.all<double>(20),
                    shadowColor: WidgetStateProperty.all<Color>(
                        Colors.black.withOpacity(0.9)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const QuizScreen1();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Go to Quiz1",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(const Color(0xFF2AAA8A)),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    elevation: WidgetStateProperty.all<double>(20),
                    shadowColor: WidgetStateProperty.all<Color>(
                        Colors.black.withOpacity(0.9)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const QuizScreen2();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Go to Quiz2",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
