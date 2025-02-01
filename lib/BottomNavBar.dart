import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mini_coder/home/home_screen.dart';
import 'package:mini_coder/home/profile_screen.dart';
import 'package:mini_coder/home/setting_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar({required this.selectedIndex, required this.onTap, Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: widget.selectedIndex,
      height: 65.0,
      items: const [
        Icon(Icons.home, size: 33, color: Colors.black),
        Icon(Icons.person, size: 33, color: Colors.black),
        Icon(Icons.settings, size: 33, color: Colors.black),
      ],
      color: const Color(0xFF2AAA8A),
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: widget.onTap,
    );
  }
}
