import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final List<String> options;
  final String? selectedAnswer;
  final Function(String) onOptionSelected;

  const Options({
    super.key,
    required this.options,
    required this.selectedAnswer,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var option in options)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                onOptionSelected(option);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedAnswer == option
                    ? Colors.blue
                    : Colors.grey[300],
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 22,
                  color: selectedAnswer == option
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
      ],
    );
  }
}