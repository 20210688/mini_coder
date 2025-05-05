import 'package:flutter/material.dart';

class NextQuizButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextQuizButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2AAA8A),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
        "Go to the Next Level",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
