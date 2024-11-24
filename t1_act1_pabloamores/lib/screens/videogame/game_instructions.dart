import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class GameInstructions extends StatefulWidget {
  const GameInstructions({super.key});

  @override
  GameInstructionsState createState() => GameInstructionsState();
}

class GameInstructionsState extends State<GameInstructions> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.randomPhotos);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '¡¡¡Aplasta a los insectooos!!!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
