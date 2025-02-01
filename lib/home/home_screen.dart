import 'package:flutter/material.dart';
import 'package:mini_coder/home/profile_screen.dart';
import 'package:mini_coder/home/setting_screen.dart';
import 'package:mini_coder/levels/levelzero_videos.dart';
import 'package:mini_coder/home/navbar.dart';

import '../BottomNavBar.dart';

class HomePage extends StatelessWidget {
  static var routeName='Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0, // Set the initial selected index
        onTap: (index) {
          // Handle navigation based on the selected index
          if (index == 0) {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, profile_screen.routeName);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, setting_screen.routeName);
          }
        },
      ),
      appBar: AppBar(
        title: Text('Mini Coder'),
        centerTitle: true,
        backgroundColor: Color(0xFF2AAA8A),
      ),
      body: Container(
        color: Colors.greenAccent[50],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3, // عدد المستويات
                itemBuilder: (context, index) {
                  bool isLocked = index != 0;

                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LevelzeroVideos(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Level $index is locked!')),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Color(0xFF2AAA8A),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Level $index',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                isLocked ? Icons.lock : Icons.lock_open,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
