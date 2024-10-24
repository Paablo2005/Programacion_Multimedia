import 'package:flutter/material.dart';

class StatColumn extends StatelessWidget {
  final String number;
  final String label;

  const StatColumn(this.number, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
