//new
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen.dart';

class ProgressScreen extends StatefulWidget {
  static const String routeName = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _joinedController = TextEditingController();

  List<bool> completedQuizzes = List.filled(4, false); // تعديل الحجم إلى 4
  List<int> scores = List.filled(4, 0); // تعديل الحجم إلى 4
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadProgress();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _joinedController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;

        setState(() {
          _fullNameController.text = data?['FullName'] ?? user.displayName ?? '';
          _emailController.text = user.email ?? '';
          _ageController.text = data?['Age']?.toString() ?? '';
          _joinedController.text = (data?['joined_date'] ?? DateTime.now().toString());
        });
      }
    }
  }

  Future<void> _loadProgress() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        setState(() {
          for (int i = 0; i < 4; i++) {  // تعديل الحلقة لتشمل 4
            String quizKey = 'quiz${i + 1}';
            var quizData = (doc.data() as Map<String, dynamic>)[quizKey] ?? {};
            completedQuizzes[i] = quizData['completed'] ?? false;
            scores[i] = quizData['score'] ?? 0;
          }
          progress =
              (completedQuizzes.where((q) => q).length / completedQuizzes.length) * 100;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2AAA8A),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: const Icon(Icons.arrow_back, color: Colors.black, size: 25),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 3.1),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 80),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _fullNameController.text.isNotEmpty
                                      ? _fullNameController.text
                                      : 'Full Name',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _emailController.text.isNotEmpty
                                      ? _emailController.text
                                      : 'Email',
                                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _ageController.text.isNotEmpty
                                      ? 'Age: ${_ageController.text}'
                                      : 'Age: Unknown',
                                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _joinedController.text.isNotEmpty
                                      ? 'Joined: ${_joinedController.text}'
                                      : 'Joined: Unknown',
                                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                                ),
                                const SizedBox(height: 15),
                                const Divider(color: Colors.grey, thickness: 0.5),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2AAA8A),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.assessment_rounded,
                                          color: Colors.black, size: 30),
                                      SizedBox(width: 10),
                                      Text(
                                        'Progress',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                _buildProgressBar(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 - 70,
            left: MediaQuery.of(context).size.width / 2 - 65,
            child: const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/images/Vector 33.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        Text('Progress: ${progress.toStringAsFixed(0)}%',
            style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: progress / 100,
          minHeight: 10,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(completedQuizzes.length, (index) { // تعديل الرقم هنا
            return Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: completedQuizzes[index] ? Colors.green : Colors.grey[300],
                  child: Text(
                    'Q${index + 1}',
                    style: TextStyle(
                      color: completedQuizzes[index] ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text('Score: ${scores[index]}',
                    style: const TextStyle(fontSize: 14)),
              ],
            );
          }),
        ),
      ],
    );
  }
}
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen.dart';

class ProgressScreen extends StatefulWidget {
  static const String routeName = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _joinedController = TextEditingController();

  List<bool> completedQuizzes = List.filled(3, false);
  List<int> scores = List.filled(3, 0);
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadProgress();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _joinedController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;

        setState(() {
          _fullNameController.text =
              data?['FullName'] ?? user.displayName ?? '';
          _emailController.text = user.email ?? '';
          _ageController.text = data?['Age']?.toString() ?? '';
          _joinedController.text =
              (data?['joined_date'] ?? DateTime.now().toString());
        });
      }
    }
  }

  Future<void> _loadProgress() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        setState(() {
          for (int i = 0; i < 3; i++) {
            String quizKey = 'quiz${i + 1}';
            var quizData = (doc.data() as Map<String, dynamic>)[quizKey] ?? {};
            completedQuizzes[i] = quizData['completed'] ?? false;
            scores[i] = quizData['score'] ?? 0;
          }
          progress = (completedQuizzes.where((q) => q).length /
                  completedQuizzes.length) *
              100;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2AAA8A),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child:
                  const Icon(Icons.arrow_back, color: Colors.black, size: 25),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 3.1),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 80),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _fullNameController.text.isNotEmpty
                                      ? _fullNameController.text
                                      : 'Full Name',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _emailController.text.isNotEmpty
                                      ? _emailController.text
                                      : 'Email',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _ageController.text.isNotEmpty
                                      ? 'Age: ${_ageController.text}'
                                      : 'Age: Unknown',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _joinedController.text.isNotEmpty
                                      ? 'Joined: ${_joinedController.text}'
                                      : 'Joined: Unknown',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                const SizedBox(height: 15),
                                const Divider(
                                    color: Colors.grey, thickness: 0.5),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2AAA8A),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.assessment_rounded,
                                          color: Colors.black, size: 30),
                                      SizedBox(width: 10),
                                      Text(
                                        'Progress',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                _buildProgressBar(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 - 70,
            left: MediaQuery.of(context).size.width / 2 - 65,
            child: const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/images/Vector 33.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        Text('Progress: ${progress.toStringAsFixed(0)}%',
            style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: progress / 100,
          minHeight: 10,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(completedQuizzes.length, (index) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor:
                      completedQuizzes[index] ? Colors.green : Colors.grey[300],
                  child: Text(
                    'Q${index + 1}',
                    style: TextStyle(
                      color:
                          completedQuizzes[index] ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text('Score: ${scores[index]}',
                    style: const TextStyle(fontSize: 14)),
              ],
            );
          }),
        ),
      ],
    );
  }
}
