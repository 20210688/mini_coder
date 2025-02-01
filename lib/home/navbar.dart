import 'package:flutter/material.dart';
import 'package:mini_coder/home/home_screen.dart';
import 'package:mini_coder/home/profile_screen.dart';
import 'package:mini_coder/home/setting_screen.dart';
import 'package:mini_coder/BottomNavBar.dart';

class BottomNavScreen extends StatefulWidget {
  static const String routeName = '/bottom-nav';

  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    profile_screen(),
    setting_screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, profile_screen.routeName);
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, setting_screen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
