import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = 'setting_screen';



  const SettingScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'setting Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}