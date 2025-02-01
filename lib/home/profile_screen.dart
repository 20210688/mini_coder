import 'package:flutter/material.dart';

class profile_screen extends StatelessWidget {

  static const String routeName = 'profile_screen';


  const profile_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'User Profile Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}