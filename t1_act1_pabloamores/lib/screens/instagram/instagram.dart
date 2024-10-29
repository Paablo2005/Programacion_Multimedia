import 'package:flutter/material.dart';
import 'mi_instagram.dart';

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Instagram de Pablo",
      home: MiInstagram(),
      debugShowCheckedModeBanner: false,
    );
  }
}
