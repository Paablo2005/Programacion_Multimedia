import 'package:flutter/material.dart';

// Definición de un widget Stateless llamado StatColumn
class StatColumn extends StatelessWidget {
  // Variables que se pasan al constructor de StatColumn
  final String number; // Número que se mostrará en la parte superior
  final String label; // Etiqueta o texto que se mostrará debajo del número

  // Constructor de la clase, recibe 'number' y 'label' como parámetros
  const StatColumn(this.number, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Column(
      // Utilizamos un widget Column para apilar los elementos verticalmente
      children: [
        // Primer elemento: el número, se muestra en negrita
        Text(
          number,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5), // Espacio entre el número y la etiqueta
        // Segundo elemento: la etiqueta, texto debajo del número
        Text(label),
      ],
    );
  }
}
