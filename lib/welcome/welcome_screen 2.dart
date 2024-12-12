import 'package:flutter/material.dart';
import 'package:mini_coder/home/home_screen.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});
  static const String routeName='Welcome 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2AAA8A),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Positioned(
              child: Image.asset('assets/images/welcome_screen 1.png'),
            ),
          ],
        ),
      ),

    );
  }
}