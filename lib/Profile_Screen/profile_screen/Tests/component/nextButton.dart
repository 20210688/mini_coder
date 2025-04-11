import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          const Color(0xFF2AAA8A),
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        ),
        elevation: WidgetStateProperty.all<double>(20),
        shadowColor: WidgetStateProperty.all<Color>(
          Colors.black.withOpacity(0.9),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
        "Next",
        style: TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 250, 248, 248),
        ),
      ),
    );
  }
}