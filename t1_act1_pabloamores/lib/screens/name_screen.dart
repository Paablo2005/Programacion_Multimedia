import 'package:flutter/material.dart';
// Importación de Google Fonts para utilizar fuentes personalizadas
import 'package:google_fonts/google_fonts.dart';
// Importación de las pantallas necesarias desde 'screens.dart'
import 'package:t1_act1_pabloamores/screens/screens.dart';

// Definición de un widget Stateless llamado NameScreen
class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Scaffold(
      // AppBar para mostrar el encabezado de la pantalla
      appBar: AppBar(
        title: const Text('Nombre y Repositorio'), // Título de la pantalla
      ),
      // Drawer con el menú de navegación
      drawer: const MyDrawer(),
      // Cuerpo de la pantalla con un Padding para dar espacio alrededor del contenido
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // 16 píxeles de espacio alrededor del contenido
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Los elementos en la columna estarán alineados a la izquierda
          children: [
            // Nombre con una fuente personalizada usando Google Fonts (fuente Abel)
            Text(
              'Pablo Amores Muñoz',
              style: GoogleFonts.abel(
                  fontSize: 34), // Estilo de texto con tamaño de fuente 34
            ),
            const SizedBox(
                height: 10), // Espacio de 10 píxeles entre los elementos
            // Enlace al repositorio de GitHub con estilo en cursiva
            const Text(
              'https://github.com/tuRepositorio',
              style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle
                      .italic), // Estilo en cursiva con tamaño de fuente 18
            ),
          ],
        ),
      ),
    );
  }
}
