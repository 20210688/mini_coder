import 'package:flutter/material.dart';
import 'package:mini_coder/home/home_screen.dart';
import 'package:mini_coder/login/login.dart';
import 'package:mini_coder/login/sign%20up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:SignUpScreen.routeName ,
      routes:{
        HomeScreen.routeName:(context) =>  HomeScreen(),
        SignInScreen.routeName:(context) => SignInScreen(),
        SignUpScreen.routeName:(context)=> SignUpScreen(),
      },

    );
  }
}
