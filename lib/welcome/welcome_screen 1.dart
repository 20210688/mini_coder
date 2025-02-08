import 'package:flutter/material.dart';
import 'package:mini_coder/welcome/welcome_screen%202.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});
  static const String routeName = 'Welcome 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/Vector3.png',
              ),
            ),
            Positioned(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WelcomeScreen2.routeName);
                },
                child: Image.asset('assets/images/welcome_screen 1.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
