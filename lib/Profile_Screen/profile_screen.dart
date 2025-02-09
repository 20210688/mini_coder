import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/Edit_profile.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/Progress.dart';
import 'package:mini_coder/Profile_Screen/profile_screen/Tests/tests.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'profile_screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2AAA8A),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'User Name',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Joined DD/MM/YY',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Age',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Date Of Birth',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 0.5,
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2AAA8A),
                                    borderRadius: BorderRadius.circular(
                                        20), // Border radius applied to the entire row
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.assessment_rounded,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Progress',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                ProgressScreen.routeName);
                                          },
                                          child: Icon(Icons.arrow_forward_ios,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2AAA8A),
                                    borderRadius: BorderRadius.circular(
                                        20), // Border radius applied to the entire row
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.account_circle,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, EditProfile.routeName);
                                          },
                                          child: Icon(Icons.arrow_forward_ios,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2AAA8A),
                                    borderRadius: BorderRadius.circular(
                                        20), // Border radius applied to the entire row
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.question_answer_outlined,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Tests',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, Tests.routeName);
                                          },
                                          child: Icon(Icons.arrow_forward_ios,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
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
            left: MediaQuery.of(context).size.width / 3 - 70,
            child: CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/images/Vector (2).png'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 20,
            left: MediaQuery.of(context).size.width / 3 + 20,
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
