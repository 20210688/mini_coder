import 'package:flutter/material.dart';

class ButtonData extends StatelessWidget {
  const ButtonData({super.key, this.onResete});
  final Function()? onResete;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
                const  Color(0xFF2AAA8A)),
            padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            ),
            elevation: WidgetStateProperty.all<double>(20),
            shadowColor:
                WidgetStateProperty.all<Color>(Colors.black.withOpacity(0.9)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onPressed: () {
            onResete?.call();
            Navigator.pop(context);
          },
          child: const Text(
            "Reset  Quiz",
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
