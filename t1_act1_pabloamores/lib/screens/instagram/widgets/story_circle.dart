import 'package:flutter/material.dart';

// Definición de un widget Stateless llamado StoryCircle
class StoryCircle extends StatelessWidget {
  // Variables que se pasan al constructor de StoryCircle
  final String label; // Etiqueta que se mostrará debajo del círculo
  final String imagePath; // Ruta de la imagen que se mostrará en el círculo

  // Constructor de la clase, recibe 'label' y 'imagePath' como parámetros
  const StoryCircle(this.label, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Padding(
      // Se aplica un Padding horizontal de 8.0 píxeles alrededor del widget
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        // Utilizamos un widget Column para apilar los elementos verticalmente
        children: [
          // Primer elemento: el círculo con la imagen
          CircleAvatar(
            radius: 30, // Radio del círculo (tamaño)
            backgroundImage:
                AssetImage(imagePath), // Carga la imagen desde los assets
            backgroundColor: Colors
                .grey[300], // Color de fondo en caso de que no haya imagen
          ),
          const SizedBox(height: 5), // Espacio entre el círculo y la etiqueta
          // Segundo elemento: la etiqueta (texto debajo del círculo)
          Text(
            label,
            style: const TextStyle(
                fontSize: 12), // Estilo de texto para la etiqueta
          ),
        ],
      ),
    );
  }
}
