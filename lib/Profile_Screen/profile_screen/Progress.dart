/*


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/Tests/tests.dart';

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

  @override
  void initState() {
    super.initState();
    _loadUserData();
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
          _joinedController.text = data?['joined_date'] ?? 'Unknown';
        });
      } else {
        debugPrint("User document does not exist.");
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
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
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
                          Center(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _fullNameController.text.isNotEmpty
                                        ? _fullNameController.text
                                        : 'Full Name',
                                    style: TextStyle(
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
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    _ageController.text.isNotEmpty
                                        ? 'Age: ${_ageController.text}'
                                        : 'Age: Unknown',
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    _joinedController.text.isNotEmpty
                                        ? 'Joined: ${_joinedController.text}'
                                        : 'Joined: Unknown',
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 15),
                                  Divider(color: Colors.grey, thickness: 0.5),
                                  const SizedBox(height: 20),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2AAA8A),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.assessment_rounded, color: Colors.black, size: 30),
                                        SizedBox(width: 10),
                                        Text(
                                          'Progress',
                                          style: TextStyle(fontSize: 20, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  // Add ProgressBar here
                                  ProgressBar(),
                                ],
                              ),
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
            child: CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/images/Vector 33.png'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 20,
            left: MediaQuery.of(context).size.width / 2 + 20,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage('assets/images/Ellipse 7.png'),
              ),
            ),
          ),


        ],
      ),
    );
  }
}

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  int selectedLevel = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            progressCircle(context, 0, 'Newbie'),
            progressLine(),
            progressCircle(context, 1, 'Beginner'),
            progressLine(),
            progressCircle(context, 2, 'Intermediate'),
            progressLine(),
            progressCircle(context, 3, 'Advanced'),
          ],
        ),
      ],
    );
  }

  Widget progressCircle(BuildContext context, int level, String label) {
    bool isSelected = selectedLevel == level;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLevel = level;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>Tests()),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: isSelected ? Colors.green : Colors.white,
            child: Text(
              level.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            foregroundColor: Colors.black,
          ),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget progressLine() {
    return Container(
      width: 40,
      height: 3,
      color: Colors.black,
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

  List<bool> completedQuizzes = [
    false,
    false,
    false,
    false
  ]; // Quiz completion states
  List<int> scores = [0, 0, 0, 0]; // Store quiz scores
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

  // Load user data from Firebase
  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;

        setState(() {
          _fullNameController.text =
              data?['FullName'] ?? user.displayName ?? '';
          _emailController.text = user.email ?? '';
          _ageController.text = data?['Age']?.toString() ?? '';
          _joinedController.text = data?['joined_date'] ?? 'Unknown';
        });
      } else {
        debugPrint("User document does not exist.");
      }
    }
  }

  // Load quiz progress from Firebase
  Future<void> _loadProgress() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection(
          'users').doc(user.uid).get();

      if (doc.exists) {
        bool quiz1Completed = doc['quiz1']['completed'] ?? false;
        int quiz1Score = doc['quiz1']['score'] ?? 0;

        bool quiz2Completed = doc['quiz2']['completed'] ?? false;
        int quiz2Score = doc['quiz2']['score'] ?? 0;

        bool quiz3Completed = doc['quiz3']['completed'] ?? false;
        int quiz3Score = doc['quiz3']['score'] ?? 0;

        bool quiz4Completed = doc['quiz4']['completed'] ?? false;
        int quiz4Score = doc['quiz4']['score'] ?? 0;

        setState(() {
          completedQuizzes =
          [quiz1Completed, quiz2Completed, quiz3Completed, quiz4Completed];
          scores = [quiz1Score, quiz2Score, quiz3Score, quiz4Score];
          progress = (completedQuizzes
              .where((quiz) => quiz)
              .length / completedQuizzes.length) * 100;
        });
      }
    } else {
      print("User document does not exist.");
    }
  }


  // Mark a quiz as complete in Firebase
  Future<void> _markQuizComplete(int quizIndex, int score) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !completedQuizzes[quizIndex]) {
      await updateProgress(user.uid, quizIndex, score);
      setState(() {
        completedQuizzes[quizIndex] = true;
        scores[quizIndex] = score;
        progress = (completedQuizzes.where((quiz) => quiz).length / completedQuizzes.length) * 100;
      });
    }
  }

  // Update quiz progress in Firebase
  Future<void> updateProgress(String userId, int quizIndex, int score) async {
    DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    DocumentSnapshot doc = await userRef.get();
    if (doc.exists) {
      String quizField = 'quiz${quizIndex + 1}';

      await userRef.update({
        '$quizField.completed': true,
        '$quizField.score': score,
      });
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
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
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
                          Center(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _fullNameController.text.isNotEmpty
                                        ? _fullNameController.text
                                        : 'Full Name',
                                    style: TextStyle(
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
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    _ageController.text.isNotEmpty
                                        ? 'Age: ${_ageController.text}'
                                        : 'Age: Unknown',
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    _joinedController.text.isNotEmpty
                                        ? 'Joined: ${_joinedController.text}'
                                        : 'Joined: Unknown',
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 15),
                                  Divider(color: Colors.grey, thickness: 0.5),
                                  const SizedBox(height: 20),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2AAA8A),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.assessment_rounded, color: Colors.black, size: 30),
                                        SizedBox(width: 10),
                                        Text(
                                          'Progress',
                                          style: TextStyle(fontSize: 20, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  ProgressBar(
                                    progress: progress,
                                    completedQuizzes: completedQuizzes,
                                    scores: scores,
                                  ),
                                ],
                              ),
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
            child: CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/images/Vector 33.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double progress;
  final List<bool> completedQuizzes;
  final List<int> scores;

  ProgressBar({
    required this.progress,
    required this.completedQuizzes,
    required this.scores,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Progress: ${progress.toStringAsFixed(0)}%', style: TextStyle(fontSize: 18)),
        SizedBox(height: 10),
        LinearProgressIndicator(
          value: progress / 100,
          minHeight: 10,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: completedQuizzes[index] ? Colors.green : Colors.white,
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: completedQuizzes[index] ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (completedQuizzes[index])
                  Text('Score: ${scores[index]}', style: TextStyle(fontSize: 16)),
              ],
            );
          }),
        ),
      ],
    );
  }
}





