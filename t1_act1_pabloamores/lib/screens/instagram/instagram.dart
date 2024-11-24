import 'package:flutter/material.dart';
import 'package:t1_act1_pabloamores/screens/screens.dart';

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
