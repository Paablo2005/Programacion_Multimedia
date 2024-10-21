import 'package:flutter/material.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Íconos'),
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, size: 50),
          Icon(Icons.star, size: 50),
          Icon(Icons.person, size: 50),
          Icon(Icons.settings, size: 50),
          Icon(Icons.phone, size: 50),
        ],
      ),
    );
  }
}
