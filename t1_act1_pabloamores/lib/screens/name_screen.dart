import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre y Repositorio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pablo Amores Muñoz',
              style: GoogleFonts.abel(fontSize: 34),
            ),
            const SizedBox(height: 10),
            const Text(
              'https://github.com/tuRepositorio',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
