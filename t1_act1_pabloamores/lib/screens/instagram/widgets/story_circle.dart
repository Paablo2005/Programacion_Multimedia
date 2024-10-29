import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final String label;
  final String imagePath;

  const StoryCircle(this.label, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
