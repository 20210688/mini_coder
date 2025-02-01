import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mini_coder/home/home_screen.dart';
import 'package:mini_coder/login/login.dart';
import 'package:mini_coder/login/sign up.dart';
import 'package:mini_coder/home/profile_screen.dart';
import 'package:mini_coder/home/setting_screen.dart';
import 'package:mini_coder/home/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignInScreen.routeName,
      routes: {
        SignInScreen.routeName: (context) => SignInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        BottomNavScreen.routeName: (context) => const BottomNavScreen(),
        HomePage.routeName: (context) => HomePage(),
    profile_screen.routeName: (context) => profile_screen(),
        setting_screen.routeName: (context) => setting_screen(),
      },
      home: const BottomNavScreen(),

    );
  }
}