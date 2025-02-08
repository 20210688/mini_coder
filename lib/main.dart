import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen.dart';
import 'package:mini_coder/Setting_Screen/setting_screen.dart';
import 'package:mini_coder/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_coder/home/home_screen.dart';
import 'package:mini_coder/login/login.dart';
import 'package:mini_coder/login/sign%20up.dart';
import 'package:mini_coder/welcome/welcome_screen%201.dart';
import 'package:mini_coder/welcome/welcome_screen%202.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
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
        HomeScreen.routeName: (context) => HomeScreen(),
        SignInScreen.routeName: (context) => SignInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        WelcomeScreen1.routeName: (context) => WelcomeScreen1(),
        WelcomeScreen2.routeName: (context) => WelcomeScreen2(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        SettingScreen.routeName: (context) => SettingScreen(),
      },
    );
  }
}
